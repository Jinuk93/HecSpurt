--[ON 절]
--; 가독성이 우수하다(조인 조건을 명시적으로 표현)
--등가 조인과 비등가 조인을 모두 표현할 수 있다

--1) 각 사원의 근무부서를 검색하세요
--등가조인
SELECT eno, ename, dept.dno, dname
 FROM emp
 JOIN dept ON emp.dno=dept.dno;

--2) 개발 업무를 담당하는 사원의 급여 등급을 검색하세요 
--비등가조인
SELECT eno, ename, job, grade
 FROM emp
 JOIN salgrade ON sal BETWEEN losal AND hisal
 WHERE job='개발';

--ON 에는 WHERE절과 동일하게 일반 조건도 쓸 수 있지만
--아래처럼 하는 것은 비추천.

SELECT eno, ename, job, grade
 FROM emp
 JOIN salgrade ON sal BETWEEN losal AND hisal
 AND job='개발';

--3) 직원의 부서명과 급여등급을 검색하세요
--원칙을 정하는 것이 좋다
(1) WHERE 절 등가조인 : 조인조건과 일반조건이 같이 기술
(2) NATURAL JOIN : 자동으로 해주지만 명시성 부족, 2개 이상 같을 때 사용 불가
(3) Using 절 : 명시적 표현, 조인조건과 일반조건의 분리, 등가조인
(4) On 절 : 명시적 표현, 조인조건과 일반조건의 분리, 등가조인/비등가조인








