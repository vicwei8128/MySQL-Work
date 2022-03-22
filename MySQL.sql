select
	case DEPTNO
		when 10 then '十'
		when 20 then '二十'
		when 30 then '三十'
		else '不知道'
	end as 部門編號,
    DNAME,
    LOC
from DEPT;

--------------------------
select * from EMP
where
	DEPTNO = 10;
--------------------------
select EMPNO, ENAME
from EMP
where
	DEPTNO = 10;
--------------------------
#錯誤示範

select * from EMP
where
	ENAME < 'a';
    
--------------------------
select * from EMP
where
	DEPTNO = 10
    or DEPTNO = 20;
    
--------------------------
select * from EMP
where
	DEPTNO = 10
    or DEPTNO = 20;
    
--------------------------
select * from EMP
where
	(DEPTNO = 10 or DEPTNO = 20)
    and SAL > 2000;

--------------------------
select * from EMP
where
	SAL between 1000 and 2000;
	#SAL >= 1000 and SAL <= 2000 兩句同意
    #SAL not between 100 and 2000 反向用法
--------------------------
select * from EMP
where
	DEPTNO = 10 or DEPTNO = 20;
    #錯誤 DEPTNO = 10 or 20
    #同於 DEPTNO in(10, 20)
--------------------------    
select * from EMP
where
	DEPTNO != 10 and DEPTNO != 20;
    #同於 DEPTNO not in(10,20)

--------------------------
select * from EMP
where
	COMM is null;
    #獎金不是空值 COMM is not null
--------------------------
select * from EMP
where
	ENAME like 'A%';
	#ENAME like '_L%' 找第二個字母是L

--------------------------
select * from EMP
where
	ENAME like '%#%';
--------------------------
select * from EMP
order by SAL;
#薪資由小到大

--------------------------
select * from EMP
order by
	SAL, COMM, SAL + ifnull(COMM, 0);
--------------------------
select * from EMP
order by
	SAL + ifnull(comm, 0) desc;
    
--------------------------
select DEPTNO, count(*) from EMP
group by DEPTNO #將資料"列"分組
	with rollup;
--------------------------    
select
	right(ENAME, 1)
from EMP
group by
	right(ENAME, 1);
--------------------------    
select JOB, count(*), max(SAL), min(SAL), avg(SAL)
from EMP
group by JOB;
--------------------------
select 
	JOB, count(*), max(SAL), min(SAL), avg(SAL),
    avg(distinct SAL)
from EMP
group by JOB;
---------------------------
select 
	JOB, count(*), avg(SAL),sum(SAL)
from EMP
group by JOB;

---------------------------
select 
	JOB, count(*), count(COMM), count(distinct SAL)
from EMP
group by JOB;
---------------------------
select DEPTNO, count(*)
from EMP
group by DEPTNO
having	count(*) > 3