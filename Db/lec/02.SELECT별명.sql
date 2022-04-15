--2. SELECT문에 별명 사용하기

--1) 각 사원의 이름과 담당업무를 검색해서 결과를 보고한다
SELECT eno, ename, job
 FROM emp;
 
SELECT eno AS 사번, ename AS 이름, job AS 담당업무
 FROM emp;
 
SELECT eno 사번, ename 이름, job 담당업무
 FROM emp; 
 
SELECT eno 사번, ename 이름, job "담당 업무"
 FROM emp;
 
--2) 각 사원의 급여와 1년간 수급하는 급여를 검색하세요
--  (보너스 제외)
DESC emp;
SELECT *
 FROM emp;
 
SELECT eno 사번, ename 사원이름, sal 월급,
      sal*12 "1년 수급 급여"
 FROM emp;
 
--3) 사원의 연봉을 검색하세요
--   (연봉 = 월급*12+보너스)

--null 은 0이 아니다.
--null은 '정해지지 않았다' / '모른다'
--그래서 연산이 불가능하다.
--그래서 null 값이 포함된 연산은 
--결과적으로 null 이 된다.

SELECT eno 사번, ename 사원명, sal*12+comm 연봉
 FROM emp;
 
-- 선택
-- 1) NULL -> 0 치환
-- 2) 아예 NULL 이 있는 항목을 계산에서 제외
 
--null 을 0으로 치환해서 계산하도록 한다

SELECT eno 사번, ename 사원명, sal*12+NVL(comm, 0) 연봉
 FROM emp;
 
 
 
 
 