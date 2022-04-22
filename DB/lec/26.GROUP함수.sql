그룹 함수
; 검색된 여러 행을 이용하여 통계정보를 계산하는 함수

MAX  값들 중에 최대값을 반환
MIN  값들 중에 최소값을 반환
AVG  평균값을 계산
COUNT 반환된 행의 수를 계산
SUM  총합을 계산
STDDEV 표준편차를 계산
VARIANCE 분산을 계산

1) null 값은 무시된다 - null 의 의미는 '알 수 없다', '정해지지 않았다'
2) 반드시 1개의 값만을 반환한다
3) GROUP BY 없이 일반 컬럼과 기술될 수 없다

1) 사원의 평균 급여를 검색한다
SELECT sal
 FROM emp;

SELECT AVG(sal), ROUND(AVG(sal)) 
 FROM emp;
 
2) 사원들에게 지급된 보너스 총합과 보너스 평균을 검색한다
SELECT SUM(comm) "보너스 총합",
       ROUND(AVG(comm)) "보너스 평균",
       COUNT(comm)  "수령 인원",
       ROUND(AVG(NVL(comm,0)))  "환산 평균",
       COUNT(*)     "전체 인원"
 FROM emp;

3) 보너스에서 null 이 아닌 사람 수를 계산하세요
SELECT COUNT(*)-COUNT(comm)
 FROM emp;
 
SELECT COUNT(*)
 FROM emp
 WHERE comm IS NULL;
 
SELECT COUNT(*)
 FROM emp
 WHERE comm IS NOT NULL;


그룹 함수와 GROUP BY 절

SELECT 컬럼 OR 그룹 함수...
FROM 테이블
WHERE 조건
GROUP BY 그룹대상
ORDER BY 정렬대상;

1) 그룹함수와 함께 사용되는 일반 컬럼은 
  반드시 GROUP BY 절에 기술되어야 한다
2) GROUP BY 절에 기술되지 않으면
   ORA-00937 에러가 발생한다

3) 업무별 평균 급여, 평균 연봉을 검색한다
--ORA-00937 : 카디널리티가 일치하지 않는다
--AVG 함수는 1개의 결과값
--job 은 행개수만큼 결과값
SELECT job 업무, ROUND(AVG(sal)) 평균급여,
       ROUND(AVG(sal*12+NVL(comm,0))) 평균연봉
 FROM emp;
 
결과 행의 개수가 14개이다
SELECT job 업무
 FROM emp;

결과 행의 개수가 1개이다(그룹함수)
SELECT ROUND(AVG(sal)) 평균급여,
       ROUND(AVG(sal*12+NVL(comm,0))) 평균연봉
 FROM emp;

* 그룹 함수와 함께 사용되는 일반 컬럼은
반드시 GROUP BY 에 기술되어야 한다

SELECT job 업무, ROUND(AVG(sal)) 평균급여,
       ROUND(AVG(sal*12+NVL(comm,0))) 평균연봉
 FROM emp
 GROUP BY job;

5) 부서별 평균 급여, 평균 연봉을 검색한다
SELECT dno, ROUND(AVG(sal)),
       ROUND(AVG(sal*12+NVL(comm,0)))
 FROM emp
 GROUP BY dno;
 
SELECT dno, dname, ROUND(AVG(sal)),
       ROUND(AVG(sal*12+NVL(comm,0)))
 FROM emp
 JOIN dept USING(dno)
 GROUP BY dno, dname;


--TO_CHAR(AVG(result), '99.99') "기말 평균"






