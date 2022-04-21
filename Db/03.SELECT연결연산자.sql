--03. SELECT 문 연결연산자

--1) 사원의 이름을 급여 또는 업무와 함께 검색하세요
SELECT eno||ename||sal
 FROM emp;
 
SELECT eno||ename||job
 FROM emp; 
 
SELECT eno||' '||ename||' '||job
 FROM emp; 
 
SELECT eno||' '||ename||' '||job 사원업무정보
 FROM emp;
 
--2) 연결 연산자 사용시 주의할 것
SELECT eno||' '||ename||' '||sal*12+NVL(comm,0) 연봉정보
 FROM emp;
 
SELECT eno||' '||ename||' '||(sal*12+NVL(comm,0)) 연봉정보
 FROM emp;
 
--3) 중복 제거
--  직원들의 업무는 어떤 것이 있는지 검색한다(업무의 종류는 어떤것인지)
SELECT job 업무
 FROM emp;
 
SELECT DISTINCT job 업무
 FROM emp;
 
 