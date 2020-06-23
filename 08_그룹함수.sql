--�׷��Լ�
SELECT count (*)
FROM employees;

select salary
from employees
order by salary DESC;

--MAX MIN
select MAX(salary), MIN(salary)
from employees;
--���ڿ��� ����
select MAX(first_name), MIN(first_name)
from employees;
--��¥���� ����
select MAX(hire_date), MIN(hire_date)
from employees;

--sum , avg : �հ�� ��� (����)
select sum(salary), round(avg(salary), 0)
from employees;

--count
SELECT count(*) --���� ���̺��� ��� ���� ����
FROM employees;

SELECT count(commission_pct) --null���� �ƴ� ���� ����
FROM employees;

SELECT count(NVL(commission_pct, 0))
FROM employees;

SELECT count(department_id)
FROM employees;

SELECT count(DISTINCT department_id) --�μ��� ����(�ߺ��� ����)
FROM employees;

--90�� �μ��� ������ ����
SELECT count(employee_id)
FROM employees
where department_id = 90;

select AVG(commission_pct) -- null���� ������ ���
from employees;

-- GROUP BY�� ������ �����Լ� ���
SELECT department_id �μ���ȣ, ROUND(AVG(salary)) ��ձ޿�,
        TO_CHAR(ROUND(AVG(salary)), '$99,999') �޷�ǥ��
FROM employees
GROUP BY department_id;

SELECT  department_id �μ���ȣ, 
        ROUND(AVG(salary)) ��ձ޿�,
        SUM(salary) �ѱ޿��հ�,    
        count(*) �μ��ο���
FROM employees
GROUP BY department_id;

SELECT  department_id �μ���ȣ, job_id ����,
        ROUND(AVG(salary)) ��ձ޿�,
        SUM(salary) �ѱ޿��հ�,    
        count(*) �μ���_������_�ο���
FROM employees
GROUP BY department_id, job_id;

--����
SELECT department_id �μ���, 
       count(*) �����,
       MAX(salary) �ִ�_�޿�,
       MIN(salary) �ּ�_�޿�,
       sum(salary) �޿��հ�,
       round(AVG(salary)) ��ձ޿�
FROM employees
group by department_id
order by �޿��հ� desc;

SELECT  department_id �μ���ȣ, 
        job_id ����, 
        manager_id ����ȣ,
        sum(salary) �����հ�,
        count(*) ������
FROM employees
group by department_id, job_id, manager_id
order by �μ���ȣ;

SELECT round(avg(max(salary))) �μ���_�ְ�_����_���,
             avg(min(salary))  �μ���_����_����_���
FROM employees
group by department_id;


--Having �� :�׷��Լ��� �̿��� ������
select department_id �μ���ȣ, sum(salary) �޿��հ�
FROM employees 
GROUP BY department_id
HAVING SUM(salary) >100000
ORDER BY department_id;

--����
SELECT job_id ����, sum(salary) ���޿��հ�
FROM employees
where job_id !='AC_MGR'
group by job_id
having avg(salary) > 10000 
order by ���޿��հ� desc;

SELECT department_id �μ���ȣ,
       round(AVG(salary)) ��ձ޿�
FROM employees
where department_id !='40'
group by  department_id
having AVG(salary) <= 7000;

SELECT job_id, sum(salary) �޿��Ѿ�
FROM employees
where job_id not like '%REP%'
group by job_id
having sum(salary) >= 13000
order by sum(salary) desc;








