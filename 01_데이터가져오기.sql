-- ������ �ּ�. ����Ű ctrl+/
/*
������ �ּ��� �ٴ� ���
*/ 
-- 1. ���̺��� ��� ��� ���� �о���� *
select*
from departments;

--2. Ư�� ���� �о����
select department_id, departments_name
from departments;

-- 3. ��� ������ ���(+,-,*/)
select employee_id, first_name, salary
from employees;

select employee_id, first_name, salary, salary+100, salary +  (salary * 0.1)
from employees;

--4. ��(null) �̶�?
-- ���� �Էµ��� ����, ��� ���� ���� ����, �� �� ���� ��
-- �� ���� 0 �Ǵ� ����(" ")���� �ٸ���
select last_name, job_id, salary, commission_pct
from employees;

select last_name, job_id, salary, commission_pct, commission_pct+10
from employees;

--5. �ߺ��� �� ���� : distinct
select DISTINCT job_id
from EMPLOYEES;

--����1,2,3
SELECT employee_id, first_name, last_name
FROM employees;
SELECT first_name, salary, salary*1.1 as ��������
FROM employees;
SELECT employee_id as �����ȣ, first_name as �̸�, last_name as �� 
FROM employees;

-- ���� ������ (||)
select last_name||' is a '||job_id as "���� ����"
from employees;

select employee_id, first_name||' '||last_name Ǯ����
from employees;

-- ���� 4
select employee_id, first_name||' '||last_name, email||' @company.com'
from employees;








