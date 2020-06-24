--1번
SELECT empno, ename, sal
FROM emp
where deptno = 10;

--2번
SELECT ename, hiredate, deptno
FROM emp
where empno = 7369;

--3번
SELECT
    *
FROM emp
where ename = 'ALLEN';

--4번
SELECT ename,deptno, sal
FROM emp
where hiredate = '81/02/20';

--5번
SELECT
    *
FROM emp
where job != 'MANAGER';

--6번
SELECT
    *
FROM emp 
where hiredate >= '81/04/02';


--7번
SELECT ename, sal, deptno
FROM emp
where sal >= 800;

--8번
SELECT
    *
FROM emp
where deptno >= 20;

--9번
SELECT
    *
FROM emp
where ename >= 'L';

--10번
SELECT
    *
FROM emp
WHERE hiredate < '81/12/09';

--11번
SELECT empno, ename
FROM emp
where empno <= 7698;

--12번
SELECT ename, sal, deptno
FROM emp
where hiredate >= '81/04/02' and hiredate <='82/12/09';

--13번
SELECT ename, job, sal
FROM emp
where sal > 1600 and sal < 3000;

--14번
SELECT
    *
FROM emp
where empno not between 7654 and 7782;

SELECT
    *
FROM emp
where empno < 7654 or empno > 7782;


--15번
SELECT
    *
FROM emp
where ename between 'B' and 'J';

SELECT
    *
FROM emp
where ename >= 'B' and ename <='J';

--16번
SELECT
    *
FROM emp
where hiredate not like '81/%%/%%';

SELECT
    *
FROM emp
where not (hiredate >= '81/01/01' and hiredate <= '81/12/31');

--17번
SELECT
    *
FROM emp
where job LIKE '%MAN%';

SELECT
    *
FROM emp
where job in ('MANAGER', 'SALESMAN');

--18번
SELECT ename, empno, deptno
FROM emp
where deptno not in (20, 30);

--19번
SELECT empno, ename, hiredate, deptno
FROM emp
where ename like 'S%';

--20번
SELECT
    *
FROM emp
where hiredate like '81/%%/%%';

SELECT
    *
FROM emp
where hiredate between '81/01/01' and '81/12/31';

--21번
SELECT
    *
FROM emp
where ename like '%S%';

--22번
SELECT
    *
FROM emp
where ename like 'M____N';

--23번
SELECT
    *
FROM emp
where ename like '_A%';

--24번
SELECT
    *
FROM emp
where comm is null;

--25번
SELECT
    *
FROM emp
WHERE comm is not null;

--26번
SELECT ename, deptno, sal
FROM emp
where deptno = 30 and sal >= 1500;

--27번
SELECT empno, ename, deptno
FROM emp
where ename like 'K%' or deptno = 30;

--28번
SELECT
    *
FROM emp
where sal >= 1500 and (deptno =30 and job = 'MANAGER');

--29번
SELECT
    *
FROM emp
where deptno = 30
order by empno;

--30번
SELECT
    *
FROM emp
order by sal desc;

--31번
SELECT
    *
FROM emp
order by deptno , sal desc;

--32번
SELECT deptno, ename, sal
FROM emp
order by deptno desc,ename, sal desc;

--33번
SELECT ename, sal, round(sal*0.13) bonus, deptno
FROM emp
where deptno = 10;

--34번
SELECT ename, sal, nvl(comm, 0),(sal+NVL(comm,0)) total
FROM emp
ORDER BY total desc;

SELECT ename, sal, nvl(comm, 0),nvl(comm, 0)+sal total
FROM emp
ORDER BY total desc;

SELECT ename, sal, nvl(comm, 0),coalesce(sal+nvl(comm, 0), sal) total
FROM emp
ORDER BY total desc;



--35번
SELECT ename, sal, to_char(round(sal*0.15, 2), '$999.9') 회비
FROM emp
where sal between 1500 and 3000;

--36번
SELECT d.dname, count(e.empno)
FROM emp e
join dept d on e.deptno = d.deptno
group by d.dname
having count(e.empno) > 5;

--37번 
SELECT job, sum(sal) 급여합계
FROM emp
where job != 'SALESMAN'
group by job
having sum(sal) > 5000
order by 급여합계;

--38번
SELECT e.empno, e.ename, e.sal, s.grade
FROM emp e
join salgrade s
on e.sal between s.losal and s.hisal;

--39번
SELECT deptno, count(*) 사원_수, count(comm) 커미션_받은_사원_수
FROM emp
group by deptno;

--40번
SELECT ename,deptno,
        DECODE(deptno, 10, '총무부',
                       20, '개발부',
                       30, '영업부') 부서명
FROM emp;






