-- 1. ���̺��� ��� ������ ��������
select * from employees;
-- 2. where ���� ������ ���� �����Ѵ�.
--  ��ġ�� from �� ������ ��ġ
select *
from employees
WHERE department_id = 90;

select *
from employees
WHERE salary = 24000; -- ������ 24000�� ����
/*
where ���� ����Ҷ� ������
����(String)�� ��¥(Date) ���� �׻� ����ǥ(')�� ǥ�� 3
���ڰ��� ��ҹ��ڸ� �����Ѵ�.(Case-Sensitive)
��¥���� ��¥���˿� ����� �ʵ��� (Format-Sensitive)
����Ŭ�� ��¥������ RR/MM/DD(RR�� 2�ڸ� �⵵)
*/
-- 3. where + ���ڿ�
select employee_id, first_name, last_name, job_id
from employees
where first_name = 'Steven';

-- 4. where + ��¥
select sysdate from dual; 
--dual�� ���� ���̺� sysdate�� ���� ��¥ �ð�

select * 
from employees
where hire_date >= '03/06/17';-- ��/��/��

-- �񱳿�����
select * 
from employees
where salary >= 10000; --���ں�

select * 
from employees
where hire_date >= '03/06/17'; --��¥��

select * 
from employees
where first_name > 'King'; -- ���ں�(���ĺ���)

--����1
select * 
from employees
where employee_id = 100;
--����2
select * 
from employees
where first_name = 'David';
--����3
select * 
from employees
where employee_id <= 105;
--����4
select * 
from job_history
where start_date > '06/03/03';
--����5
select * 
from departments
where location_id != 1700; -- <>1700

-- 6. AND OR
SELECT*
from employees
where (department_id = 60 OR 
    department_id = 80) AND salary > 10000;
SELECT *
FROM employees
where hire_date > '08/04/04' or salary > 13000
    and job_id = 'AD_VP';
--not 
SELECT *
FROM employees
where NOT(hire_date > '04/01/01' or salary > 5000);
  


-- ����1
SELECT *
FROM employees
where salary > 4000 and job_id = 'IT_PROG';
-- ����2
SELECT *
FROM employees
where salary > 4000 and (job_id = 'IT_PROG' or job_id ='FI_ACCOUNT');

-- IN ������
SELECT *
FROM employees
where salary = 4000 or salary =3000 or salary =2700;

SELECT *
FROM employees
where salary IN (4000, 3000, 2700);

-- ����1
SELECT *
FROM employees
where salary IN (10000, 17000, 24000);
-- ����2
SELECT *
FROM employees
where  department_id not IN (30,50,80,100,110);

-- Between ������
select *
from employees
where salary >= 9000 and salary <=10000;
select *
from employees
where salary between 9000 and 10000;

--����
select *
from employees
where salary between 10000 and 20000;

select *
from employees
where hire_date between '04/01/01' and '04/12/30'; 

select *
from employees
where salary not between 7000 and 17000;

--Like ������ _ �� % �� ���
/*% �� ���ڰ� 0�� �Ǵ� 1�� �̻�
_ �� ���ڰ� 1��
*/
select *
from employees
where last_name Like 'B%';

select *
from employees
where last_name like '%b%';

select *
from employees
where first_name like '_d%';

select *
from employees
where first_name like '__s%';

-- ����

SELECT *
FROM employees
where job_id like '%AD%';

SELECT *
FROM employees
where job_id like '%AD___';

SELECT *
FROM employees
where phone_number like '%1234';

SELECT *
FROM employees
where phone_number not like '%3%' and phone_number like '%9';

SELECT *
FROM employees
where job_id like '%MGR%' or job_id Like'%ASST%';


-- is null / is not null ������
select *
from employees
where commission_pct is null; -- == null(x)

select *
from employees
where commission_pct is not null;

-- ����
select *
from employees
where manager_id is null;

-- order by
select *
from employees
ORDER BY salary; -- �⺻�� �������� = ASC(���� ����)

select *
from employees
ORDER BY salary desc; --�������� DESC(���� �Ұ���, ū ���� ���� ����)

select *
from employees
ORDER BY last_name; -- ���ڴ� ���ĺ� ������ ����

--��Ƽ ����
select employee_id , last_name, department_id 
from employees
ORDER BY department_id , employee_id  desc; --�μ���ȣ�� ���� �� �����ȣ�� �������� ����

-- ���� �����Ͽ� ����
select employee_id, last_name, salary*12 ����
from employees
order by ���� DESC; --���� �������� ����

--order by  ��  where �� ������ ��ġ
select employee_id, department_id , last_name, salary*12 ����
from employees
where department_id = 90 -- 90���μ�
order by ���� DESC; --���� �������� ����

--����
SELECT employee_id, first_name, last_name
from employees
order by employee_id DESC;

select *
from employees
where job_id like '%CLERK%'
order by salary desc;

SELECT  employee_id , first_name, department_id, salary
FROM  employees
where employee_id BETWEEN 120 and 150
order by department_id desc, salary desc; --ū������ ����











