--SYSTEM 계정으로 처리하는 부분 START
DROP USER bitjava CASCADE;

CREATE USER bitjava IDENTIFIED BY bitjava DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp PROFILE DEFAULT;

GRANT CONNECT, RESOURCE TO bitjava;
GRANT CREATE VIEW, CREATE SYNONYM TO bitjava;

ALTER USER bitjava ACCOUNT UNLOCK;

conn bitjava/bitjava;
--SYSTEM 계정으로 처리하는 부분 END

--client 테이블을 삭제하라
DROP TABLE client;

--client 테이블을 생성하라
CREATE TABLE client(
  cnum NUMBER,
  cname VARCHAR2(50),
  addr VARCHAR2(200),
  tel VARCHAR2(20)
);

--server 테이블을 삭제하라
DROP TABLE server;

--server 테이블을 생성하라
CREATE TABLE server(
  cnum NUMBER,
  cname VARCHAR2(50),
  addr VARCHAR2(200),
  tel VARCHAR2(20)
);
