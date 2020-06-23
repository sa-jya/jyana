--��¥�� �Լ�
SELECT first_name, hire_date -- ��¥���� ������
FROM employees;

--sysdate ���� ��¥�� �ð�
select sysdate
from dual;

--��¥ + ���� => ��¥
select sysdate, sysdate+3, sysdate-3
from dual;

-- ��¥-��¥ = �� �ϼ�
select employee_id, sysdate, hire_date,
    sysdate - hire_date, round(sysdate-hire_date)
from employees;
--�ð����
select sysdate + 5/24 --�ð� 1(�Ϸ�)
from dual;
-- months_between : �� ���
select employee_id, first_name,
    ROUND(MONTHS_BETWEEN(sysdate, hire_date)),
    (sysdate -hire_date)/30
from employees;    
--add_months: �� ����
select employee_id, first_name, hire_date,
    add_months(hire_date, 4) --4�� ���ϱ�
from employees;   
--next_day (��¥, ������ ���� ����)
select sysdate, next_day(sysdate, '������')
from dual;
--last_day(��¥) �� ���� ��������
select last_day(sysdate)
from dual;
-- ��¥�� �ݿø�
select employee_id, hire_date,
    round(hire_date,'month') ��, --������ �ݿø� 1��
    round(hire_date,'year') ��   --������ �ݿø� 1�� 
from employees
where MONTHS_BETWEEN(sysdate, hire_date) <150;

--����
SELECT sysdate, hire_date,
    months_between(sysdate, hire_date) ������,
    round(months_between(sysdate, hire_date) ) "������(�ݿø�)"
FROM employees
where department_id = 100;

SELECT hire_date,
    add_months(hire_date, 3) ���ϱ�_3����,
    add_months(hire_date, -3) ����_3����    
from employees
where employee_id between 100 and 106;
