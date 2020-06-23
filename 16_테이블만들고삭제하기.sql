--테이블 만들기
CREATE TABLE ex_date( --테이블 이름
    ex_id   number(2), --열의 이름, 데이터 타입
    start_date  date  default sysdate
    --디폴트는 입력안될시 디폴트 뒤의 값으로
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

--테이블 삭제하기 DROP TABLE
DROP TABLE comp;
DROP TABLE copy_emp;

--예제
CREATE TABLE sample_product(
            product_id  number,
            product_name    VARCHAR2(20),
            menu_date   date);
desc sample_product;
            
drop TABLE sample_product;
            
-- 테이블의 제약조건(CONSTRAINT)
--제약조건 옆쪽에 쓸때
CREATE TABLE emp(
    eno NUMBER(3) CONSTRAINT emp_eno_pk PRIMARY key,
    emp_name VARCHAR2(20)
    );
desc emp;
INSERT into emp
VALUES (1, '김');
INSERT into emp
VALUES (2, '박');
SELECT
    *
FROM emp;
drop table emp;
--제약조건을 아래쪽에 쓸때
CREATE TABLE emp(
    eno NUMBER(3), 
    emp_name VARCHAR2(20),
    CONSTRAINT emp_eno_pk PRIMARY key(eno)
    );
desc emp;    
--제약조건의 이름없이
CREATE TABLE emp1(
    eno NUMBER(3) PRIMARY key, 
    emp_name VARCHAR2(20)   
    );
desc emp1;
INSERT into emp1
VALUES(1, '박');
drop table emp1;

--not null/uk 유니크
CREATE TABLE emp1 (
    eno NUMBER(3),
    emp_name VARCHAR2(20) CONSTRAINT emp1_ename_nn NOT NULL,
    email VARCHAR2(30) CONSTRAINT emp1_email_uk UNIQUE
);    
-- not null은 null값을 입력할 수 없다.
INSERT into emp1
values ( 1, null, 'hong@naver.com');
desc  emp1;
--uk 유니크는 동일한 값이 일력될 수 없다.
INSERT into emp1
values ( 1, '홍길동', 'hong@naver.com');
INSERT into emp1
values ( 2, 김유신l, 'hong@naver.com');
-check 제약조건
CREATE TABLE emp2 (
    eno number(3),
    emp_name VARCHAR2(20) CONSTRAINT emp2_ename_nn NOT NULL,
    sal number(10), CONSTRAINT emp2_sal_check CHECK(sal > 1000)
);
INSERT INTO emp2
Values (1, '홍길동', 1999);
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

INSERT into emp values (1, '김','12345678', 'man');
INSERT into emp values (2, '강','123456789', 'woman');
INSERT into emp values (3, '양','123456789', 'human');
rollback;

--예제
create table members(
    members_id number(2) primary key,
    first_name VARCHAR2(50) not null,
    last_name VARCHAR2(50) not null,
    gender VARCHAR2(5) check(gender in('man','woman')),
    birth_day date default sysdate,
    email varchar2(200) unique not null
    );
desc members;

--외래키 (fk)
create table dept(
    dno NUMBER(4),
    dname VARCHAR2(20),
    constraint dept_dno_pk primary key(dno)--기본키
   );
DROP TABLE emp;
create table emp(
    eno number(4),
    emp_name VARCHAR2(20),
    sal number(10),
    dno number(4),
    constraint emp_eno_pk primary key(eno), --기본키
    constraint emp_dno_fk foreign key(dno) 
    --references dept(dno) on delete cascade--참조열 삭제시 자동삭제
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
--외래키는 참조열의 값 이외에는 입력불가
INSERT INTO emp VALUES (1060, 'KANG',300,60);
--단, 널값은 입력가능
INSERT INTO emp VALUES (1060, 'KANG',300,null);

--삭제시 에러 발생 (외래키 제약조건 에 걸림)
DELETE FROM dept
where dno = 30;
-- 1 참조행 삭제시 자동 삭제
-- on delete cascade
-- 2 참조행 삭제시 자동 널값 입력
-- on delete set null





            
            
            