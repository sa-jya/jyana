--DML �۾�

--INSERT: �� ���� �Է��ϱ�
-- 1. ������ ���� ���������� Ȯ�� (DESC + ���̺�)
DESC departments; --�μ����̺� ����ؼ�

--��ü ���� �� �Է��ϴ� ���
INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES (71,'���ߺ�1',100,1700);

SELECT
    *
FROM departments;

commit;

--���� �̸��� ���� ��� ��ü ���� �� �Է��ؾ� ��
INSERT INTO departments 
VALUES (72,'���ߺ�2',100,1700);

commit;

--���� ������ �ٲܰ��
INSERT INTO departments ( department_name, manager_id, location_id,department_id)
VALUES ('���ߺ�3',100,1700,73);

commit;

--�ڵ����� �ΰ� �Է�
INSERT INTO departments ( department_name, department_id)
VALUES ('���ߺ�4', 74);
commit;
DESC departments;

--sysdate ���糯¥ �Է�

INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES (1, 'ȫ', '�浿', 'hong@naver.com', sysdate, 'IT_PROG' );

commit;

desc employees;

--��¥ �Է��ϱ�
INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES (2, '��', 'ȣ��', 'kang@naver.com', TO_DATE('2020-04-05','YYYY-MM-DD'), 'IT_PROG' );

COMMIT;

--����ڷκ��� �Է¹ޱ�
INSERT INTO departments ( department_name, department_id)
VALUES ('&name', &id);
commit;

--���̺� �����
create TABLE XX_EMP (
    EMPNO number,
    ENAME VARCHAR2(100),
    sal  number );
--���̺��� ��ü�� ī���ؼ� �Է��ϴ� ���
INSERT INTO XX_EMP(EMPNO, ENAME, SAL)
SELECT employee_id, first_name,salary
FROM employees ;

--INSERT�� ���� �߿� ������ ���� ���
--1 �⺻Ű�� �̹� �ִ� (�ߺ���) ���� �Է��� ���
INSERT INTO departments ( department_name, department_id, manager_id, location_id)
VALUES ('���ߺ�10', 10,100,1700);
--2 FK(�܎mŰ)�� �������� ���� ���� �Է�
INSERT INTO departments ( department_name, department_id, manager_id, location_id)
VALUES ('���ߺ�5', 5,100,1);
--3 �������� ������ Ʋ����
INSERT INTO departments ( department_name, department_id, manager_id, location_id)
VALUES ('���ߺ�5', '10',100,'D1');
--4 �������� ����� ���� ������
INSERT INTO departments ( department_name, department_id, manager_id, location_id)
VALUES ('���ߺ�5 ���ߺ�5 ���ߺ�5 ���ߺ�5 ���ߺ�5 ���ߺ�5', '10',100,'1');
desc departments;

--���̺��� ī���ϱ�
CREATE TABLE copy_DEPT
AS
SELECT
    *
FROM departments;

--����
INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES (271, 'Sample Dept 1', 200, 1700);
commit;
INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES (272, 'Sample Dept 2', 200, 1700);
commit;
INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES (273, 'Sample Dept 3', 200, 1700);
commit;

CREATE TABLE copy_departments( department_id number(4,0),
                              department_name varchar2(30 byte),
                              manager_id number(6,0),
                              location_id number(4,0));
commit;                              
INSERT INTO copy_departments(department_id, department_name, manager_id, location_id)
SELECT *
FROM departments ;
desc departments;

