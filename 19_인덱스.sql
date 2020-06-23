--인덱스 확인
SELECT table_name 테이블명,
       INDEX_NAME 인덱스이름,
       column_name 컬럼이름
from all_IND_COLUMNS
where TABLE_NAME ='DEPARTMENTS';
drop table members;
--실습으로 테이블 만들기
CREATE TABLE members(
    member_id NUMBER,
    first_name VARCHAR2(100) not null,
    last_name VARCHAR2(100) not null,
    gender char(1) not null,
    dob date not null,
    email varchar2(255) not null,
    primary key(member_id));
desc members;    

SELECT table_name 테이블명,
       INDEX_NAME 인덱스이름,
       column_name 컬럼이름
from all_IND_COLUMNS
where TABLE_NAME ='MEMBERS';

SELECT
    *
FROM members
where last_name = 'Harse'; -- 테이블 전체 검색

EXPLAIN PLAN FOR -- 다음 나오는 select 문을 실행하여 보고서 작성
SELECT * FROM members
where last_name = 'Harse';

SELECT PLAN_TABLE_OUTPUT --설명문을 출력
FROM TABLE(DBMS_XPLAN.DISPLAY());

--인덱스 만들기
CREATE INDEX members_last_name_i
ON members(last_name);

--인덱스 삭제하기
DROP INDEX members_last_name_i;

SELECT
    *
FROM members
where first_name LIKE 'M%' and last_name like 'A%';

--성능평가
EXPLAIN PLAN FOR -- 다음 나오는 select 문을 실행하여 보고서 작성
SELECT * FROM members
where first_name LIKE 'M%' and last_name like 'A%';

SELECT PLAN_TABLE_OUTPUT --설명문을 출력
FROM TABLE(DBMS_XPLAN.DISPLAY());

--멀티 인덱스 만들기
CREATE INDEX name_i
on members (first_name, last_name);
--인덱스 삭제하기
DROP INDEX name_i;






    