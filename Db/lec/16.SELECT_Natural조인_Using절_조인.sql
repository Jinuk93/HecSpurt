--[Join 을 표현하는 여러가지 방법]
--
--Natural Join - 자연 조인
--; 컬럼 이름과 자료형이 일치하는 것을 찾아서 자동으로 Join 해준다

--1) 자연 조인으로 각 사원의 근무 부서를 검색하세요
SELECT eno 사번, ename 이름, dno 부서번호, dname 부서명
 FROM emp
 NATURAL JOIN dept;
 
--2) 광주에서 근무하는 직원의 명단을 검색하세요
--  (부서번호와 부서명도 검색하세요)
SELECT loc 근무처, dno, dname, eno, ename 
 FROM dept
 NATURAL JOIN emp
 WHERE loc='광주';
 
SELECT loc 근무처, dno, dname, eno, ename 
 FROM emp
 NATURAL JOIN dept
 WHERE loc='광주';
 
--[Using 절을 이용한 Join]
--; NATURAL JOIN 은 공통 컬럼이 1개만 존재할 때 사용할 수 있다.
--  둘 이상인 경우는 사용할 수 없다.
--  이 때 등가조인이나 Using 절을 이용한 Join 을 사용해야 한다.
 
--3) Using 절 조인으로 각 사원의 근무 부서를 검색하세요
SELECT eno 사번, ename 이름, dno 부서번호, dname 부서명
 FROM emp
 JOIN dept USING(dno);
 
--4) 부산에서 근무하는 직원의 명단을 검색하세요
--   (부서번호와 부서명도 검색하세요)
SELECT loc, dno, dname, eno, ename
 FROM dept
 JOIN emp USING(dno)
 WHERE loc='부산';
 
--5) 화학과 1학년 학생들의 유기화학 점수를 검색한다
--화학과 1학년 학생 : student
--유기화학 : course
--점수 : score

SELECT s.sno, sname, cname, result
 FROM student s, score r, course c
 WHERE s.sno=r.sno AND r.cno=c.cno
 AND major='화학'
 AND syear=1
 AND cname='유기화학';
 
SELECT sno, sname, cname, result
 FROM student
 NATURAL JOIN score
 NATURAL JOIN course
 WHERE major='화학'
 AND syear=1
 AND cname='유기화학';
 
SELECT sno, sname, cname, result
 FROM student
 JOIN score USING(sno)
 JOIN course USING(cno)
 WHERE major='화학'
 AND syear=1
 AND cname='유기화학';
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 