-- 조인
SELECT e.employee_id, e.department_id, d.department_id, d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id;

--네츄럴 조인: ON 절 생략
select employee_id, first_name, job_id, job_title
from employees
NATURAL JOIN jobs;

--기본 동등조인
SELECT e.employee_id, j.job_id, j.job_title
FROM employees e
JOIN jobs j
    on e.job_id = j.job_id;

--on을 사용한 join(기본)
SELECT e.employee_id , e.last_name, e.department_id, d.department_name
FROM employees e
JOIN departments d
    on e.department_id = d.department_id;
--where절 주기
SELECT e.employee_id , e.last_name, e.department_id, d.location_id
FROM employees e
join departments d
    on e.department_id = d.department_id
where d.department_id =50;

--3개의 테이블 JOIN
SELECT e.employee_id, d.department_name, lo.city 
FROM employees e
join departments d 
    on e.department_id = d.department_id
join locations lo 
    on d.location_id = lo.location_id;

--예제
SELECT d.department_name 부서명, l.city 도시명, c.country_name 국가명
FROM departments d
join locations l
    on d.location_id = l.location_id
join countries c
    on l.country_id = c.country_id 
where (l.city = 'Seattle' or l.city = 'London') and c.country_name like 'United%'
order by 2;

--자체조인
SELECT e.last_name 직원,e.employee_id 직원번호, m.last_name 매니저, m.employee_id 직원번호2
FROM employees e
join employees m
    on e.manager_id = m.employee_id;


--외부조인(OUTER JOIN)
--LEFT OUTER JOIN
SELECT e.last_name 직원, e.department_id 부서번호, d.department_name 부서명
FROM employees e
LEFT OUTER JOIN departments d
        on e.department_id =d.department_id;
    

--RIGHT OUTER JOIN
SELECT e.last_name 직원, e.department_id 부서번호, d.department_name 부서명
FROM employees e
RIGHT OUTER JOIN departments d
        on e.department_id =d.department_id;

--FULL OUTER JOIN
SELECT e.last_name 직원, e.department_id 부서번호, d.department_name 부서명
FROM employees e
FULL OUTER JOIN departments d
        on e.department_id =d.department_id;

--예제
SELECT c.country_name 국가, c.country_id 국가번호, l.location_id 지역번호, l.city 도시
FROM countries c
LEFT OUTER JOIN locations l
        on l.country_id = c.country_id
ORDER BY 지역번호 desc;        


--교차조인(CROSS JOIN)
SELECT c.country_name 국가, r.region_name 지역이름
FROM countries c
CROSS JOIN regions r;

--리뷰 예제
--1
SELECT d.department_name 부서명, d.manager_id 매니저번호, 
       e.last_name||' '||e.first_name "매니저이름(직원이름)",
       e.phone_number 전화번호
FROM departments d
JOIN employees e on  d.manager_id = e.employee_id;
    
SELECT e.employee_id 직원번호, e.hire_date 고용일자, j.job_id 직종, j.job_title 직책
FROM employees e
JOIN jobs j on e.job_id = j.job_id;

SELECT to_char(e.hire_date, 'YYYY') 입사년도, ROUND(AVG(e.salary), 0) 평균급여
FROM employees e
JOIN jobs j 
    on j.job_id = e.job_id
where j.job_title = 'Sales Manager'
GROUP by to_char(e.hire_date, 'YYYY')
ORDER BY 입사년도;

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
