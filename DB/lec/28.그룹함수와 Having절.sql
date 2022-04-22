그룹 함수와 Having 절
; 그룹 함수를 포함한 조건은 일반 조건과 계산하는 시점이 다르다.
일반 조건의 경우 컬럼의 값을 단지 조건과 비교하면 되지만
그룹 함수의 결과를 조건으로 하는 경우 GROUP BY 절의 
사용 유무에 따라 결과 값이 달라지므로 조건에 그룹 함수가 
포함된 경우 이것은 일반 조건과 동일한 시점에 처리할 수 없다
SQL 은 이를 위해 HAVING 절을 제공한다.

HAVING 절은 조건 중에 그룹 함수가 포함된 것만을 모아서
기술하는 구문이다.

SELECT 컬럼 or 그룹함수...
FROM 테이블
WHERE 일반 조건
GROUP BY 그룹대상(일반컬럼)
HAVING 그룹함수포함조건
ORDER BY 정렬 대상;
1) HAVING : 조건 중에 그룹함수를 포함하는 조건 기술
2) HAVING 절은 GROUP BY 절 뒤에 기술한다
3) HAVING 절의 해석은 WHERE 절과 동일하다
   다만 그룹 함수를 포함하는 조건은 
   HAVING 절에 해야만 한다


1) 부서별로 평균급여가 3000이상인 부서만 출력하세요
SELECT dno, ROUND(AVG(sal)) 평균급여
 FROM emp
 GROUP BY dno;

그룹함수 조건은 WHERE 절에 사용할 수 없다
SELECT dno, ROUND(AVG(sal)) 평균급여
 FROM emp
 WHERE ROUND(AVG(sal)) >= 3000
 GROUP BY dno;
 
SELECT dno, ROUND(AVG(sal)) 평균급여
 FROM emp
 GROUP BY dno
 HAVING ROUND(AVG(sal)) >= 3000;




2) 20번 부서가 아니면서 평균급여가 3000이상인 부서만 출력하세요
SELECT dno, ROUND(AVG(sal)) 평균급여
 FROM emp
 WHERE dno != '20'
 GROUP BY dno
 HAVING ROUND(AVG(sal)) >= 3000;


1)GROUP BY 절에 따른 그룹 함수 결과 값의 변화



2) 부서별 급여 평균이 3천 달러 미만인 부서의 부서번호와
평균 급여를 검색한다
SELECT dno, ROUND(AVG(sal))
 FROM emp
 GROUP BY dno
 HAVING ROUND(AVG(sal)) < 3000;


3) 개발 업무가 아닌 부서별 인원수를 검색하세요
SELECT dno, job, COUNT(*) 인원수
 FROM emp
 WHERE job != '개발'
 GROUP BY dno, job;
 
SELECT dno, COUNT(*) 인원수
 FROM emp
 GROUP BY dno;
 



4) 그룹함수의 조건인 아닌 것은 WHERE 절에 기술한다


5) HAVING 절은 그룹함수의 조건이나
GROUP BY 에 기술한 컬럼의 조건이 가능하다
그러나 HAVING 절은 그룹함수의 조건만 사용하고
GROUP BY 에 있는 컬럼이라도 WHERE 절에 사용하는 것을
권장한다.























