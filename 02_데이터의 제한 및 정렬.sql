-- 1. 테이블의 모든 데이터 가져오기
select * from employees;
-- 2. where 절에 가져올 행을 선택한다.
--  위치는 from 절 다음에 위치
select *
from employees
WHERE department_id = 90;

select *
from employees
WHERE salary = 24000; -- 월급이 24000인 직원
/*
where 절을 사용할때 주의점
문자(String)과 날짜(Date) 값은 항상 따옴표(')로 표시 3
문자값은 대소문자를 구분한다.(Case-Sensitive)
날짜값은 날짜포맷에 벗어나지 않도록 (Format-Sensitive)
오라클의 날짜포맷은 RR/MM/DD(RR은 2자리 년도)
*/
-- 3. where + 문자열
select employee_id, first_name, last_name, job_id
from employees
where first_name = 'Steven';

-- 4. where + 날짜
select sysdate from dual; 
--dual은 샘플 테이블 sysdate는 현재 날짜 시간

select * 
from employees
where hire_date >= '03/06/17';-- 년/월/일

-- 비교연산자
select * 
from employees
where salary >= 10000; --숫자비교

select * 
from employees
where hire_date >= '03/06/17'; --날짜비교

select * 
from employees
where first_name > 'King'; -- 문자비교(알파벳순)

--예제1
select * 
from employees
where employee_id = 100;
--예제2
select * 
from employees
where first_name = 'David';
--예제3
select * 
from employees
where employee_id <= 105;
--예제4
select * 
from job_history
where start_date > '06/03/03';
--예제5
select * 
from departments
where location_id != 1700; -- <>1700

-- 6. AND OR
SELECT*
from employees
where (department_id = 60 OR 
    department_id = 80) AND salary > 10000;
SELECT *
FROM employees
where hire_date > '08/04/04' or salary > 13000
    and job_id = 'AD_VP';
--not 
SELECT *
FROM employees
where NOT(hire_date > '04/01/01' or salary > 5000);
  


-- 예제1
SELECT *
FROM employees
where salary > 4000 and job_id = 'IT_PROG';
-- 예제2
SELECT *
FROM employees
where salary > 4000 and (job_id = 'IT_PROG' or job_id ='FI_ACCOUNT');

-- IN 연산자
SELECT *
FROM employees
where salary = 4000 or salary =3000 or salary =2700;

SELECT *
FROM employees
where salary IN (4000, 3000, 2700);

-- 예제1
SELECT *
FROM employees
where salary IN (10000, 17000, 24000);
-- 예제2
SELECT *
FROM employees
where  department_id not IN (30,50,80,100,110);

-- Between 연산자
select *
from employees
where salary >= 9000 and salary <=10000;
select *
from employees
where salary between 9000 and 10000;

--예제
select *
from employees
where salary between 10000 and 20000;

select *
from employees
where hire_date between '04/01/01' and '04/12/30'; 

select *
from employees
where salary not between 7000 and 17000;

--Like 연산자 _ 와 % 를 사용
/*% 는 문자가 0개 또는 1개 이상
_ 는 문자가 1개
*/
select *
from employees
where last_name Like 'B%';

select *
from employees
where last_name like '%b%';

select *
from employees
where first_name like '_d%';

select *
from employees
where first_name like '__s%';

-- 예제

SELECT *
FROM employees
where job_id like '%AD%';

SELECT *
FROM employees
where job_id like '%AD___';

SELECT *
FROM employees
where phone_number like '%1234';

SELECT *
FROM employees
where phone_number not like '%3%' and phone_number like '%9';

SELECT *
FROM employees
where job_id like '%MGR%' or job_id Like'%ASST%';


-- is null / is not null 연산자
select *
from employees
where commission_pct is null; -- == null(x)

select *
from employees
where commission_pct is not null;

-- 예제
select *
from employees
where manager_id is null;

-- order by
select *
from employees
ORDER BY salary; -- 기본이 오름차순 = ASC(생략 가능)

select *
from employees
ORDER BY salary desc; --내림차순 DESC(생략 불가능, 큰 것이 제일 위에)

select *
from employees
ORDER BY last_name; -- 문자는 알파벳 순으로 정렬

--멀티 정렬
select employee_id , last_name, department_id 
from employees
ORDER BY department_id , employee_id  desc; --부서번호로 정렬 후 사원번호는 내림차순 정렬

-- 열을 생성하여 정렬
select employee_id, last_name, salary*12 연봉
from employees
order by 연봉 DESC; --연봉 내림차순 정렬

--order by  는  where 절 다음에 위치
select employee_id, department_id , last_name, salary*12 연봉
from employees
where department_id = 90 -- 90번부서
order by 연봉 DESC; --연봉 내림차순 정렬

--예제
SELECT employee_id, first_name, last_name
from employees
order by employee_id DESC;

select *
from employees
where job_id like '%CLERK%'
order by salary desc;

SELECT  employee_id , first_name, department_id, salary
FROM  employees
where employee_id BETWEEN 120 and 150
order by department_id desc, salary desc; --큰순으로 정렬











