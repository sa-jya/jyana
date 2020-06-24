CREATE TABLE t1(
    id NUMBER primary key
);
INSERT INTO t1 values(1);   
INSERT INTO t1 values(2);    

SELECT
    *
FROM t1; 
DROP TABLE t2;
CREATE TABLE t2(
    id NUMBER primary key
);