<서브 쿼리를 이용한 테이블 생성과 컬럼 수정>
; 테이블을 생성하는 작업은 요구 분석 -> 모델링 작업을 거치는
 아주 섬세하고 복잡한 과정을 통해 이루어진다.
  테이블 생성의 기본 이론은 데이터는 변하지만 데이터의 구조는
 안정적이어야 한다는 기본적인 토대 위에서 만들어진다.
  그러므로 테이블의 생성은 모델링시 초기에 모두 만들어지고
 이후 서비스 운영중에는 테이블을 만들지 않는 것을 원칙으로 한다
  만일 운영중에 테이블이 생성되거나 특히 운영중에 테이블의
 구조가 변경된다는 것은 사실상 요구분석과 모델링에 문제가
 있었다는 의미로 판단한다.
  
  하지만 현실 세계의 요구사항은 끊임없이 변경되고 있다.
  그러므로 모든 것을 원칙대로만 하기는 어려운 요소가 있다.
  그래서 드물지만 서비스 운영중에 테이블을 만들거나 테이블의
 구조를 수정하는 것 또한 필요한 부분이라고 할 수 있다.
 
<컬럼 수정>
ALTER TABLE 테이블명
[ADD|MODIFY] 컬럼 데이터타입;
1) 추가된 컬럼에는 NULL 값이 저장된다.
2) CHAR 와 VARCHAR2 는 컬럼의 크기를 변경하지 않으면
  서로 수정 교환이 가능하다
3) 컬럼의 크기는 늘리는 것만 가능하다
4) 대상 컬럼에 데이터가 없을 때만 크기를 줄이거나 타입을
  수정하는 것이 가능하다.

ALTER TABLE 테이블명
DROP COLUMN 컬럼;
1) 불필요한 컬럼을 삭제한다
2) SYS 유저가 소유한 테이블의 컬럼은 DROP 할 수 없다.

--테이블 생성
CREATE TABLE test(
  no Number
);

테이블 컬럼 추가
ALTER TABLE test
 ADD name CHAR(10);

테이블 컬럼 수정
ALTER TABLE test
 MODIFY name VARCHAR2(10);

테이블 컬럼 삭제
ALTER TABLE test
 DROP COLUMN name;

<서브 쿼리를 이용한 테이블 생성>
CREATE TABLE 테이블명 (컬럼, ...)
AS (SELECT 문 : sub query 문);
1) 서브 퀴리문의 결과를 테이블로 생성한다
2) 데이터 타입과 길이는 서브 쿼리문에 의해 결정된다
3) 컬럼의 리스트와 서브 쿼리의 컬럼은 반드시 1:1
  대응된다.
4) 컬럼명이 없으면 서브 쿼리의 검색 결과 출력되는
  헤더를 컬럼명으로 사용한다.
5) 서브 쿼리에 계산식이나 함수를 사용하는 경우 반드시
  'CREATE TABLE 문'에 컬럼명을 정의하거나 별명을
  사용한다.
  
개발업무를 담당하는 사원의 근무 부서관련 정보를
검색할 수 있는 테이블을 생성한다.
DROP TABLE e_dept;

CREATE TABLE e_dept
AS (SELECT eno, ename, job, dno, dname, loc
     FROM emp
     JOIN dept USING(dno)
     WHERE job='개발'
    );

DESC e_dept;

SELECT * FROM e_dept;

    
부서별 평균 연봉을 검색할 수 있는 테이블을 생성하라
CREATE TABLE d_sal
AS (SELECT dno, dname, ROUND(AVG(sal*12+NVL(comm,0))) av_sal
     FROM emp
     JOIN dept USING(dno)
     GROUP BY dno, dname
    );
    
DESC d_sal;
SELECT * FROM d_sal;
    
부서별로 검색된 사원의 연봉 정보를 이용하여 테이블을 생성
CREATE TABLE e_sal(dno, eno, ename, an_sal)
AS (SELECT dno, eno, ename, sal*12+NVL(comm,0)
     FROM emp
     ORDER BY dno
    );

    
RDB에서는 테이블은 컬럼의 순서나 행의 순서와는 무관하다는
원칙을 세우고 있다.
이것은 데이터를 순서화 시켜서 테이블에 저장하는 것은
RDB의 원칙에 위배됨으로 이를 지원하지 않는다.
그래서 위의 서브쿼리에서는 ORDER BY 를 지원하지 않는다.

하지만 테이블에 물리적으로 관련있는 데이터가 연속되어
저장된다면 매우 유용한 것이 사실이다.
정렬되어 저장된 데이터는 검색 작업을 수행할 때 물리적인
I/O 양을 줄일 수 있고, 나중에 정렬할 필요가 없어서 성능을
매우 많이 향상시켜준다.

이럴 때는 아래처럼 2단계로 나눠서 작업을 한다.
1) 먼저 빈 테이블을 생성한다
DROP TABLE e_sal;

CREATE TABLE e_sal(dno, eno, ename, an_sal)
AS (SELECT dno, eno, ename, sal*12+NVL(comm,0)
     FROM emp
     WHERE 1=2
    );

2) 빈 테이블에 정렬된 결과를 입력한다
 (대용량 데이터 입력시 '다이렉트 로드'를 이용하면
 속도가 훨씬 빨라진다)
INSERT INTO e_sal
  SELECT dno, eno, ename, sal*12+NVL(comm,0)
  FROM emp
  ORDER BY dno;
  
SELECT * FROM e_sal;


  






    
    
    















  
  
  
  
  
  
 
 
 
 
 
 
  
  
  
  
  
  
  
 
 
 
 
 
 
 
 
 