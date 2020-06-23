-- 서브쿼리

--Abel 직원보다 급여를 더 많이 받는 직원들은?
--Abel의 급여확인
SELECT salary
FROM employees
where last_name = 'Abel';
--서브쿼리를 사용
--단일행 연산자( =,>,<,<=,>=,<>,!=)
SELECT employee_id, last_name, salary
FROM employees
WHERE salary >(SELECT salary
               FROM employees
               where last_name = 'Abel');
--에러가 나는 경우
SELECT employee_id, last_name, salary
FROM employees
WHERE salary >(SELECT salary
               FROM employees
               where department_id = 30);
--그룹함수를 서브쿼리로 이용
--그룹함수 예로 MAX는 가장 높은 급ㅇ를 받는 사람을 알 수 없음
SELECT
    *
FROM employees
WHERE salary = (SELECT max(salary) from employees);

--예제
SELECT last_name, salary
FROM employees
WHERE salary >(SELECT salary
               FROM employees
               where last_name = 'Abel');

SELECT employee_id 직원번호, last_name 이름,
      department_id 부서번호, salary 급여
FROM employees
WHERE department_id = (SELECT department_id
               FROM employees
               where last_name = 'Bull')
and salary > (SELECT salary
               FROM employees
               where last_name = 'Bull');
               
SELECT last_name, salary, manager_id
FROM employees
where manager_id = (SELECT employee_id
               FROM employees
               where last_name = 'Russell');
               
SELECT
    *
FROM employees
where job_id =(SELECT job_id
               FROM jobs
               where job_title = 'Stock Manager');

--다중행 서브쿼리
--연산자 (in,any,all)
SELECT salary
FROM employees
WHERE department_id =90;

--in
SELECT employee_id, first_name, last_name, salary, department_id
FROM employees
where salary in(SELECT salary
                FROM employees
                WHERE department_id =90);
--any : 하나의 조건만 만족해도 됨, 연산자 앞에 붙여야됨
SELECT employee_id, first_name, last_name, salary
FROM employees 
where salary >= any (SELECT salary
                    FROM employees
                    WHERE department_id =90);
--all : 모든 조건을 만족해야 함
SELECT employee_id, first_name, last_name, salary
FROM employees 
where salary >= all (SELECT salary
                    FROM employees
                    WHERE department_id =90);
--예제
SELECT employee_id, first_name, job_id, salary
FROM employees
where department_id != 20 
and  manager_id in(SELECT manager_id
                    FROM employees
                    WHERE department_id =20);

SELECT employee_id, last_name, job_id, salary
FROM employees
where salary < any(SELECT salary
                    FROM employees
                    WHERE job_id ='ST_MAN');
                    
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < all(select salary
             FROM employees
             WHERE job_id ='IT_PROG');

--다중열 서브쿼리
SELECT employee_id, first_name, job_id, salary, manager_id
FROM employees
where (manager_id, job_id) in (select manager_id, job_id
                               FROM employees
                               WHERE first_name ='Bruce')
    AND first_name <> 'Bruce';                               
--부서별로 최소급여를 받는 사원의 부서번호, 사원번호, 이름, 급여 정보 검색
SELECT department_id 부서번호, employee_id 사원번호, first_name 이름, salary 급여
FROM employees
where (department_id, salary) in (select department_id, min(salary)
                               FROM employees
                               GROUP by department_id )
order by department_id;                               
--예제
SELECT first_name, job_id, salary, department_id
FROM employees
WHERE (salary, job_id) in (select min(salary), job_id
                               FROM employees
                               group by job_id)
order by salary desc;


               