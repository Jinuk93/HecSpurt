--1. SELECT 문의 이해

SELECT * FROM EMP;
select * from emp;
select * from EMP;
SELECT * FROM emp;  -- 이렇게 작성

--테이블의 구조 확인
DESC emp;
DESC dept;

SELECT * FROM emp;
SELECT eno, ename, job FROM emp;
SELECT eno, ename, sal FROM emp;

--dual은 실테이블이 아니고 형식을 맞추기 위한 더미테이블
SELECT 2+3 FROM dual;



