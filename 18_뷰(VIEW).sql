-- �ܼ��� �� ����� emp_v1
--�ϳ��� �������̺� ���, �Լ��� �׷� ��� ����, DML ��밡��

DROP VIEW EMP_V1; --�̸� �� ���� ���

--employees ���̺��� �ʿ��� ������ ��� ��� ����
create VIEW EMP_V1
as
SELECT employee_id, last_name, email, hire_date,job_id
FROM employees;
--���̺�ó�� select �� ���
SELECT
    *
FROM emp_v1;
desc emp_v1;
--���̺�ó�� DML��밡�� (��� ������ ���̺�=> �������̺� �Էµ�)
INSERT INTO EMP_V1 (employee_id, last_name, email, hire_date,job_id)
VALUES (333, 'David', 'DAVID',SYSDATE, 'IT_PROG');
--��Ȯ��
SELECT
    *
FROM emp_v1;
SELECT
    *
FROM employees;
desc employees;
--�����ϱ�
DELETE FROM emp_v1
where employee_id = 333;
commit;
--�ι�° �� �����
CREATE view emp_v2
as
SELECT employee_id ������ȣ, last_name �̸�, email, hire_date, job_id
FROM employees;

SELECT
    *
FROM emp_v2;
--����° �� �����
CREATE view emp_v3(������ȣ, �̸�, �̸���, �������, ����)
as
SELECT employee_id, last_name, email, hire_date, job_id
FROM employees;
SELECT * FROM emp_v1;
SELECT * FROM emp_v2;
SELECT * FROM emp_v3;
SELECT * FROM employees;

--DML ��� 3��° �信��
INSERT INTO emp_v3 (������ȣ, �̸�, �̸���, �������, ����)
VALUES (334, 'Lala', 'LALA', sysdate, 'IT_PROG');

--������ �丸���
-- �׷��Լ��� ����� ��� DML ���Ұ�
-- or replace�� ����Ͽ� ������ ������
CREATE or REPLACE view �μ���_����_����
as
SELECT department_id �μ���ȣ, count(employee_id) ������,
       MAX(salary) �ְ�޿�, MIN(salary) �����޿�,
       ROUND(AVG(salary)) ��ձ޿�
FROM employees
GROUP BY department_id
order by  �μ���ȣ;  

SELECT * FROM �μ���_����_����;

--�б� ���� �� ( �ɼ� with READ ONLY )
create or replace view emp_v_read
AS
SELECT employee_id, last_name, email, hire_date, job_id
FROM employees
where department_id = 90
WITH READ ONLY; -- �б� ����

SELECT
    *
FROM emp_v_read;

--DML ��� �Ұ�
DELETE FROM EMP_V_READ; -- ��� �� ���� �Ұ� �б�����!!

--üũ �ɼ� ��
CREATE or REPLACE view emp_v_check
as
SELECT employee_id, last_name, email, hire_date, job_id, department_id
FROM employees
where department_id = 90
WITH check option; -- where ���� ���ǿ����� ���� �� �Է� ����
SELECT
    *
FROM emp_v_check;

--90�� �μ� �϶��� DML ����
INSERT INTO emp_v_check (employee_id, last_name, email, hire_date, job_id, department_id)
VALUES ( 444, '�˸�', 'ALI', SYSDATE, 'IT_PROG', 90);








