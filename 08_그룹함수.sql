--그룹함수
SELECT count (*)
FROM employees;

select salary
from employees
order by salary DESC;

--MAX MIN
select MAX(salary), MIN(salary)
from employees;
--문자열에 적용
select MAX(first_name), MIN(first_name)
from employees;
--날짜열에 적용
select MAX(hire_date), MIN(hire_date)
from employees;

--sum , avg : 합계와 평균 (숫자)
select sum(salary), round(avg(salary), 0)
from employees;

--count
SELECT count(*) --직원 테이블의 모든 행의 갯수
FROM employees;

SELECT count(commission_pct) --null값이 아닌 행의 갯수
FROM employees;

SELECT count(NVL(commission_pct, 0))
FROM employees;

SELECT count(department_id)
FROM employees;

SELECT count(DISTINCT department_id) --부서의 갯수(중복을 제외)
FROM employees;

--90번 부서의 직원의 숫자
SELECT count(employee_id)
FROM employees
where department_id = 90;

select AVG(commission_pct) -- null값은 제외한 평균
from employees;

-- GROUP BY로 나눠서 집계함수 사용
SELECT department_id 부서번호, ROUND(AVG(salary)) 평균급여,
        TO_CHAR(ROUND(AVG(salary)), '$99,999') 달러표시
FROM employees
GROUP BY department_id;

SELECT  department_id 부서번호, 
        ROUND(AVG(salary)) 평균급여,
        SUM(salary) 총급여합계,    
        count(*) 부서인원수
FROM employees
GROUP BY department_id;

SELECT  department_id 부서번호, job_id 직업,
        ROUND(AVG(salary)) 평균급여,
        SUM(salary) 총급여합계,    
        count(*) 부서별_직업별_인원수
FROM employees
GROUP BY department_id, job_id;

--예제
SELECT department_id 부서명, 
       count(*) 사원수,
       MAX(salary) 최대_급여,
       MIN(salary) 최소_급여,
       sum(salary) 급여합계,
       round(AVG(salary)) 평균급여
FROM employees
group by department_id
order by 급여합계 desc;

SELECT  department_id 부서번호, 
        job_id 직업, 
        manager_id 상사번호,
        sum(salary) 월급합계,
        count(*) 직원수
FROM employees
group by department_id, job_id, manager_id
order by 부서번호;

SELECT round(avg(max(salary))) 부서별_최고_월급_평균,
             avg(min(salary))  부서별_최저_월급_평균
FROM employees
group by department_id;


--Having 절 :그룹함수를 이요한 조건절
select department_id 부서번호, sum(salary) 급여합계
FROM employees 
GROUP BY department_id
HAVING SUM(salary) >100000
ORDER BY department_id;

--예제
SELECT job_id 직종, sum(salary) 월급여합계
FROM employees
where job_id !='AC_MGR'
group by job_id
having avg(salary) > 10000 
order by 월급여합계 desc;

SELECT department_id 부서번호,
       round(AVG(salary)) 평균급여
FROM employees
where department_id !='40'
group by  department_id
having AVG(salary) <= 7000;

SELECT job_id, sum(salary) 급여총액
FROM employees
where job_id not like '%REP%'
group by job_id
having sum(salary) >= 13000
order by sum(salary) desc;








