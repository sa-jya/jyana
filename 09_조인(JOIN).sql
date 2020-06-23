-- ����
SELECT e.employee_id, e.department_id, d.department_id, d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id;

--���� ����: ON �� ����
select employee_id, first_name, job_id, job_title
from employees
NATURAL JOIN jobs;

--�⺻ ��������
SELECT e.employee_id, j.job_id, j.job_title
FROM employees e
JOIN jobs j
    on e.job_id = j.job_id;

--on�� ����� join(�⺻)
SELECT e.employee_id , e.last_name, e.department_id, d.department_name
FROM employees e
JOIN departments d
    on e.department_id = d.department_id;
--where�� �ֱ�
SELECT e.employee_id , e.last_name, e.department_id, d.location_id
FROM employees e
join departments d
    on e.department_id = d.department_id
where d.department_id =50;

--3���� ���̺� JOIN
SELECT e.employee_id, d.department_name, lo.city 
FROM employees e
join departments d 
    on e.department_id = d.department_id
join locations lo 
    on d.location_id = lo.location_id;

--����
SELECT d.department_name �μ���, l.city ���ø�, c.country_name ������
FROM departments d
join locations l
    on d.location_id = l.location_id
join countries c
    on l.country_id = c.country_id 
where (l.city = 'Seattle' or l.city = 'London') and c.country_name like 'United%'
order by 2;

--��ü����
SELECT e.last_name ����,e.employee_id ������ȣ, m.last_name �Ŵ���, m.employee_id ������ȣ2
FROM employees e
join employees m
    on e.manager_id = m.employee_id;


--�ܺ�����(OUTER JOIN)
--LEFT OUTER JOIN
SELECT e.last_name ����, e.department_id �μ���ȣ, d.department_name �μ���
FROM employees e
LEFT OUTER JOIN departments d
        on e.department_id =d.department_id;
    

--RIGHT OUTER JOIN
SELECT e.last_name ����, e.department_id �μ���ȣ, d.department_name �μ���
FROM employees e
RIGHT OUTER JOIN departments d
        on e.department_id =d.department_id;

--FULL OUTER JOIN
SELECT e.last_name ����, e.department_id �μ���ȣ, d.department_name �μ���
FROM employees e
FULL OUTER JOIN departments d
        on e.department_id =d.department_id;

--����
SELECT c.country_name ����, c.country_id ������ȣ, l.location_id ������ȣ, l.city ����
FROM countries c
LEFT OUTER JOIN locations l
        on l.country_id = c.country_id
ORDER BY ������ȣ desc;        


--��������(CROSS JOIN)
SELECT c.country_name ����, r.region_name �����̸�
FROM countries c
CROSS JOIN regions r;

--���� ����
--1
SELECT d.department_name �μ���, d.manager_id �Ŵ�����ȣ, 
       e.last_name||' '||e.first_name "�Ŵ����̸�(�����̸�)",
       e.phone_number ��ȭ��ȣ
FROM departments d
JOIN employees e on  d.manager_id = e.employee_id;
    
SELECT e.employee_id ������ȣ, e.hire_date �������, j.job_id ����, j.job_title ��å
FROM employees e
JOIN jobs j on e.job_id = j.job_id;

SELECT to_char(e.hire_date, 'YYYY') �Ի�⵵, ROUND(AVG(e.salary), 0) ��ձ޿�
FROM employees e
JOIN jobs j 
    on j.job_id = e.job_id
where j.job_title = 'Sales Manager'
GROUP by to_char(e.hire_date, 'YYYY')
ORDER BY �Ի�⵵;

SELECT l.city, ROUND(AVG(e.salary), 0), count(*)
FROM departments d
JOIN locations l
    on l.location_id = d.location_id
JOIN employees e
    on e.department_id = d.department_id
GROUP by l.city
HAVING count(*) < 10
order by ROUND(AVG(e.salary), 0) ;

SELECT e.employee_id, e.last_name, e.salary, m.last_name, m.salary
FROM employees e
JOIN employees m
    on e.manager_id = m.employee_id
where e.salary > m.salary;
