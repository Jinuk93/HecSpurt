-- [WHERE 절을 이용한 조건 검색]

--1) 사원 중에 급여가 4000 이상인 사원의 명단
SELECT sal, eno, ename
FROM emp
WHERE sal >= 4000;