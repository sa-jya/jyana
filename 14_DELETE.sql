--DELETE �������� ����

--71��~75�� �μ� ��ȣ ����
DELETE from departments
where department_id BETWEEN 71 and 75;
commit;

-- music ����
DELETE from departments
where department_id = 280;
commit;

--�������̺� id 1,2  ����
DELETE from employees
where employee_id in (1,2);
commit;

--���̺� ��ü ���� rollback ����
DELETE from copy_departments;
rollback;

--TRUNCATE : ��ü �����ε� ROLLBACK �ȵ�
TRUNCATE TABLE copy_departments;
rollback;

--drop ���̺� : ���̺� ����
DROP TABLE copy_departments;
DROP TABLE XX_EMP;
DROP TABLE copy_DEPT;

--���̺� ����Ʈ
UPDATE copy_emp
set salary = salary +10
where employee_id =108;
--salary ���� 12018
--���̺�����Ʈ a����
SAVEPOINT A;
UPDATE copy_emp
set salary = salary +20
where employee_id =108;
--salary ���� 12038
rollback to SAVEPOINT A;
--salary ���� 12018
-- �ѹ�
ROLLBACK;
commit;











