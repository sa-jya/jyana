--변환형 함수

--To_CHAR
--숫자를 문자로 변환
--콤마(,)
select TO_CHAR(12345678, '999,999,999') 콤마
from dual;
--소수점
select TO_CHAR(123.45678, '999,999,999.99') 소수점
from dual;
--$표시
select TO_CHAR(12345678, '$999,999,999') 달러표시
from dual;
--L표시
select TO_CHAR(12345678, 'L999,999,999') 현지통화
from dual;
--왼쪽에 0을 삽입
select TO_CHAR(123, '09999') 제로표시 --남는 공간을 0으로 변환
from dual;

--날짜를 문자로 변환
--년, 월, 일, 시, 분, 초
select to_char(SYSDATE, 'YY.MM.DD HH24:MI:ss') 현재날짜시간
from dual;
--365일중 오늘이 몇일 ?
select to_char(SYSDATE, 'DDD') 날짜
from dual;
--오늘의 월 ?
select to_char(SYSDATE, 'MONTH') 몇월
from dual;

--예제
select employee_id, to_char(hire_date, 'mm/yy') 입사월
from employees
where department_id = 100;

select last_name 이름, to_char(salary, '$999,999.99') 월급
from employees
where salary > 10000
ORDER BY salary desc;

-- 문자를 날짜로 TO_DATE
select TO_DATE('2011-01-01', 'YYYY-MM-DD')
from dual;

--문자를 숫자로 TO_NUMBER
SELECT to_number('0123123') + 100
FROM dual;













