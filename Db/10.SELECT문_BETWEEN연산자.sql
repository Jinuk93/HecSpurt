[BETWEEN 연산자]

--1) 급여가 1000에서 2000 이하인 사원
SELECT *
 FROM emp
 WHERE sal >= 1000
 AND sal <= 2000;
 
SELECT *
 FROM emp
 WHERE sal BETWEEN 1000 AND 2000;
 
 
--2) 급여가 2000에서 1000사이 사원
SELECT *
 FROM emp
 WHERE sal BETWEEN 2000 AND 1000;
 
--3) 1992년에서 1996년 사이에 입사한 사원을 검색하세요
'1992/01/01' => '1992/01/01:00:00:00'
 '1996/12/31' => '1996/12/31:00:00:00'
 
 SELECT *
  FROM emp
  WHERE hdate BETWEEN '1992/01/01' AND '1996/12/31'
  ORDER BY hdate;
  
ALTER SESSION SET nls_date_format='YYYY/MM/DD:HH24:MI:SS';
 
 SELECT *
  FROM emp
  WHERE hdate BETWEEN '1992/01/01:00:00:00' 
  AND '1996/12/31:23:59:59'
  ORDER BY hdate;
  
--[IN 연산자]
--4) 10, 20번 부서 사원
SELECT *
 FROM emp
 WHERE dno='10' OR dno='20';
 
SELECT *
 FROM emp
 WHERE dno BETWEEN '10' AND '20';
 
SELECT *
 FROM emp
 WHERE dno IN('10', '20');
 
--5) 개발이나 회계 업무를 담당하는 사원
SELECT *
 FROM emp
 WHERE job IN('개발', '회계')
 ORDER BY job;
 
 
 
 
 
 
 
 