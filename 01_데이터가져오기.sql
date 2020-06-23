-- 한줄의 주석. 단축키 ctrl+/
/*
여러줄 주석을 다는 방법
*/ 
-- 1. 테이블의 모든 행과 열을 읽어오기 *
select*
from departments;

--2. 특정 열만 읽어오기
select department_id, departments_name
from departments;

-- 3. 산술 연산자 사용(+,-,*/)
select employee_id, first_name, salary
from employees;

select employee_id, first_name, salary, salary+100, salary +  (salary * 0.1)
from employees;

--4. 널(null) 이란?
-- 널은 입력되지 않은, 사용 가능 하지 않은, 알 수 없는 값
-- 널 값은 0 또는 공백(" ")과는 다르다
select last_name, job_id, salary, commission_pct
from employees;

select last_name, job_id, salary, commission_pct, commission_pct+10
from employees;

--5. 중복된 값 제거 : distinct
select DISTINCT job_id
from EMPLOYEES;

--예제1,2,3
SELECT employee_id, first_name, last_name
FROM employees;
SELECT first_name, salary, salary*1.1 as 뉴셀러리
FROM employees;
SELECT employee_id as 사원번호, first_name as 이름, last_name as 성 
FROM employees;

-- 연결 연산자 (||)
select last_name||' is a '||job_id as "직업 정보"
from employees;

select employee_id, first_name||' '||last_name 풀네임
from employees;

-- 예제 4
select employee_id, first_name||' '||last_name, email||' @company.com'
from employees;








