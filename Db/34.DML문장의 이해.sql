DML(Data Manipulation Language)란?
; 데이터베이스에 데이터를 입력,수정,삭제하는 명령이다
  SELECT 문과는 다르게 데이터베이스의 내용을 변경하는 
  작업을 수행함으로 SELECT 문에 비해서 훨씬 주의깊게
  계획되고 실행되어야 한다.
  이렇게 DML 작업은 이전과는 달리 안전한 작업과정과
  결과가 요구됨으로 이를 위해 오라클은 DML 작업을
  트랜잭션이라는 단위로 관리한다.
  
INSERT, UPDATE, DELETE

INSERT INTO 테이블 [(컬럼, 컬럼, ...)]
VALUES (값, 값, ...);
1) INSERT 문은 하나의 행만을 삽입한다
2) 컬럼 리스트와 VALUE 절의 값은 반드시 1:1로 대응된다
3) 테이블의 모든 컬럼에 값을 입력하는 경우 컬럼 리스트를
  생략할 수 있다
  VALUE 절에 기술하는 값의 순서는 DESC 명령으로 확인된
  테이블의 컬럼 순서와 일치해야 한다
4) 입력되는 값이 숫자가 아닌 경우 반드시 단일 인용부호를
  사용한다
5) INSERT 문장에서 생략된 컬럼은 null 값이 입력된다
6) 명시적인 null 값은 null을 기술한다
7) 값 대신 DEFAULT 를 기술하면 DEFAULT 값이 입력된다.

UPDATE 테이블
SET 컬럼=값, 컬럼=값, ...
[WHERE 조건];
1) 컬럼의 값을 수정한다
2) WHERE 절을 생략하면 모든 행의 지정된 컬럼 값이 수정된다
3) 여러 컬럼의 값을 동시에 수정할 수 있다
4) 값 대신에 DEFAULT 를 기술하면 테이블에 정의된 
   DEFAULT 값으로 변경된다
   
DELETE FROM 테이블
[WHERE 조건];
1) 행단위로 데이터를 삭제한다
2) 조건이 없는 경우 테이블의 모든 행을 삭제한다
3) 테이블을 삭제해도 테이블의 물리적인 구조는
   변하지 않는다(공간을 차지하고 있다)
   

TCL(Transaction Control Language)
; COMMIT, ROLLBACK
COMMIT;
1) (트랜잭션)작업을 완료한다
2) 모든 DML 문장을 수행한 후 작업을 완료할 때
  반드시 필요하다
  
ROLLBACK;
1) 작업을 취소한다
2) 모든 DML 문장을 수행한 후 작업을 취소할 때
  반드시 필요하다.
   
   
1) dept 테이블의 모든 데이터를 삭제한 다음 ROLLBACK 과
COMMIT 을 수행한 다음 결과를 확인한다

SELECT * FROM dept;

DELETE FROM dept;

SELECT * FROM dept;

ROLLBACK;

SELECT * FROM dept;

DELETE FROM dept;

SELECT * FROM dept;

COMMIT;

ROLLBACK;

SELECT * FROM dept;

   

2) emp와 dept테이블의 모든 데이터를 삭제한다

SELECT * FROM emp;

SELECT * FROM dept;

DELETE FROM emp;

SELECT * FROM emp;

COMMIT;

SELECT * FROM dept;
DELETE FROM dept;

ROLLBACK;

SELECT * FROM emp;
SELECT * FROM dept;





3) emp 테이블에 아래 데이터 입력하세요
--1901 권준연 요리      2020-02-01 5000 2000 10
--1902 박서준 개발        2020-01-12 6000 3000 20
--1903 연우   가수        2020-02-12  2000 100 30
--1904 제니 백수          2020-02-10 9999 9999 40

INSERT INTO emp(eno, ename, job, hdate, sal, comm, dno)
 VALUES('1901', '권준연', '요리', '2020-02-01', 5000, 2000, '10');
INSERT INTO emp(eno, ename, job, hdate, sal, comm, dno)
 VALUES('1902', '박서준', '개발', '2020-01-12', 6000, 3000, '20');
INSERT INTO emp(eno, ename, job, hdate, sal, comm, dno)
 VALUES('1903', '연우', '가수', '2020-02-12', 2000, 100, '30');
INSERT INTO emp(eno, ename, job, hdate, sal, comm, dno)
 VALUES('1904', '제니', '백수', '2020-02-10', 9999, 9999, '40');
 
SELECT * FROM emp;

ROLLBACK;

SELECT * FROM emp;

COMMIT;

SELECT * FROM emp;

데이터를 넣을 때 자료형을 일치시켜야 한다 - 정형 데이터
9999 -> '구천' : 이렇게 넣으면 오류가 발생한다

INSERT INTO emp(eno, ename, job, hdate, sal, comm, dno)
 VALUES('1905', '수지', '백수', '2020-02-10', '구천', 9999, '50');

4) 
emp 
사번 : 1910
이름 : 장나라
입사일 : 2020-01-02:07:15:29


5) 세션 날짜 형식과 안맞으므로 입력 오류가 발생한다
INSERT INTO emp(eno, ename, hdate)
 VALUES('1910', '장나라', '2020-01-02:07:15:29');
 
ALTER SESSION SET nls_date_format='YYYY/MM/DD:HH24:MI:SS';

ROLLBACK;

ALTER SESSION SET nls_date_format='YY/MM/DD';

INSERT INTO emp(eno, ename, hdate)
 VALUES('1910', '장나라', 
      TO_DATE('2020-01-02:07:15:29', 'YYYY/MM/DD:HH24:MI:SS'));
      
COMMIT;

SELECT * FROM emp;

 a) TO_DATE 함수를 사용하면 입력가능하다


emp 
사번 : 1911
이름 : 김나라
입사일 : 2020-01-02:07:15:29



6) TO_DATE를 이용하면 원하는 날짜와 시간을
--세션 포맷과 일치하지 않아도 저장할 수 있다.
--TO_CHAR를 이용하면 현재 세션 포맷과 다른 시간 포맷을
--출력할 수 있다.

SELECT * FROM emp;

SELECT eno, ename, TO_CHAR(hdate, 'YYYY-MM-DD:HH24:MI:SS')
 FROM emp;


7) 날짜에 적용되는 디폴트 값을 확인한다
ALTER SESSION SET nls_date_format='YYYY-MM-DD:HH24:MI:SS';

INSERT INTO emp(eno, hdate)
 VALUES('1', TO_DATE('2000', 'YYYY'));
INSERT INTO emp(eno, hdate)
 VALUES('2', TO_DATE('99', 'YY'));
INSERT INTO emp(eno, hdate)
 VALUES('3', TO_DATE('99', 'RR'));
INSERT INTO emp(eno, hdate)
 VALUES('4', sysdate);
 
COMMIT;

SELECT * FROM emp;

8) 이승철의 부서번호를 10번으로 수정하고 급여를 10% 인상하자
--1) 이승철 행을 DELETE 후 INSERT
--2) 이승철 행을 UPDATE
SELECT dno, ename 
 FROM emp
 WHERE ename='이승철';
 
UPDATE emp SET
 dno='10', sal=sal*1.1
 WHERE ename='이승철';
 
COMMIT;

SELECT dno, sal, ename 
 FROM emp
 WHERE ename='이승철';











  
  
  
  
  