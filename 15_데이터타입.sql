--������
--������ char �� varchar2 ��
CREATE TABLE comp(
    char_col  CHAR(4),
    VARCHAR_col NVARCHAR2(4)
    );
INSERT INTO comp VALUES('AA', 'AA');    
INSERT INTO comp VALUES('AAA', 'AAA');
INSERT INTO comp VALUES('AAAA', 'AAAA');
commit;

SELECT * FROM comp;

SELECT * FROM comp
where char_col = varchar_col;
-- char�� �������� ������ Ÿ��, varchar2�� �������� ������ Ÿ��

-- ������ ������ Ÿ�� number
-- number(p,s) : p�� ��ȿ�ڸ��� 1~38, 5�� �Ҽ��� ��ȿ�ڸ���

--DATE Ÿ��
SELECT hire_date, to_char(hire_date, 'YYYY-MM-DD') "��¥=>���ں�ȯ"
FROM employees;

SELECT
    *
FROM employees
where hire_date <'2002-03-03';
--����Ŭ�� �ڵ����� ������ ���ڸ� ���� ������ ��¥���� �°� ����ȯ�Ͽ� ��













