--������
--������ ����
CREATE SEQUENCE ������1;
drop SEQUENCE ������1;
drop SEQUENCE ������2;
SELECT
    *
FROM user_sequences
where sequence_name ='������1';

--������ �׽�Ʈ ��� ���̺���
SELECT ������1.NEXTVAL FROM dual; --������ ���. nextval
SELECT ������1.currVAL FROM dual; --�������� ���簪 ����X

--������ �׽�Ʈ�� ���̺� ����
CREATE TABLE �μ�_�׽�Ʈ (
    �μ���ȣ NUMBER primary key,
    �μ��̸� VARCHAR2(100)
    );
INSERT INTO �μ�_�׽�Ʈ (�μ���ȣ, �μ��̸�)
VALUES (������1.nextval, '������');
INSERT INTO �μ�_�׽�Ʈ (�μ���ȣ, �μ��̸�)
VALUES (������1.nextval, '���ߺ�');
INSERT INTO �μ�_�׽�Ʈ (�μ���ȣ, �μ��̸�)
VALUES (������1.nextval, 'ȸ��');
commit;
SELECT
    *
FROM �μ�_�׽�Ʈ;

--������ �ɼ� ���
--������2 ���� ���۰��� 10, �������� 20
CREATE SEQUENCE ������2
start with 10 -- 10���ͽ���
INCREMENT by 20; --�������� 20

DELETE FROM �μ�_�׽�Ʈ;

INSERT INTO �μ�_�׽�Ʈ (�μ���ȣ, �μ��̸�)
VALUES (������2.nextval, '������');
INSERT INTO �μ�_�׽�Ʈ (�μ���ȣ, �μ��̸�)
VALUES (������2.nextval, '���ߺ�');
INSERT INTO �μ�_�׽�Ʈ (�μ���ȣ, �μ��̸�)
VALUES (������2.nextval, 'ȸ���');
INSERT INTO �μ�_�׽�Ʈ (�μ���ȣ, �μ��̸�)
VALUES (������2.nextval, '�����ú�');
INSERT INTO �μ�_�׽�Ʈ (�μ���ȣ, �μ��̸�)
VALUES (������2.nextval, '������');
commit;
SELECT
    *
FROM �μ�_�׽�Ʈ;

--������1�� �μ���ȣ�� ������Ʈ
UPDATE �μ�_�׽�Ʈ
set �μ���ȣ =������1.nextval;
--���̺� ����
DROP TABLE �μ�_�׽�Ʈ;
DROP SEQUENCE ������1;
DROP SEQUENCE ������2;
DROP TABLE dept CASCADE CONSTRAINTS;--�������ǵ� �Բ� ����
DROP TABLE emp;
DROP TABLE emp1;
DROP TABLE emp2;
DROP TABLE e_emp2;
DROP TABLE ex_date;
DROP TABLE �������̺�;
DROP TABLE stman;
DROP TABLE members;




