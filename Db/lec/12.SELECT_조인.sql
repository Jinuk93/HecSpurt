--[JOIN]
--; 관계형 데이터 베이스 시스템
--테이블-테이블이 연관 관계를 맺고 있다
--ex)emp-dno : 사원이 어느 부서에 소속되어 있는지
--   dept-dno : 부서번호
--   김연아 02 - 02 회계 서울

--1) 각 사원의 근무 부서를 검색한다
SELECT dno 부서번호, eno, ename
 FROM emp;
 
-- 등가 조인
--; 같은 값끼리 연결하여 정보를 보여준다
SELECT eno 사번, ename 이름, emp.dno 부서번호,
       dept.dno 부서번호, dname 부서명
 FROM emp, dept
 WHERE emp.dno=dept.dno;
 
--2) 광주에서 근무하는 직원의 명단을 검색해라
--  (부서번호와 부서명도 검색해라)
SELECT loc, dept.dno, dname, eno, ename
 FROM emp, dept
 WHERE emp.dno=dept.dno
 AND loc='광주';
 
SELECT loc, d.dno, dname, eno, ename
 FROM emp e, dept d
 WHERE e.dno=d.dno
 AND loc='광주';
 
--[비등가조인]
--3) 각 직원의 급여를 10% 인상한 경우 급여 등급을 검색한다
SELECT eno, ename, sal*1.1 "10% 인상급여", grade 등급
 FROM emp, salgrade
 WHERE sal*1.1 BETWEEN losal AND hisal;
 
--4) 잘못된 조인(Cross Join)
SELECT e.dno, ename, d.dno, dname
 FROM emp e, dept d;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 