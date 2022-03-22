-- 01. 列出薪資不介於 1000 到 2000 元的員工之姓名和薪資
select * from EMP
where
	SAL not between 1000 and 2000;

-- 02. 列出到職日為 1981 年的員工之姓名、職稱、到職日，並依到職日遞減排序
select * from EMP
where
	HIREDATE like '1981-%-%'
order by
	 HIREDATE desc;
     
-- 03. 列出薪資超過 2000 元 且 部門編號為 10 或 30 的員工之姓名、薪資，並依序取別名為"EMPLOYEE_NAME"、 "SALARY"
select DEPTNO,
	   ENAME as EMPLOYEE_NAME,
       SAL as SALARY
       from EMP
where
	DEPTNO in(10, 30)
    and SAL > 2000;

-- 04. 列出有獎金(獎金 不是 null ，也不是 0) 的員工之姓名、薪資、獎金，並排序，排序依據為薪資加上獎金
select ENAME, SAL, COMM from EMP
where
	COMM is not null and COMM != 0
order by
	SAL, COMM, SAL+ifnull(COMM, 0);
    
-- 05. 列出員工姓名最後一個字是 " 的員工之姓名、職稱
select ENAME, JOB from EMP
where
	ENAME like '%s';
    
-- 06. 列出職稱為 CLERK 、 SALESMAN ，且薪資不等於 1100 、 1300 、 1500 的員工之姓名、職稱、薪資
select ENAME, JOB, SAL from EMP
where
	JOB = 'CLERK' or JOB = 'SALEMAN'
    and SAL not in (1100, 1300, 1500);
    
-- 07. 列出獎金大於薪資 1.05 倍的員工之姓名、薪資、獎金
select ENAME, SAL, COMM from EMP
where
	(COMM*1.05) > SAL;
