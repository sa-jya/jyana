--null ���� �Լ�
--NVL : �ΰ��� �ٸ� ������ �ٲܶ� ���
SELECT last_name, manager_id, NVL(manager_id,0) �Ŵ���
FROM employees
where last_name = 'King';

--nvl2(ex,ex1,ex2) : ex���� NULL���� �ƴϸ� ex1
SELECT last_name, NVL2(manager_id,1,0) �Ŵ���
FROM employees
where last_name = 'King';

--NULLIF(ex1, ex2): ex1�� ex2���� �����ϸ� NULL
--�������� ������ ex1���� ���
SELECT NULLIF(1,1), NULLIF(1,2)
FROM dual;
--COALESCE(ex1, ex2, ex3, ...)
--ex1�� �ΰ��̸� ex2 ��ȯ, ex2�� �ΰ��̸� ex3��ȯ...
select last_name �̸�, salary ����,
    commission_pct Ŀ�̼�pct, COALESCE((salary+(commission_pct*salary)), salary+2000) �����λ�    
from employees
ORDER BY 3;

--����
SELECT last_name, salary, 
     NVL(commission_pct, 0) Ŀ�̼�, 
     (salary*12)+(salary*12*NVL(commission_pct, 0)) ����
FROM employees
order by ���� desc;

SELECT last_name, salary, 
     NVL(commission_pct, 0) Ŀ�̼�, 
     (salary*12)+(salary*12*NVL(commission_pct, 0)) ����,
    NVL2(commission_pct, 'SAL+COMM', 'SAL')�������
FROM employees
order by ���� desc;

select  first_name,        
        LENGTH(first_name) ���ڼ�, 
        last_name,
        LENGTH(last_name) ���ڼ�2,
        NULLIF( LENGTH(first_name),LENGTH(last_name)) ���
FROM employees;

--DECODE �Լ�
SELECT last_name �̸�, job_id, salary,
        DECODE(job_id, 'IT_PROG', salary*1.10,
                       'ST_CLERK', salary*1.15, 
                       'SA_REP', salary*1.20,             
                                  salary) ��������
FROM employees;

--����
SELECT last_name �̸�, job_id, salary,
        DECODE(TRUNC(salary/2000), 0, 0,
                                   1,0.9,
                                   2,0.20,
                                   3,0.30,
                                   4,0.40,
                                   5,0.42,
                                   6,0.44,
                                     0.45 ) ����
FROM employees;

--CASE�Լ�
SELECT last_name �̸�, job_id, salary,
    case when salary<5000 then 'Low'
         when salary<10000 then 'Medium'
         when salary<20000 then 'Good'
              ElSE              'Excellent'    
     end "�޿�����"         
FROM employees;

--����
SELECT employee_id, first_name, last_name, salary,
    case when salary>=9000 then '�����޿�'
         when salary>=6000 then '�����޿�'
              ElSE              '�����޿�'    
     end "�޿����"         
FROM employees
where job_id = 'IT_PROG';






