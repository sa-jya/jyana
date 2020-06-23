--�ε��� Ȯ��
SELECT table_name ���̺��,
       INDEX_NAME �ε����̸�,
       column_name �÷��̸�
from all_IND_COLUMNS
where TABLE_NAME ='DEPARTMENTS';
drop table members;
--�ǽ����� ���̺� �����
CREATE TABLE members(
    member_id NUMBER,
    first_name VARCHAR2(100) not null,
    last_name VARCHAR2(100) not null,
    gender char(1) not null,
    dob date not null,
    email varchar2(255) not null,
    primary key(member_id));
desc members;    

SELECT table_name ���̺��,
       INDEX_NAME �ε����̸�,
       column_name �÷��̸�
from all_IND_COLUMNS
where TABLE_NAME ='MEMBERS';

SELECT
    *
FROM members
where last_name = 'Harse'; -- ���̺� ��ü �˻�

EXPLAIN PLAN FOR -- ���� ������ select ���� �����Ͽ� ���� �ۼ�
SELECT * FROM members
where last_name = 'Harse';

SELECT PLAN_TABLE_OUTPUT --������ ���
FROM TABLE(DBMS_XPLAN.DISPLAY());

--�ε��� �����
CREATE INDEX members_last_name_i
ON members(last_name);

--�ε��� �����ϱ�
DROP INDEX members_last_name_i;

SELECT
    *
FROM members
where first_name LIKE 'M%' and last_name like 'A%';

--������
EXPLAIN PLAN FOR -- ���� ������ select ���� �����Ͽ� ���� �ۼ�
SELECT * FROM members
where first_name LIKE 'M%' and last_name like 'A%';

SELECT PLAN_TABLE_OUTPUT --������ ���
FROM TABLE(DBMS_XPLAN.DISPLAY());

--��Ƽ �ε��� �����
CREATE INDEX name_i
on members (first_name, last_name);
--�ε��� �����ϱ�
DROP INDEX name_i;






    