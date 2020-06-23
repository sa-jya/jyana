--null 관련 함수
--NVL : 널값을 다른 값으로 바꿀때 사용
SELECT last_name, manager_id, NVL(manager_id,0) 매니저
FROM employees
where last_name = 'King';

--nvl2(ex,ex1,ex2) : ex값이 NULL값이 아니면 ex1
SELECT last_name, NVL2(manager_id,1,0) 매니저
FROM employees
where last_name = 'King';

--NULLIF(ex1, ex2): ex1과 ex2값이 동일하면 NULL
--동일하지 않으면 ex1으로 출력
SELECT NULLIF(1,1), NULLIF(1,2)
FROM dual;
--COALESCE(ex1, ex2, ex3, ...)
--ex1이 널값이면 ex2 반환, ex2도 널값이면 ex3반환...
select last_name 이름, salary 월급,
    commission_pct 커미션pct, COALESCE((salary+(commission_pct*salary)), salary+2000) 월급인상    
from employees
ORDER BY 3;

--예제
SELECT last_name, salary, 
     NVL(commission_pct, 0) 커미션, 
     (salary*12)+(salary*12*NVL(commission_pct, 0)) 연봉
FROM employees
order by 연봉 desc;

SELECT last_name, salary, 
     NVL(commission_pct, 0) 커미션, 
     (salary*12)+(salary*12*NVL(commission_pct, 0)) 연봉,
    NVL2(commission_pct, 'SAL+COMM', 'SAL')연봉계산
FROM employees
order by 연봉 desc;

select  first_name,        
        LENGTH(first_name) 글자수, 
        last_name,
        LENGTH(last_name) 글자수2,
        NULLIF( LENGTH(first_name),LENGTH(last_name)) 결과
FROM employees;

--DECODE 함수
SELECT last_name 이름, job_id, salary,
        DECODE(job_id, 'IT_PROG', salary*1.10,
                       'ST_CLERK', salary*1.15, 
                       'SA_REP', salary*1.20,             
                                  salary) 수정월급
FROM employees;

--예제
SELECT last_name 이름, job_id, salary,
        DECODE(TRUNC(salary/2000), 0, 0,
                                   1,0.9,
                                   2,0.20,
                                   3,0.30,
                                   4,0.40,
                                   5,0.42,
                                   6,0.44,
                                     0.45 ) 세율
FROM employees;

--CASE함수
SELECT last_name 이름, job_id, salary,
    case when salary<5000 then 'Low'
         when salary<10000 then 'Medium'
         when salary<20000 then 'Good'
              ElSE              'Excellent'    
     end "급여수준"         
FROM employees;

--예제
SELECT employee_id, first_name, last_name, salary,
    case when salary>=9000 then '상위급여'
         when salary>=6000 then '중위급여'
              ElSE              '하위급여'    
     end "급여등급"         
FROM employees
where job_id = 'IT_PROG';






