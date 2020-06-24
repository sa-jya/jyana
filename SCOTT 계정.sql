SELECT * FROM emp where empno = 7369;
--명함 테이블
DROP TABLE NAMECARD;
CREATE TABLE NAMECARD (
    NO NUMBER CONSTRAINT pk_namecard primary key,
    name varchar2(20) NOT NULL,
    MOBILE varchar2(20) NOT NULL,
    EMAIL varchar2(40),
    COMPANY varchar2(60)
);
--시퀀스 생성
DROP SEQUENCE CARD_NO;
CREATE SEQUENCE CARD_NO;

INSERT INTO namecard values(
    card_NO.NEXTVAL,
    'LALA',
    '010-1234-5678',
    'LALA@naver.com',
    'Naver.com'
);
SELECT
    *
FROM namecard;

SELECT * FROM namecard order by no;
COMMIT;
UPDATE namecard SET company = ? where no = ?;

