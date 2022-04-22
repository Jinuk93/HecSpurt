--[관계 연산자 : AND, OR]

--1) 20번 부서원 중에 급여가 2000이상인 사원을 검색하세요
SELECT *
 FROM emp
 WHERE dno='20'
 AND sal >= 2000;
 
--2) 30번 부서원 중에 급여가 2000이상이고 개발 업무를 담당하는
--  사원을 검색하세요
SELECT *
 FROM emp
 WHERE dno='30'
 AND sal >= 2000
 AND job='개발';
 
--3) 관계 연산자 우선순위
NOT > AND > OR

SELECT * 
 FROM emp
 WHERE dno='10' OR sal > 1600 AND comm > 600;
 
SELECT * 
 FROM emp
 WHERE (dno='10' OR sal > 1600) AND comm > 600;

--[LIKE 연산자]
--; a. 문자열 검색시 사용
--  b. '_' : 반드시 한개의 문자를 대체
--     '%' : 문자열을 대체(문자가 없는 경우도 포함)
--  c.
--    LIKE '경%' => '경'으로 시작하는 모든 문자열
--                경, 경제, 경영학과
--    LIKE '%과' => '과'로 끝나는 모든 문자열
--                과, 다과, 화학과, 물리학과
--    LIKE '%김%' => '김'이란 글자가 들어간 문자열
--                김, 김씨, 돌김, 되새김질
--    LIKE '화_' => '화'로 시작하는 두 글자 단어
--                화학, 화약, 화장
--    LIKE '__화' => '화'로 끝나는 세글자 단어
--                무궁화, 해당화, 운동화, 들국화
--    LIKE '_동_' => '동'이 가운데 들어간 세글자 단어
--                원동기, 전동차

--4) 김씨 성을 가진 사원을 검색하세요
SELECT *
 FROM emp
 WHERE ename LIKE '김%';
 
--5) 이름이 '하늘'인 사원
SELECT *
 FROM emp
 WHERE ename LIKE '%하늘';
 
--6) 성과 이름이 각각 한 글자인 사원을 검색하세요
SELECT *
 FROM emp
 WHERE ename LIKE '__';









