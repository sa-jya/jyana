--DCL data control language ������ ���� ���
-- �������� �������� ����
--grant : Ư�� ����ڿ��� ���� ������ �ο�
--REVOKE : Ư�� ����ڿ��� �� �� ������ ȸ�� �� ��Ż

--�� ���� �����
CREATE user John Identified by 1234; --������ ���� ����� ��� 1234
--���� ���� �ֱ�
grant CREATE SESSION to john; --john �������� ���� ���� �ֱ�
--���̺� ���� ���� �ο�
GRANT CREATE TABLE TO John;
--���̺� �����̽� ����(���̺��� ������ �� �ִ� ����)
CREATE TABLESPACE JohnSpace
datafile 'C:\oraclexe\app\oracle\oradata\XE\john.dbf' size 10M
AUTOEXTEND ON NEXT 5M;
--JohnSpace��� ���̺� ���� ���� ����
--������ ��� ����, ���ʻ����� 10mbyte
--�ڵ����� ���̺� ������ �����ϸ� 5mbyte�� �߰���

--�� ������ �� ���̺� �����̽��� ����� �� �ֵ���
ALTER USER John DEFAULT TABLESPACE JohnSpace; --����Ʈ �������̽���
ALTER USER John QUOTA UNLIMITED ON JohnSpace; --���̺����̽� ������

-- ��(role) �ο�
GRANT CONNECT, RESOURCE to John;
--Connect ���� ���Ӱ��� ���ѵ��� ����
--RESOURCE ���� ������ü��(���̺�, ���)�� ���� �� ��� ����

--������ ���� �� ȸ�� REVOKE + ���� + FROM + ����
REVOKE CREATE TABLE FROM John;

--���� ���� �� ȸ��
REVOKE RESOURCE FROM John; 

-- John ������ ����
DROP user John CASCADE;
-- ���̺����̽� ����
DROP TABLESPACE JohnSpace;

--���� �����Ǿ� �ִ� ���� Ȯ��
SELECT * FROM ALL_USERS;
SELECT * FROM DBA_USERS;

--����ڿ� �ο��� �ý��� ���� Ȯ��
SELECT
    *
FROM DBA_SYS_PRIVS
where GRANTEE='HR';










