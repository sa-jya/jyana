--���������� �߰� �� ����
create table class (
    cno VARCHAR2(2),
    cname VARCHAR2(50)
);
--���̺��� �� ���� �Է�
INSERT INTO class values ( '01', '�����ͺ��̽�');    
INSERT INTO class values ( '02', '�ڹ�');
SELECT
    *
FROM class;

--�л� ���̺� ����
CREATE TABLE student (
    sno VARCHAR2(4),
    sname varchar2(50),
    cno VARCHAR(2)
);
--�л� ���̺� �� ���� �Է�
DELETE FROM student;
INSERT INTO student values ( '0414', 'ȫ�浿', '01');
INSERT INTO student values ( '0415', '�Ӳ���', '02');
INSERT INTO student values ( '0416', '�̼���', '03');
commit;
SELECT
    *
FROM student;
--Ŭ���� ���̺� �⺻Ű �߰�
DELETE FROM class;
ALTER TABLE class
ADD CONSTRAINT class_cno_pk PRIMARY KEY(cno);
--�⺻Ű�� �ΰ��̳� �ߺ��� �� ����
INSERT INTO class values ( '01', '�����ͺ��̽�');   

--Ŭ���� ���̺� ����ũ Ű�� �߰�
ALTER TABLE class
add CONSTRAINT class_cname_pk UNIQUE (cname);
--����ũ�� �ߺ��ȵ�
INSERT into class VALUES ('03', '�����ͺ��̽�');

--���������� ��ȸ�ϴ� ��ɹ�
SELECT
    *
FROM all_constraints -- ��� ��������
where table_name ='CLASS'; --��ȸ�� �빮��

SELECT
    *
FROM all_constraints -- ��� ��������
where table_name ='DEPARTMENTS';

--�л����̺� �⺻Ű�� �߰�
ALTER TABLE student
ADD CONSTRAINT student_sno_pk primary key (sno);
--�л����̺��� sname�� not null �߰�
ALTER table student
MODIFY sname CONSTRAINT student_sname_nn NOT NULL;
--�л� ���̺� �ܷ�Ű �߰�
ALTER table student
ADD CONSTRAINT student_cno_fk FOREIGN key(cno) --�ܷ�Ű �߰�
        REFERENCES class(cno); -- Ŭ�������� cno���� ����
SELECT
    *
FROM class;

SELECT
    *
FROM student;
--���������� �߰��Ҷ� �̹� ������� ���̺� �� ���� �����Ͱ� �����ؾ�
--���������� �߰��ȴ�.
UPDATE student SET cno = '01'
where sno ='0416';

--���������� ����
--���������� �̸����� ����
-- cascade �ɼǽ� �����ϴ� �ܷ�Ű�� ����
ALTER TABLE class
DROP CONSTRAINT class_cno_pk cascade;
--������������ ����
ALTER TABLE class
DROP UNIQUE(cname); -- Ŭ���� ���̺��� cname���� ����ũ �������� ����

ALTER TABLE student
DROP PRIMARY KEY; -- �⺻Ű�� ����

--���̺��� ����
DROP TABLE class;
DROP TABLE student;

--���̺� �÷�(��)�� �߰��� ����

--90�� �μ��� �������� �����̺� E_EMP�� �Է�
CREATE TABLE E_EMP
AS
SELECT employee_id, last_name, salary, department_id
  FROM employees
where department_id = 90;

--���� �̸��� �����ؼ� E_EMP2 ���̺� ����
CREATE TABLE E_EMP2(emp_id, name, sal, dept_id)
AS
SELECT employee_id, last_name, salary, department_id
  FROM employees
where department_id = 90;
SELECT
    *
FROM e_emp2;

--���� �߰�
SELECT
    *
FROM e_emp;

ALTER TABLE e_emp
ADD (GENDER VARCHAR2(1));
--����Ʈ ���� 0���� �ϴ� �� �߰�
ALTER TABLE E_EMP
ADD (Ŀ�̼� NUMBER DEFAULT 0 not null);
--�ΰ��� ���� �߰�
ALTER TABLE E_EMP
ADD (��¥ DATE DEFAULT SYSDATE, ������ VARCHAR2(100) DEFAULT user);

--���� ����
SELECT
    *
FROM E_EMP;

--������ ������ ����
ALTER TABLE E_EMP
MODIFY (������ VARCHAR2(200));-- ����(100) => (200) �����
desc e_emp;

ALTER TABLE E_EMP
MODIFY (������ VARCHAR2(50));-- ����(200) => (50) �����
desc e_emp;

ALTER TABLE E_EMP
MODIFY (������ VARCHAR2(1));-- ����(50) => (1) ����� error

ALTER TABLE E_EMP
MODIFY (������ number); --�̹� ������ �����Ͱ� �ֱ⶧���� ���������� �ٲ� �� ����

SELECT
    *
FROM e_emp;

--NULL���� ��쿡 �Էµ� ���� ���� ������ ������ ������ �ٲ� �� ����.
ALTER TABLE E_EMP
MODIFY (GENDER number);
--�������� ������ ������ �ٲٷ� �ϸ�
update E_EMP
set ������ = null;

--���� ����
ALTER TABLE e_emp
drop COLUMN ������; -- ������ �� ����
-- �������� �� ����
ALTER TABLE e_emp
drop (gender, Ŀ�̼�, ��¥); -- ������ ���� ����

SELECT * FROM e_emp;

-- ���� �̸� ����
ALTER  TABLE e_emp
RENAME COLUMN department_id TO �μ���ȣ;
ALTER  TABLE e_emp
RENAME COLUMN salary TO �޿�;
ALTER  TABLE e_emp
RENAME COLUMN last_name TO �̸�;
ALTER  TABLE e_emp
RENAME COLUMN employee_id TO ������ȣ;
--���̺��� �̸� ����
RENAME E_EMP to �������̺�;
SELECT * FROM �������̺�;

--����
CREATE TABLE stman(id, job, sal)
AS
SELECT employee_id, job_id, salary
  FROM employees
where job_id = 'ST_MAN';
SELECT
    *
FROM stman;
    















