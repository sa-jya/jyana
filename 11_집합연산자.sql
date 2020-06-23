--집합연산자(union 외)

--union: 합집합 중복제거 115
SELECT employee_id, job_id
FROM employees
union
SELECT employee_id, job_id
FROM job_history;
--union: 합집합 중복 포합 117
SELECT employee_id, job_id
FROM employees
union all
SELECT employee_id, job_id
FROM job_history;
--INTERSECT: 교집합  2
SELECT employee_id, job_id
FROM employees
INTERSECT
SELECT employee_id, job_id
FROM job_history;
--MINUS: 차집합  105
SELECT employee_id, job_id
FROM employees
MINUS
SELECT employee_id, job_id
FROM job_history;

--예제
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








