-- ������ �Լ��� ��ҹ��� �Լ��� �Լ��� ���� �����Լ��� ������.

--1. ��ҹ��� ���� �Լ� (upper,lower, initcap)
select 1+1
from dual; --������̺��� ������ ���̺�

select lower('sql course'), upper('sql course'), initcap('sql course')
from dual;

-- �����Լ��� where ���� ���
select employee_id, first_name
from employees
where upper(first_name) = 'PATRICK' ;

--2.���� ���� �Լ���
--concat (���ڿ��� ��ħ)
SELECT first_name, last_name, concat(first_name, last_name) Ǯ����
from employees;
--substr (���̸�, m, n): m�� ���۹���, n�� �߶� ����
select employee_id, first_name,
substr(first_name, 1, 3),
substr(first_name, 2, 4),
substr(first_name, 2), --���ۺ��� ������
substr(first_name, -3) -- ����(-)�϶� ������ ���� ī��Ʈ
from employees;
-- length: ���ڿ��� ����
select first_name, LENGTH(first_name)
from employees;

--INSTR(���ڿ�, ã�� ����, m, n)
--m�� �˻� ���� ��ġ
--n�� ã�� Ƚ��
--����Ʈ ���� m, n ���� 1
select first_name,
INSTR(first_name, 'e', 2),
INSTR(first_name, 'e', 5),
INSTR(first_name, 'e', 1, 2)
from employees
where first_name = 'Nanette';

--LPAD, RPAD ( ���ڿ�, �ڸ���, ä�﹮��)
select employee_id, first_name, salary,
    LPAD(salary, 10,'#'), RPAD(salary, 10, '*')
from employees;

-- ������ �̿��� ���ڿ��� �и�
SELECT
'Ȳ�� �浿' ����,
SUBSTR('Ȳ�� �浿',1, instr('Ȳ�� �浿',' ' )-1) ��,
substr('Ȳ�� �浿', instr('Ȳ�� �浿', ' ')+1) �̸�
from dual;

-- ������ �Լ� ����
select last_name, concat('�������� ', job_id) AS ������
from employees
where substr(job_id, 4, 3) = 'REP';
--job_id�� 4��°���ں��� REP �� ���

select employee_id, 
    concat(first_name, last_name) ��ü�̸�,
    last_name,
    LENGTH(last_name) ����,
    instr(last_name, 'a') "'a'�� ���°?"
from employees;

--���� ġȯ : replace
select job_id, replace(job_id, 'ACCOUNT', 'ACCNT') ����
from employees
where job_id like '%ACCOUNT%';


--����
select last_name �̸�, lower(last_name), upper(last_name), email �̸���, initcap(email)
from employees;

SELECT job_id ������, substr(job_id, 1, 2) "���� 2��"
FROM employees;




