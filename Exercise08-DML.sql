-- 01.請啟用交易控制模式，執行以下動作刪除，除了老闆以外的所有員工之資料，查詢確認是否已刪除，還原

set autocommit = on;
select @@autocommit;
delete from EMP where MGR is not null;
select * from EMP;
rollback;
select * from EMP;

-- 02.請開啟單一交易控制，執行以下動作：修改除了老闆以外的所有員工，獎金+1000 、薪水 +15%，查詢確認是否已修改，送交
start transaction;
	update EMP set COMM = ifnull(COMM,0) + 1000 where MGR is not null;
    update EMP set SAL = SAL * 1.15 where MGR is not null;
    select * from EMP;
commit;

-- 03.今天公司空降了一位主管 ERIC ，員工編號 6666 ，職稱 : MANAGER ，主管 7839，薪資3500 ，部門編號 50，另外原本就在職的2 位員工 7499 、 7844 調至部門編號 50 ，且主管改為 6666，請開啟單一交易控制，將上述動作在一個交易內完成
start transaction;
	insert into EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
	values(6666, 'ERIC', 'MANAGER', 7839, NOW(), 3500, 50);
    update EMP set DEPTNO = 50 , MGR = 6666 where EMPNO = 7499;
    update EMP set DEPTNO = 50 , MGR = 6666 where EMPNO = 7844;
    select * from EMP;
commit;