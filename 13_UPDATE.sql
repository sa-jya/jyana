-- UPDATE : ������ �����ϱ�

--������Ʈ ���� where ���� �׻� Ű��Ű�� Ȱ���Ѵ�.
CREATE table copy_emp
AS
SELECT
    *
FROM employees;

UPDATE copy_emp
set salary = 24100
where employee_id =100;
commit;
-- �ǵ�ġ �ʰ� �̸��� ���� ������� ������Ʈ ��.
UPDATE copy_emp
set salary = 24100
where first_name ='Steven';
commit;
-- where  ���� �ț�����
UPDATE copy_emp
set phone_number = '123-456-789';
ROLLBACK; --�ǵ���

--����
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

















