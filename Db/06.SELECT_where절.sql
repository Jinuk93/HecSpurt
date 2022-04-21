--[WHERE 절을 이용한 조건 검색]

--1) 사원 중에 급여가 4000 이상인 사원의 명단
SELECT sal, eno, ename
 FROM emp
 WHERE sal >= 4000;
 
--2) 이름이 '김연아'인 사원의 정보
SELECT *
 FROM emp
 WHERE ename='김연아';
 
--3) 10번 부서를 제외한 사원의 명단

--숫자인데 문자열로 저장된 경우
--정수로 비교하면 자동으로 형변환이 이루어져 비교가 
--잘 이루어진다.
--그러나, 기업환경에서는 대용량 테이블(수천만건이상)이 
--존재하므로 이렇게 문자열과 정수를 비교하면
--1개 행마다 형변환이 일어나므로 속도가 매우 저하된다.
--그러므로, 반드시 문자열일 경우 문자열과
--정수일 경우 정수와 비교를 해야 속도 저하를 막을 수 있다.

SELECT dno, eno, ename 
 FROM emp
 WHERE dno != 10;
 
SELECT dno, eno, ename 
 FROM emp
 WHERE dno != '10';
 
--4) 연봉이 30000 이상인 사원의 이름을 검색하세요
SELECT sal*12+NVL(comm,0) 연봉, eno, ename
 FROM emp
 WHERE sal*12+NVL(comm,0) >= 30000;
 
--5) 보너스가 200 이하인 사원을 검색하세요
SELECT comm 보너스, eno, ename
 FROM emp
 WHERE comm <= 200;
 
SELECT comm 보너스, eno, ename
 FROM emp
 WHERE NVL(comm,0) <= 200;
 
--6) 입사일이 1996년 이후인 사원의 정보를 검색하세요
'1995/12/31' => '1995/12/31:00:00:00' 

SELECT *
 FROM emp
 WHERE hdate > '1995/12/31';
 
ALTER SESSION SET nls_date_format='YYYY/MM/DD';

SELECT *
 FROM emp
 WHERE hdate > '1995/12/31';
 
--7) 보너스 컬럼이 null 값인 사원을 검색하세요
IS NULL
IS NOT NULL

SELECT *
 FROM emp
 WHERE comm IS NULL;
 
SELECT *
 FROM emp
 WHERE comm IS NOT NULL;
 
 
 
 
 
 
 
 
 
 