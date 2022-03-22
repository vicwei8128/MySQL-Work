-- 01. select 敘述，查詢 Table: DEPT 列出所有資料
select * from DEPT;

-- 02. select 敘述，查詢 Table: EMP 列出所有員工的員工姓名 (ENAME) 、 職稱 (JOB) 、 到職日(HIREDATE) 、 及員工編號 (EMPNO) 員工編號需顯示在第一欄
select
	EMPNO, ENAME, JOB, HIREDATE
from EMP;

-- 03. select 敘述，查詢 Table: EMP 列出所有到職日 (HIREDATE) 同樣的到職日不重複顯示
select distinct
	HIREDATE
from EMP;

-- 04. 續第 02 題，將 select 敘述加上別名
select
	EMPNO as EmployeeNo, 
    ENAME as EmployeeName, 
    JOB as Title, 
    HIREDATE as HireDate
from EMP;

-- 05. select 敘述，查詢 Table: EMP 列出員工姓名 ENAME) 串接職稱 JOB) 中間用逗號和空白隔開(', ')，並加上別名 NAMEandTITLE
select
	concat(ENAME, ', ', JOB)
    as NAMEandTITLE
from EMP;