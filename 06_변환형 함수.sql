--��ȯ�� �Լ�

--To_CHAR
--���ڸ� ���ڷ� ��ȯ
--�޸�(,)
select TO_CHAR(12345678, '999,999,999') �޸�
from dual;
--�Ҽ���
select TO_CHAR(123.45678, '999,999,999.99') �Ҽ���
from dual;
--$ǥ��
select TO_CHAR(12345678, '$999,999,999') �޷�ǥ��
from dual;
--Lǥ��
select TO_CHAR(12345678, 'L999,999,999') ������ȭ
from dual;
--���ʿ� 0�� ����
select TO_CHAR(123, '09999') ����ǥ�� --���� ������ 0���� ��ȯ
from dual;

--��¥�� ���ڷ� ��ȯ
--��, ��, ��, ��, ��, ��
select to_char(SYSDATE, 'YY.MM.DD HH24:MI:ss') ���糯¥�ð�
from dual;
--365���� ������ ���� ?
select to_char(SYSDATE, 'DDD') ��¥
from dual;
--������ �� ?
select to_char(SYSDATE, 'MONTH') ���
from dual;

--����
select employee_id, to_char(hire_date, 'mm/yy') �Ի��
from employees
where department_id = 100;

select last_name �̸�, to_char(salary, '$999,999.99') ����
from employees
where salary > 10000
ORDER BY salary desc;

-- ���ڸ� ��¥�� TO_DATE
select TO_DATE('2011-01-01', 'YYYY-MM-DD')
from dual;

--���ڸ� ���ڷ� TO_NUMBER
SELECT to_number('0123123') + 100
FROM dual;













