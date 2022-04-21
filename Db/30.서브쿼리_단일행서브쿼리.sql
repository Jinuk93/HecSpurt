서브 쿼리 - 단일 행 서브쿼리
; 서브 쿼리는 두 개의 쿼리를 결합하여 하나의 문장으로
표현하는 것이다
1) 단일 행 서브쿼리
 ; 서브쿼리가 하나의 컬럼에서 하나의 행을 검색한다
2) 다중 행 서브쿼리
 ; 서브쿼리가 하나의 컬럼에서 여러 개의 행을 검색한다
3) 다중 열 서브쿼리
 ; 서브쿼리가 여러 개의 컬럼을 검색한다

4) 서브 쿼리는 WHERE 절, HAVING 절과 같이 조건절에 주로
 쓰인다. FROM 절에 쓰이는 경우도 있다.
 FROM 절에 서브쿼리를 쓰는 경우를 인라인뷰(Inline View)
 라고 한다

SELECT 컬럼, ...
FROM 테이블
WHERE 컬럼 <단일 행 연산자> (SELECT 문: Sub Query);
1) 단일 행 연산자가 사용됨으로 반드시 서브쿼리의 결과
 값은 1개만 검색돼야 한다
2) 서브 쿼리는 반드시 괄호로 묶는다
3) 서브 쿼리는 메인 쿼리 실행 전에 실행된다
4) 서브 쿼리의 검색된 결과값은 메인 쿼리에 사용된다
5) 단일 행 연산자 오른쪽에 기술한다
   (=, <, >, <=, >=, !=)
6) WHERE 절에 기술된 열의 숫자와 타입은
  SELECT 절과 1:1 대응관계가 되어야 한다.

1)김연아보다 급여를 많이 받는 사원을 검색한다
--1) 김연아의 급여를 검색한다
SELECT sal
 FROM emp
 WHERE ename='김연아';
--2) 김연아의 급여와 비교하여 더 많이 받는 사원을 검색한다
SELECT eno, ename, sal
 FROM emp
 WHERE sal > 3300;
 
SELECT eno, ename, sal
 FROM emp
 WHERE sal > (SELECT sal
               FROM emp
               WHERE ename='김연아');

             
2)노육과 평점이 동일한 학생의 정보를 검색하라
--노육이 3명이라서 단일 행 연산자를 사용할 수가 없다
--그래서 Error 가 발생했다
SELECT avr
 FROM student
 WHERE sname='노육';
 
SELECT sno, sname, avr
 FROM student
 WHERE avr=(SELECT avr
             FROM student
             WHERE sname='노육');


다중 행 서브 쿼리 (결과값이 여러 개의 행이다)
SELECT sno, sname, avr
 FROM student
 WHERE avr IN (1.99, 3.21, 4);

SELECT sno, sname, avr
 FROM student
 WHERE avr IN (SELECT avr
               FROM student
               WHERE sname='노육')
 AND sname != '노육';
             
예측하기 힘든 단일 행 서브쿼리를 수정하는 방법
1) '=' 연산자는 'IN'연산자로 바꾼다 - 다중행 서브쿼리로 전환
2) 부등호(<, >, <=, >=)는 any, all - 다중행 서브쿼리로 전환 
  연산자를 추가한다
3) Max, Min 그룹 함수를 사용한다 - 여러 개중에 1개만 선택



3) 김연아와 부서가 다르고 동일한 업무를 하는 사원의 정보를 검색하라
 a) 김연아의 부서를 검색한다 - Sub Query
 SELECT dno
  FROM emp
  WHERE ename='김연아';
 b) 김연아와 동일한 업무를 한다 - Sub Query
 SELECT job
  FROM emp
  WHERE ename='김연아';
 c) 부서는 다르고 업무는 동일한 사원의 정보를 검색한다 - Main Query
 SELECT *
  FROM emp
  WHERE dno !='2'
  AND job='회계'
  AND ename != '김연아';
  
 SELECT *
  FROM emp
  WHERE dno !=(SELECT dno
                FROM emp
                WHERE ename='김연아')
  AND job=(SELECT job
            FROM emp
            WHERE ename='김연아')
  AND ename != '김연아';
 


         
4) 부서 중 가장 급여를 많이 받는 부서를 검색하라
--1) 부서중 평균 최대급여 계산
SELECT dno, AVG(sal)
 FROM emp
 GROUP BY dno;
 
SELECT MAX(AVG(sal))
 FROM emp
 GROUP BY dno;
--2) 일치하는 부서를 출력
SELECT dno, AVG(sal)
 FROM emp
 GROUP BY dno
 HAVING AVG(sal)=4984.75;
 
SELECT dno, AVG(sal)
 FROM emp
 GROUP BY dno
 HAVING AVG(sal)=(SELECT MAX(AVG(sal))
                   FROM emp
                   GROUP BY dno);

5) 부산에서 근무하는 사원의 정보를 검색한다
  a) 부산에 근무하는 부서번호
  SELECT dno
   FROM dept
   WHERE loc='부산';
  b) 해당 부서번호와 일치하는 사원의 정보 검색
  SELECT *
   FROM emp
   WHERE dno='20';
   
  SELECT *
   FROM emp
   WHERE dno=(SELECT dno
               FROM dept
               WHERE loc='부산');
               
  SELECT *
   FROM emp
   JOIN dept USING(dno)
   WHERE loc='부산';
  

         








