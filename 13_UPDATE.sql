-- UPDATE : 데이터 수정하기

--업데이트 사용시 where 절에 항상 키본키를 활용한다.
CREATE table copy_emp
AS
SELECT
    *
FROM employees;

UPDATE copy_emp
set salary = 24100
where employee_id =100;
commit;
-- 의도치 않게 이름이 같은 사람들이 업데이트 됨.
UPDATE copy_emp
set salary = 24100
where first_name ='Steven';
commit;
-- where  절을 안썻을때
UPDATE copy_emp
set phone_number = '123-456-789';
ROLLBACK; --되돌림

--예제
INSERT INTO departments (department_id,  department_name)
VALUES (280, 'Music');
commit;
UPDATE departments
set manager_id = 100, location_id = 1800
WHERE department_name = 'Music';
commit;

UPDATE copy_departments
set manager_id= 100, location_id=1800
where department_id = 74;
commit;
UPDATE copy_departments
set manager_id= 100, location_id=1800
where department_id = 75;
commit;

UPDATE copy_departments
set manager_id =100
where department_id BETWEEN 150 and 200;
commit;

















