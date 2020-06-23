-- ��������

--Abel �������� �޿��� �� ���� �޴� ��������?
--Abel�� �޿�Ȯ��
SELECT salary
FROM employees
where last_name = 'Abel';
--���������� ���
--������ ������( =,>,<,<=,>=,<>,!=)
SELECT employee_id, last_name, salary
FROM employees
WHERE salary >(SELECT salary
               FROM employees
               where last_name = 'Abel');
--������ ���� ���
SELECT employee_id, last_name, salary
FROM employees
WHERE salary >(SELECT salary
               FROM employees
               where department_id = 30);
--�׷��Լ��� ���������� �̿�
--�׷��Լ� ���� MAX�� ���� ���� �ޤ��� �޴� ����� �� �� ����
SELECT
    *
FROM employees
WHERE salary = (SELECT max(salary) from employees);

--����
SELECT last_name, salary
FROM employees
WHERE salary >(SELECT salary
               FROM employees
               where last_name = 'Abel');

SELECT employee_id ������ȣ, last_name �̸�,
      department_id �μ���ȣ, salary �޿�
FROM employees
WHERE department_id = (SELECT department_id
               FROM employees
               where last_name = 'Bull')
and salary > (SELECT salary
               FROM employees
               where last_name = 'Bull');
               
SELECT last_name, salary, manager_id
FROM employees
where manager_id = (SELECT employee_id
               FROM employees
               where last_name = 'Russell');
               
SELECT
    *
FROM employees
where job_id =(SELECT job_id
               FROM jobs
               where job_title = 'Stock Manager');

--������ ��������
--������ (in,any,all)
SELECT salary
FROM employees
WHERE department_id =90;

--in
SELECT employee_id, first_name, last_name, salary, department_id
FROM employees
where salary in(SELECT salary
                FROM employees
                WHERE department_id =90);
--any : �ϳ��� ���Ǹ� �����ص� ��, ������ �տ� �ٿ��ߵ�
SELECT employee_id, first_name, last_name, salary
FROM employees 
where salary >= any (SELECT salary
                    FROM employees
                    WHERE department_id =90);
--all : ��� ������ �����ؾ� ��
SELECT employee_id, first_name, last_name, salary
FROM employees 
where salary >= all (SELECT salary
                    FROM employees
                    WHERE department_id =90);
--����
SELECT employee_id, first_name, job_id, salary
FROM employees
where department_id != 20 
and  manager_id in(SELECT manager_id
                    FROM employees
                    WHERE department_id =20);

SELECT employee_id, last_name, job_id, salary
FROM employees
where salary < any(SELECT salary
                    FROM employees
                    WHERE job_id ='ST_MAN');
                    
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < all(select salary
             FROM employees
             WHERE job_id ='IT_PROG');

--���߿� ��������
SELECT employee_id, first_name, job_id, salary, manager_id
FROM employees
where (manager_id, job_id) in (select manager_id, job_id
                               FROM employees
                               WHERE first_name ='Bruce')
    AND first_name <> 'Bruce';                               
--�μ����� �ּұ޿��� �޴� ����� �μ���ȣ, �����ȣ, �̸�, �޿� ���� �˻�
SELECT department_id �μ���ȣ, employee_id �����ȣ, first_name �̸�, salary �޿�
FROM employees
where (department_id, salary) in (select department_id, min(salary)
                               FROM employees
                               GROUP by department_id )
order by department_id;                               
--����
SELECT first_name, job_id, salary, department_id
FROM employees
WHERE (salary, job_id) in (select min(salary), job_id
                               FROM employees
                               group by job_id)
order by salary desc;


               