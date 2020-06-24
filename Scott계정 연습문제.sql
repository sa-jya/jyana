--1��
SELECT empno, ename, sal
FROM emp
where deptno = 10;

--2��
SELECT ename, hiredate, deptno
FROM emp
where empno = 7369;

--3��
SELECT
    *
FROM emp
where ename = 'ALLEN';

--4��
SELECT ename,deptno, sal
FROM emp
where hiredate = '81/02/20';

--5��
SELECT
    *
FROM emp
where job != 'MANAGER';

--6��
SELECT
    *
FROM emp 
where hiredate >= '81/04/02';


--7��
SELECT ename, sal, deptno
FROM emp
where sal >= 800;

--8��
SELECT
    *
FROM emp
where deptno >= 20;

--9��
SELECT
    *
FROM emp
where ename >= 'L';

--10��
SELECT
    *
FROM emp
WHERE hiredate < '81/12/09';

--11��
SELECT empno, ename
FROM emp
where empno <= 7698;

--12��
SELECT ename, sal, deptno
FROM emp
where hiredate >= '81/04/02' and hiredate <='82/12/09';

--13��
SELECT ename, job, sal
FROM emp
where sal > 1600 and sal < 3000;

--14��
SELECT
    *
FROM emp
where empno not between 7654 and 7782;

SELECT
    *
FROM emp
where empno < 7654 or empno > 7782;


--15��
SELECT
    *
FROM emp
where ename between 'B' and 'J';

SELECT
    *
FROM emp
where ename >= 'B' and ename <='J';

--16��
SELECT
    *
FROM emp
where hiredate not like '81/%%/%%';

SELECT
    *
FROM emp
where not (hiredate >= '81/01/01' and hiredate <= '81/12/31');

--17��
SELECT
    *
FROM emp
where job LIKE '%MAN%';

SELECT
    *
FROM emp
where job in ('MANAGER', 'SALESMAN');

--18��
SELECT ename, empno, deptno
FROM emp
where deptno not in (20, 30);

--19��
SELECT empno, ename, hiredate, deptno
FROM emp
where ename like 'S%';

--20��
SELECT
    *
FROM emp
where hiredate like '81/%%/%%';

SELECT
    *
FROM emp
where hiredate between '81/01/01' and '81/12/31';

--21��
SELECT
    *
FROM emp
where ename like '%S%';

--22��
SELECT
    *
FROM emp
where ename like 'M____N';

--23��
SELECT
    *
FROM emp
where ename like '_A%';

--24��
SELECT
    *
FROM emp
where comm is null;

--25��
SELECT
    *
FROM emp
WHERE comm is not null;

--26��
SELECT ename, deptno, sal
FROM emp
where deptno = 30 and sal >= 1500;

--27��
SELECT empno, ename, deptno
FROM emp
where ename like 'K%' or deptno = 30;

--28��
SELECT
    *
FROM emp
where sal >= 1500 and (deptno =30 and job = 'MANAGER');

--29��
SELECT
    *
FROM emp
where deptno = 30
order by empno;

--30��
SELECT
    *
FROM emp
order by sal desc;

--31��
SELECT
    *
FROM emp
order by deptno , sal desc;

--32��
SELECT deptno, ename, sal
FROM emp
order by deptno desc,ename, sal desc;

--33��
SELECT ename, sal, round(sal*0.13) bonus, deptno
FROM emp
where deptno = 10;

--34��
SELECT ename, sal, nvl(comm, 0),(sal+NVL(comm,0)) total
FROM emp
ORDER BY total desc;

SELECT ename, sal, nvl(comm, 0),nvl(comm, 0)+sal total
FROM emp
ORDER BY total desc;

SELECT ename, sal, nvl(comm, 0),coalesce(sal+nvl(comm, 0), sal) total
FROM emp
ORDER BY total desc;



--35��
SELECT ename, sal, to_char(round(sal*0.15, 2), '$999.9') ȸ��
FROM emp
where sal between 1500 and 3000;

--36��
SELECT d.dname, count(e.empno)
FROM emp e
join dept d on e.deptno = d.deptno
group by d.dname
having count(e.empno) > 5;

--37�� 
SELECT job, sum(sal) �޿��հ�
FROM emp
where job != 'SALESMAN'
group by job
having sum(sal) > 5000
order by �޿��հ�;

--38��
SELECT e.empno, e.ename, e.sal, s.grade
FROM emp e
join salgrade s
on e.sal between s.losal and s.hisal;

--39��
SELECT deptno, count(*) ���_��, count(comm) Ŀ�̼�_����_���_��
FROM emp
group by deptno;

--40��
SELECT ename,deptno,
        DECODE(deptno, 10, '�ѹ���',
                       20, '���ߺ�',
                       30, '������') �μ���
FROM emp;






