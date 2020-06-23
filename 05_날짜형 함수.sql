--날짜형 함수
SELECT first_name, hire_date -- 날짜형식 데이터
FROM employees;

--sysdate 현재 날짜와 시간
select sysdate
from dual;

--날짜 + 숫자 => 날짜
select sysdate, sysdate+3, sysdate-3
from dual;

-- 날짜-날짜 = 총 일수
select employee_id, sysdate, hire_date,
    sysdate - hire_date, round(sysdate-hire_date)
from employees;
--시간계산
select sysdate + 5/24 --시간 1(하루)
from dual;
-- months_between : 월 계산
select employee_id, first_name,
    ROUND(MONTHS_BETWEEN(sysdate, hire_date)),
    (sysdate -hire_date)/30
from employees;    
--add_months: 달 덧셈
select employee_id, first_name, hire_date,
    add_months(hire_date, 4) --4달 더하기
from employees;   
--next_day (날짜, 다음번 나올 요일)
select sysdate, next_day(sysdate, '월요일')
from dual;
--last_day(날짜) 그 월의 마지막날
select last_day(sysdate)
from dual;
-- 날짜의 반올림
select employee_id, hire_date,
    round(hire_date,'month') 월, --날에서 반올림 1일
    round(hire_date,'year') 년   --월에서 반올림 1월 
from employees
where MONTHS_BETWEEN(sysdate, hire_date) <150;

--예제
SELECT sysdate, hire_date,
    months_between(sysdate, hire_date) 적용결과,
    round(months_between(sysdate, hire_date) ) "적용결과(반올림)"
FROM employees
where department_id = 100;

SELECT hire_date,
    add_months(hire_date, 3) 더하기_3개월,
    add_months(hire_date, -3) 빼기_3개월    
from employees
where employee_id between 100 and 106;
