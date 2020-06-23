--DELETE 데이터의 삭제

--71번~75번 부서 번호 삭제
DELETE from departments
where department_id BETWEEN 71 and 75;
commit;

-- music 삭제
DELETE from departments
where department_id = 280;
commit;

--직원테이블 id 1,2  삭제
DELETE from employees
where employee_id in (1,2);
commit;

--테이블 전체 삭제 rollback 가능
DELETE from copy_departments;
rollback;

--TRUNCATE : 전체 삭제인데 ROLLBACK 안됨
TRUNCATE TABLE copy_departments;
rollback;

--drop 테이블 : 테이블 삭제
DROP TABLE copy_departments;
DROP TABLE XX_EMP;
DROP TABLE copy_DEPT;

--세이브 포인트
UPDATE copy_emp
set salary = salary +10
where employee_id =108;
--salary 값이 12018
--세이브포인트 a만듬
SAVEPOINT A;
UPDATE copy_emp
set salary = salary +20
where employee_id =108;
--salary 값이 12038
rollback to SAVEPOINT A;
--salary 값이 12018
-- 롤백
ROLLBACK;
commit;











