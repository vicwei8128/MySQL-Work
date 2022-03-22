select * from DEPT;
select * from EMP;

-- 01.請新增以下資料至資料表 DEPT
insert into DEPT(DEPTNO, DNAME, LOC)
values(50, 'Software', 'Taipei');

-- 02.請新增以下資料至資料表 EMP 的欄位 EMPNO, ENAME, JOB, MGR, HIREDATE, SAL,DEPTNO

insert into EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
values(9999, 'William', 'PG', null, NOW(), 2500, 50),
	  (8888, 'Lee', 'PM', null, NOW(), 3500, 50);
      
      
-- 03.請修改資料表 EMP 的資料，員工8888 的主管改為 7839，員工9999 的主管改為 8888（提示: 可配合 case 運算式，將 2 個敘述合併成 1 個敘述！）

-- 方法一
update EMP
set MGR = 7839 where EMPNO = 8888;
update EMP
set MGR = 8888 where EMPNO = 9999;
select * from EMP;

-- 方法二
update EMP
set MGR = case 
when empno = 8888 then 7839 
when empno = 9999 then 8888 
else MGR #避免除了以上的值變成null
end;
select * from EMP;

-- 04.請刪除員工編號為 8888 的員工之資料
delete from EMP where EMPNO = 8888;

-- 05.請修改資料表 EMP 的資料，員工9999的主管改為7839，薪水改為4000
update EMP
set
	MGR = 7839,
    SAL = 4000
where EMPNO = 9999;
select * from EMP;

