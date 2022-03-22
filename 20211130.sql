select * 
from 
	EMP cross join  DEPT;

select * 
from 
	EMP natural join  DEPT;

select * 
from 
	EMP 
	join  DEPT
		on EMP.DEPTNO = DEPT.DEPTNO;

select d.DNAME as 部門名稱
from 
	EMP e
	join  DEPT d
		on e.DEPTNO = d.DEPTNO;
        
select * 
from 
	EMP e
    join SAL_LEVEL sl
		on e.SAL between sl.SAL_MIN and sl.SAL_MAX
	join DEPT d
		on e.DEPTNO = d.DEPTNO;
        
select *
from 
	DEPT d
	left join  
		EMP e
		on d.DEPTNO = e.DEPTNO;
        
select *
from
	EMP e1
    join EMP e2
		on e1.MGR = e2.EMPNO;
        
select e1.ENAME, e2.ENAME
from
	EMP e1
    join EMP e2
		on e1.MGR = e2.EMPNO;

select e1.ENAME, e2.ENAME
from
	EMP e1
    left join EMP e2
		on e1.MGR = e2.EMPNO;
#left 顯示老闆(無上級)

select * from EMP
order by SAL desc
limit 3;
#limit 1,3;略過一筆

set @seq := 0;
select
	(@seq := @seq + 1) as '名次',
    ENAME, SAL
From EMP
order by SAL desc
limit 1, 3;

   
#step1: 找出平均薪資
select avg(SAL) from EMP;

#step2: 找出低於平均薪資等級
select * from EMP
where SAL <'2073.214286';
------------------------------------
#用子查詢合併查詢
select * from EMP e
where SAL < (
	select avg(SAL)
    from EMP
    where DEPTNO = e.DEPTNO);

select * from EMP
where
	SAL > any (1000, 2000);
    
# 找出所在地在NEW YORK的部門
select DEPTNO from DEPT where LOC = 'NEW YORK';
#列出在NEW YORK工作的員工
select * from EMP where DEPTNO = 10;

select *
from EMP
where DEPTNO in (
	select DEPTNO 
    from DEPT
    where LOC = 'NEW YORK');
#in可以傳多筆資料

#列出跟員工編號7499的員工，同員工、同主管的員工
#Step1: 先找出7499
select JOB, MGR from EMP where EMPNO = 7499;
#Step2: 列出跟員工編號7499的員工，同員工、同主管的員工
select * from EMP
where
	JOB = 'SALESMAN' and MGR = 7698;
#子查詢
select * from EMP
where
	(JOB, MGR) = (
		select
			JOB,
            MGR
		from
			EMp
		where
			EMPNO = 7499);
            
#列出 職稱 跟 薪水 有重複的員工
# Step1:
select JOB, SAL
from EMP
group by JOB, SAL
having count(*) > 1;

#step2
select * from EMP
where
	(JOB = 'SALESMAN' and SAL = 1250)
    or
    (JOB = 'ANALYST' and SAL = 3000);
    
#子查詢用法
select * from EMP
where
	(JOB,SAL) in (
	select JOB, SAL
	from EMP
	group by JOB, SAL
	having count(*) > 1);


select
DEPTNO, ENAME, SAL
from
	EMP t1
where
SAL = (select
	  MAX(SAL)
	  from
	  	  EMP
	  where
		  DEPTNO t1.=DEPTNO)
order by
	DEPTNO;

select *
from 
	EMP e
    join (
		select DEPTNO, max(SAL) as MAX_SAL
        from EMP
        group by DEPTNO) t
        on e.DEPTNO = t.DEPTNO
where
	e.SAL = t.MAX_SAL;
    
#列出沒有員工的部門
select *
from DEPT d
where
	not exists(
    select *
    from EMP
    where DEPTNO = d.DEPTNO)