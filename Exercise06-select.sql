select * from EMP;
select * from DEPT;
select * from SAL_LEVEL;

-- 01.請列出薪資比所有 SALESMAN 還低的員工
select * from EMP
where
	SAL < (select min(SAL)
		from EMP
        where JOB = 'SALESMAN'
		group by JOB
		);
    
-- 02.請列出到職年 到職日之年 最早的兩年，那兩年到職的員工，並依到職日排序
select * from EMP e1
where
year(e1.HIREDATE) in (select HIREYEAR.*
                      from
                      (select distinct year(e2.HIREDATE) 
                      from EMP e2
                      limit 2 #找出最早的兩年
                      ) as HIREYEAR)
order by e1.HIREDATE asc;

-- 03.請列出主管的主管是 KING 的員工
select * from EMP
where MGR in #用找出的員工編號找員工
		(select e2.EMPNO
			 from EMP e1
				join EMP e2
					on e1.EMPNO = e2.MGR #先找出主管是KING的員工編號
						where e1.ENAME like 'KING');

-- 04.請列出部門內員工薪資有 3 種薪資等級之部門名稱、部門所在地(去重複算數量)
select d.DNAME, d.LOC , count(distinct a.LEVEL) as DLEVEL #去除薪資等級重複算數量
	from
	(select * from EMP e1
		join SAL_LEVEL sl
			on e1.SAL between sl.SAL_MIN and sl.SAL_MAX #找出薪資等級
            ) as a
	join DEPT d
		on a.DEPTNO = d.DEPTNO #連結a的EMP表的DEPTNO=DEPT的DEPTNO
	group by d.DNAME, d.LOC #群組
    having DLEVEL >= 3;#找出不同薪資種類大於等於3的
    

-- 05.請列出跟員工姓名最後一字元是 S 的員工同部門，該部門薪資最低的員工之部門名稱、姓名、薪資
select d.DNAME, e.ENAME, e.SAL 
from EMP e
	join DEPT d
		on e.DEPTNO = d.DEPTNO
where
	(e.DEPTNO, e.SAL) in(
		select DEPTNO, min(SAL)
        from EMP
        where DEPTNO in(
        select distinct DEPTNO
        from EMP
        where ENAME like '%S' #找出名字字尾是S的員工
        )
	group by DEPTNO);