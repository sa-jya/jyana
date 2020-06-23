--���̺� �����
CREATE TABLE ex_date( --���̺� �̸�
    ex_id   number(2), --���� �̸�, ������ Ÿ��
    start_date  date  default sysdate
    --����Ʈ�� �Է¾ȵɽ� ����Ʈ ���� ������
);    
INSERT INTO ex_date(ex_id)
VALUES (1);
INSERT INTO ex_date(ex_id)
VALUES (2);
INSERT INTO ex_date(ex_id)
VALUES (3);
commit;
SELECT
    *
FROM ex_date;

--���̺� �����ϱ� DROP TABLE
DROP TABLE comp;
DROP TABLE copy_emp;

--����
CREATE TABLE sample_product(
            product_id  number,
            product_name    VARCHAR2(20),
            menu_date   date);
desc sample_product;
            
drop TABLE sample_product;
            
-- ���̺��� ��������(CONSTRAINT)
--�������� ���ʿ� ����
CREATE TABLE emp(
    eno NUMBER(3) CONSTRAINT emp_eno_pk PRIMARY key,
    emp_name VARCHAR2(20)
    );
desc emp;
INSERT into emp
VALUES (1, '��');
INSERT into emp
VALUES (2, '��');
SELECT
    *
FROM emp;
drop table emp;
--���������� �Ʒ��ʿ� ����
CREATE TABLE emp(
    eno NUMBER(3), 
    emp_name VARCHAR2(20),
    CONSTRAINT emp_eno_pk PRIMARY key(eno)
    );
desc emp;    
--���������� �̸�����
CREATE TABLE emp1(
    eno NUMBER(3) PRIMARY key, 
    emp_name VARCHAR2(20)   
    );
desc emp1;
INSERT into emp1
VALUES(1, '��');
drop table emp1;

--not null/uk ����ũ
CREATE TABLE emp1 (
    eno NUMBER(3),
    emp_name VARCHAR2(20) CONSTRAINT emp1_ename_nn NOT NULL,
    email VARCHAR2(30) CONSTRAINT emp1_email_uk UNIQUE
);    
-- not null�� null���� �Է��� �� ����.
INSERT into emp1
values ( 1, null, 'hong@naver.com');
desc  emp1;
--uk ����ũ�� ������ ���� �Ϸµ� �� ����.
INSERT into emp1
values ( 1, 'ȫ�浿', 'hong@naver.com');
INSERT into emp1
values ( 2, ������l, 'hong@naver.com');
-check ��������
CREATE TABLE emp2 (
    eno number(3),
    emp_name VARCHAR2(20) CONSTRAINT emp2_ename_nn NOT NULL,
    sal number(10), CONSTRAINT emp2_sal_check CHECK(sal > 1000)
);
INSERT INTO emp2
Values (1, 'ȫ�浿', 1999);
SELECT
    *
FROM emp2;
drop TABLE emp;
CREATE TABLE emp(
    eno NUMBER(4) primary key,
    ename varchar2(20) not null,
    gno varchar2(13) unique check(length(gno) >=8),
    gender varchar2(5) check(gender IN ('woman','man'))
);

INSERT into emp values (1, '��','12345678', 'man');
INSERT into emp values (2, '��','123456789', 'woman');
INSERT into emp values (3, '��','123456789', 'human');
rollback;

--����
create table members(
    members_id number(2) primary key,
    first_name VARCHAR2(50) not null,
    last_name VARCHAR2(50) not null,
    gender VARCHAR2(5) check(gender in('man','woman')),
    birth_day date default sysdate,
    email varchar2(200) unique not null
    );
desc members;

--�ܷ�Ű (fk)
create table dept(
    dno NUMBER(4),
    dname VARCHAR2(20),
    constraint dept_dno_pk primary key(dno)--�⺻Ű
   );
DROP TABLE emp;
create table emp(
    eno number(4),
    emp_name VARCHAR2(20),
    sal number(10),
    dno number(4),
    constraint emp_eno_pk primary key(eno), --�⺻Ű
    constraint emp_dno_fk foreign key(dno) 
    --references dept(dno) on delete cascade--������ ������ �ڵ�����
    references dept(dno) on delete set null
    );    
desc emp;
INSERT INTO dept VALUES (10, 'TEST1');
INSERT INTO dept VALUES (20, 'TEST2');
INSERT INTO dept VALUES (30, 'TEST3');
INSERT INTO dept VALUES (40, 'TEST4');
INSERT INTO dept VALUES (50, 'TEST5');
SELECT
    *
FROM dept;
INSERT INTO emp VALUES (1010, 'KIM',200,10);
INSERT INTO emp VALUES (1020, 'LEE',180,20);
INSERT INTO emp VALUES (1030, 'JUNG',220,30);
INSERT INTO emp VALUES (1040, 'OH',250,40);
INSERT INTO emp VALUES (1050, 'KING',300,50);
SELECT
    *
FROM emp;
delete from emp;
--�ܷ�Ű�� �������� �� �̿ܿ��� �ԷºҰ�
INSERT INTO emp VALUES (1060, 'KANG',300,60);
--��, �ΰ��� �Է°���
INSERT INTO emp VALUES (1060, 'KANG',300,null);

--������ ���� �߻� (�ܷ�Ű �������� �� �ɸ�)
DELETE FROM dept
where dno = 30;
-- 1 ������ ������ �ڵ� ����
-- on delete cascade
-- 2 ������ ������ �ڵ� �ΰ� �Է�
-- on delete set null





            
            
            