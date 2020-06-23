-- 문자형 함수는 대소문자 함수와 함수와 문자 조작함수로 나뉜다.

--1. 대소문자 조작 함수 (upper,lower, initcap)
select 1+1
from dual; --듀얼테이블은 연습용 테이블

select lower('sql course'), upper('sql course'), initcap('sql course')
from dual;

-- 문자함수를 where 절에 사용
select employee_id, first_name
from employees
where upper(first_name) = 'PATRICK' ;

--2.문자 조작 함수들
--concat (문자열을 합침)
SELECT first_name, last_name, concat(first_name, last_name) 풀네임
from employees;
--substr (열이름, m, n): m은 시작문자, n은 잘라낼 길이
select employee_id, first_name,
substr(first_name, 1, 3),
substr(first_name, 2, 4),
substr(first_name, 2), --시작부터 끝까지
substr(first_name, -3) -- 음수(-)일때 끝에서 부터 카운트
from employees;
-- length: 문자열의 길이
select first_name, LENGTH(first_name)
from employees;

--INSTR(문자열, 찾을 문자, m, n)
--m은 검사 시작 위치
--n은 찾을 횟수
--디폴트 값은 m, n 각각 1
select first_name,
INSTR(first_name, 'e', 2),
INSTR(first_name, 'e', 5),
INSTR(first_name, 'e', 1, 2)
from employees
where first_name = 'Nanette';

--LPAD, RPAD ( 문자열, 자릿수, 채울문자)
select employee_id, first_name, salary,
    LPAD(salary, 10,'#'), RPAD(salary, 10, '*')
from employees;

-- 공백을 이용해 문자열을 분리
SELECT
'황보 길동' 성명,
SUBSTR('황보 길동',1, instr('황보 길동',' ' )-1) 성,
substr('황보 길동', instr('황보 길동', ' ')+1) 이름
from dual;

-- 문자형 함수 예제
select last_name, concat('직업명이 ', job_id) AS 직업명
from employees
where substr(job_id, 4, 3) = 'REP';
--job_id의 4번째문자부터 REP 인 경우

select employee_id, 
    concat(first_name, last_name) 전체이름,
    last_name,
    LENGTH(last_name) 길이,
    instr(last_name, 'a') "'a'가 몇번째?"
from employees;

--문자 치환 : replace
select job_id, replace(job_id, 'ACCOUNT', 'ACCNT') 적용
from employees
where job_id like '%ACCOUNT%';


--예제
select last_name 이름, lower(last_name), upper(last_name), email 이메일, initcap(email)
from employees;

SELECT job_id 직업명, substr(job_id, 1, 2) "앞의 2개"
FROM employees;




