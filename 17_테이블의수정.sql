--제약조건의 추가 및 수정
create table class (
    cno VARCHAR2(2),
    cname VARCHAR2(50)
);
--테이블의 새 행을 입력
INSERT INTO class values ( '01', '데이터베이스');    
INSERT INTO class values ( '02', '자바');
SELECT
    *
FROM class;

--학생 테이블 생성
CREATE TABLE student (
    sno VARCHAR2(4),
    sname varchar2(50),
    cno VARCHAR(2)
);
--학생 테이블에 새 행을 입력
DELETE FROM student;
INSERT INTO student values ( '0414', '홍길동', '01');
INSERT INTO student values ( '0415', '임꺽정', '02');
INSERT INTO student values ( '0416', '이순신', '03');
commit;
SELECT
    *
FROM student;
--클래스 테이블에 기본키 추가
DELETE FROM class;
ALTER TABLE class
ADD CONSTRAINT class_cno_pk PRIMARY KEY(cno);
--기본키는 널값이나 중복될 수 없음
INSERT INTO class values ( '01', '데이터베이스');   

--클래스 테이블에 유니크 키를 추가
ALTER TABLE class
add CONSTRAINT class_cname_pk UNIQUE (cname);
--유니크는 중복안됨
INSERT into class VALUES ('03', '데이터베이스');

--제약조건을 조회하는 명령문
SELECT
    *
FROM all_constraints -- 모든 제약조건
where table_name ='CLASS'; --조회시 대문자

SELECT
    *
FROM all_constraints -- 모든 제약조건
where table_name ='DEPARTMENTS';

--학생테이블에 기본키를 추가
ALTER TABLE student
ADD CONSTRAINT student_sno_pk primary key (sno);
--학생테이블의 sname에 not null 추가
ALTER table student
MODIFY sname CONSTRAINT student_sname_nn NOT NULL;
--학생 테이블에 외래키 추가
ALTER table student
ADD CONSTRAINT student_cno_fk FOREIGN key(cno) --외래키 추가
        REFERENCES class(cno); -- 클래스열에 cno열을 참조
SELECT
    *
FROM class;

SELECT
    *
FROM student;
--제약조건을 추가할때 이미 만들어진 테이블에 각 행의 데이터가 만족해야
--제약조건이 추가된다.
UPDATE student SET cno = '01'
where sno ='0416';

--제약조건의 삭제
--제약조건의 이름으로 삭제
-- cascade 옵션시 참조하는 외래키도 삭제
ALTER TABLE class
DROP CONSTRAINT class_cno_pk cascade;
--제약조건으로 삭제
ALTER TABLE class
DROP UNIQUE(cname); -- 클래스 테이블의 cname열의 유니크 제약조건 삭제

ALTER TABLE student
DROP PRIMARY KEY; -- 기본키의 삭제

--테이블의 삭제
DROP TABLE class;
DROP TABLE student;

--테이블 컬럼(열)의 추가와 삭제

--90번 부서의 직원들을 새테이블 E_EMP에 입력
CREATE TABLE E_EMP
AS
SELECT employee_id, last_name, salary, department_id
  FROM employees
where department_id = 90;

--열의 이름을 지정해서 E_EMP2 테이블 생성
CREATE TABLE E_EMP2(emp_id, name, sal, dept_id)
AS
SELECT employee_id, last_name, salary, department_id
  FROM employees
where department_id = 90;
SELECT
    *
FROM e_emp2;

--열의 추가
SELECT
    *
FROM e_emp;

ALTER TABLE e_emp
ADD (GENDER VARCHAR2(1));
--디폴트 값을 0으로 하는 열 추가
ALTER TABLE E_EMP
ADD (커미션 NUMBER DEFAULT 0 not null);
--두개의 열의 추가
ALTER TABLE E_EMP
ADD (날짜 DATE DEFAULT SYSDATE, 제작자 VARCHAR2(100) DEFAULT user);

--열의 수정
SELECT
    *
FROM E_EMP;

--데이터 사이즈 수정
ALTER TABLE E_EMP
MODIFY (제작자 VARCHAR2(200));-- 원래(100) => (200) 변경됨
desc e_emp;

ALTER TABLE E_EMP
MODIFY (제작자 VARCHAR2(50));-- 원래(200) => (50) 변경됨
desc e_emp;

ALTER TABLE E_EMP
MODIFY (제작자 VARCHAR2(1));-- 원래(50) => (1) 변경됨 error

ALTER TABLE E_EMP
MODIFY (제작자 number); --이미 문자형 데이터가 있기때문에 숫자형으로 바꿀 수 없음

SELECT
    *
FROM e_emp;

--NULL값인 경우에 입력된 값이 없기 떄문에 데이터 형식을 바꿀 수 있음.
ALTER TABLE E_EMP
MODIFY (GENDER number);
--제작자의 데이터 형식을 바꾸려 하면
update E_EMP
set 제작자 = null;

--열의 삭제
ALTER TABLE e_emp
drop COLUMN 제작자; -- 제작자 열 삭제
-- 여러개의 열 삭제
ALTER TABLE e_emp
drop (gender, 커미션, 날짜); -- 여러개 열의 삭제

SELECT * FROM e_emp;

-- 열의 이름 수정
ALTER  TABLE e_emp
RENAME COLUMN department_id TO 부서번호;
ALTER  TABLE e_emp
RENAME COLUMN salary TO 급여;
ALTER  TABLE e_emp
RENAME COLUMN last_name TO 이름;
ALTER  TABLE e_emp
RENAME COLUMN employee_id TO 직원번호;
--테이블의 이름 변경
RENAME E_EMP to 직원테이블;
SELECT * FROM 직원테이블;

--예제
CREATE TABLE stman(id, job, sal)
AS
SELECT employee_id, job_id, salary
  FROM employees
where job_id = 'ST_MAN';
SELECT
    *
FROM stman;
    















