-- 숫자형 함수

--ROUND : 반올림
SELECT  ROUND(15.193,1) 소수첫째자리,
        ROUND(15.193,2) 소수둘째자리,
        ROUND(15.193,0) 정수,
        ROUND(15.193) 디폴트,
        ROUND(15.193,-1) "10의 자리",
        ROUND(155.193,-2) "100의 자리"
FROM DUAL;        
--TRUNC : 버림
SELECT  TRUNC(15.79,1) 소수첫째자리,
        TRUNC(15.79,0) 정수,
        TRUNC(15.79) 디폴트,
        TRUNC(15.79,-1) "10의 자리"
FROM DUAL; 
--MOD
SELECT employee_id 짝수번, last_name
FROM employees
WHERE MOD(EMPLOYEE_ID, 2)=0
ORDER BY 1;-- 1번째 열로 정렬(오름차순)

--예제
SELECT  salary,
        ROUND(salary/30, 0) 정수,
        ROUND(salary/30, 1) 소수1,
        ROUND(salary/30, -1) "10의 자리"
FROM employees;







