--04. SELECT 정렬

--1) 사원의 이름을 급여순으로 검색하세요
SELECT eno, ename, sal
 FROM emp;
 
SELECT eno, ename, sal
 FROM emp
 ORDER BY sal;
 
SELECT eno, ename, sal
 FROM emp
 ORDER BY sal ASC;
 
SELECT eno, ename, sal
 FROM emp
 ORDER BY sal DESC;
 
--2) 사원의 사번과 이름을 연봉순으로 검색하세요
SELECT eno, ename, sal*12+NVL(comm,0) 연봉
 FROM emp;
 
SELECT eno, ename, sal*12+NVL(comm,0) 연봉
 FROM emp
 ORDER BY 연봉 DESC;
 
 
SELECT eno, ename, sal*12+NVL(comm,0) 연봉
 FROM emp
 ORDER BY 3 DESC;
 
 