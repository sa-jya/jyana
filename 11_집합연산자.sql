--���տ�����(union ��)

--union: ������ �ߺ����� 115
SELECT employee_id, job_id
FROM employees
union
SELECT employee_id, job_id
FROM job_history;
--union: ������ �ߺ� ���� 117
SELECT employee_id, job_id
FROM employees
union all
SELECT employee_id, job_id
FROM job_history;
--INTERSECT: ������  2
SELECT employee_id, job_id
FROM employees
INTERSECT
SELECT employee_id, job_id
FROM job_history;
--MINUS: ������  105
SELECT employee_id, job_id
FROM employees
MINUS
SELECT employee_id, job_id
FROM job_history;

--����
SELECT department_id
FROM employees
union
SELECT department_id
FROM departments;

SELECT department_id
FROM employees
union all
SELECT department_id
FROM departments;

SELECT department_id
FROM employees
INTERSECT
SELECT department_id
FROM departments;

SELECT department_id
FROM departments
minus
SELECT department_id
FROM employees;








