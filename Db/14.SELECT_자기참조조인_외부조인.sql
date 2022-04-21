--[Self Join - 자기참조조인]
--;emp 테이블이 2개 있다고 본다
--emp e1 => 사원테이블
--emp e2 => 관리자테이블
--ex) 김연아 사원의 관리자 - mgr 0301 - 이승철

--1) 각 사원을 관리하는 관리자의 이름을 검색하세요
--e1(사원테이블)의 관리자와 일치하는 e2(관리자테이블)의 사번
--WHERE e1.mgr = e2.eno

SELECT e1.eno 사번, e1.ename 사원명, e1.mgr 관리자사번,
      e2.eno 관리자사번, e2.ename 관리자명
 FROM emp e1, emp e2
 WHERE e1.mgr=e2.eno;
 

--[Outer Join - 외부 조인]
--2) 각 부서별로 사원을 검색한다
--일반조인
SELECT d.dno, dname, eno, ename
 FROM dept d, emp e
 WHERE d.dno=e.dno
 ORDER BY 1;
 
SELECT * FROM dept;

SELECT * FROM emp;

SELECT d.dno, dname, eno, ename
 FROM dept d, emp e
 WHERE d.dno=e.dno(+)
 ORDER BY 1;
 
SELECT e1.eno 사번, e1.ename 사원명, e1.mgr 관리자사번,
      e2.eno 관리자사번, e2.ename 관리자명
 FROM emp e1, emp e2
 WHERE e1.mgr=e2.eno(+);
 
 
 