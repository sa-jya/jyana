--시퀀스
--시퀀스 생성
CREATE SEQUENCE 시퀀스1;
drop SEQUENCE 시퀀스1;
drop SEQUENCE 시퀀스2;
SELECT
    *
FROM user_sequences
where sequence_name ='시퀀스1';

--시퀀스 테스트 듀얼 테이블에서
SELECT 시퀀스1.NEXTVAL FROM dual; --시퀀스 사용. nextval
SELECT 시퀀스1.currVAL FROM dual; --시퀀스의 현재값 증가X

--시퀀스 테스트용 테이블 생성
CREATE TABLE 부서_테스트 (
    부서번호 NUMBER primary key,
    부서이름 VARCHAR2(100)
    );
INSERT INTO 부서_테스트 (부서번호, 부서이름)
VALUES (시퀀스1.nextval, '영업부');
INSERT INTO 부서_테스트 (부서번호, 부서이름)
VALUES (시퀀스1.nextval, '개발부');
INSERT INTO 부서_테스트 (부서번호, 부서이름)
VALUES (시퀀스1.nextval, '회계');
commit;
SELECT
    *
FROM 부서_테스트;

--시퀀스 옵션 사용
--시퀀스2 생성 시작값을 10, 증가값을 20
CREATE SEQUENCE 시퀀스2
start with 10 -- 10부터시작
INCREMENT by 20; --증가갑이 20

DELETE FROM 부서_테스트;

INSERT INTO 부서_테스트 (부서번호, 부서이름)
VALUES (시퀀스2.nextval, '영업부');
INSERT INTO 부서_테스트 (부서번호, 부서이름)
VALUES (시퀀스2.nextval, '개발부');
INSERT INTO 부서_테스트 (부서번호, 부서이름)
VALUES (시퀀스2.nextval, '회계부');
INSERT INTO 부서_테스트 (부서번호, 부서이름)
VALUES (시퀀스2.nextval, '마케팅부');
INSERT INTO 부서_테스트 (부서번호, 부서이름)
VALUES (시퀀스2.nextval, '교육부');
commit;
SELECT
    *
FROM 부서_테스트;

--시퀀스1를 부서번호를 업데이트
UPDATE 부서_테스트
set 부서번호 =시퀀스1.nextval;
--테이블 삭제
DROP TABLE 부서_테스트;
DROP SEQUENCE 시퀀스1;
DROP SEQUENCE 시퀀스2;
DROP TABLE dept CASCADE CONSTRAINTS;--제약조건도 함께 삭제
DROP TABLE emp;
DROP TABLE emp1;
DROP TABLE emp2;
DROP TABLE e_emp2;
DROP TABLE ex_date;
DROP TABLE 직원테이블;
DROP TABLE stman;
DROP TABLE members;




