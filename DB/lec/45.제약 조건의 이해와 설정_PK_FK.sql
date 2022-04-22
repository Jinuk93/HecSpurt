<제약 조건의 이해와 설정 1> (PK, FK)
; 제약 조건이란 테이블 단위에서 데이터의 무결성을 보장해주는
 규칙이다. 제약 조건은 테이블에 데이터가 입력, 수정, 삭제시
 또는 테이블이 삭제, 변경될 경우 잘못된 트랜잭션이 수행되지
 않도록 결함을 유발할 가능성이 있는 작업을 방지하는 역할을
 수행한다.
 특히 PK와 FK는 테이블의 필수 요소로써 모든 테이블은 이들
 둘 중 하나 이상을 반드시 포함하고 있다.
 
 <제약 조건>
 1) 테이블 단위에서 정의되고 적용된다.
 2) 종속성이 존재하는 경우 테이블의 삭제를 막아준다.
    (자식 테이블이 있는 부모 테이블은 삭제 불가.
    자식 테이블부터 삭제하고 부모 테이블을 삭제해야 함)
 3) 자료가 삽입,갱신,삭제될 때마다 규칙이 적용된다.
 4) 일시적으로 활성화하거나 비활성화하는 것이 가능하다.
 5) USER_CONSTAINTS, USER_CONS_COLUMNS 딕셔너리에서
   검색한다
 6) 제약조건은 개체처럼 관리되므로 반드시 이름이 필요하다.
    제약조건에 이름을 정의하지 않으면 오라클 서버가
    자동으로 SYS_Cn형태의 이름을 붙인다.
    관리자가 규칙성 있는 이름을 붙여주는 것이 훨씬 좋다.
    
<오라클에서 제공되는 제약조건>
PRIMARY KEY(PK) : 테이블에 반드시 지정해야 한다
FOREIGN KEY(FK) : 자식 테이블은 반드시 지정해야 한다
UNIQUE KEY(UK) : 유니크한 컬럼의 검색속도 향상
NOT NULL       : PK는 무조건 NOT NULL, 타 컬럼 옵션
CHECK          : 기타 조건
    
1. PK 설정
컬럼에 PK를 지정하는 방법은 아래처럼 2가지 방법이 있다.
CREATE TABLE 테이블명(
...
CONSTRAINT 제약조건이름 PRIMARY KEY(컬럼));

CREATE TABLE 테이블명(
컬럼 데이터타입 CONSTRAINT 제약조건이름 PRIMARY KEY,
...);

1) 테이블을 생성할 때 PK를 정의한다
2) PK는 각 행을 고유하게 식별하는 역할을 담당한다
3) 테이블당 하나or 한개 그룹(복합키)만 정의 가능하다
4) 지정된 컬럼에는 중복된 값이나 NULL 값이 입력불가하다
5) PK로 지정 가능한 컬럼이 여러 개 있을 때는 검색에
  많이 사용되고 간단하고 짧은 컬럼을 지정한다
  (ex 사원 : 사번, 주민번호 중에 사번을 선택)
6) 주 식별자, 주키 등으로 불린다
7) 고유 인덱스(Unique Index)가 자동으로 생성된다.
    
2. FK 설정
CREATE TABLE 테이블명(
...
CONSTRAINT 제약조건이름 FOREIGN KEY(컬럼)
REFERENCES 부모테이블 (참조컬럼) [ON DELETE CASCADE]);

CREATE TABLE 테이블명(
컬럼명 데이터타입 CONSTRAINT 제약조건이름 FOREIGN KEY
                REFERENCES 부모테이블 (참조컬럼)
                [ON DELETE CASCADE],
...);
 1) 부모 테이블을 참조하여 테이블을 생성할 때 FK를 정의한다
 2) FK가 정의된 테이블이 자식(하위) 테이블이다
 3) 참조되는 테이블을 부모(상위) 테이블이라고 한다
 4) 부모 테이블은 미리 생성되어 있어야 한다
 5) 부모 테이블의 참조되는 컬럼에 존재하는 값만을 입력할 
    수 있다.
 6) 부모 테이블에 참조되는 행의 데이터는 FK를 위배하는
    삭제나 변경이 불가능하다.
 7) ON DELETE CASCADE : 참조되는 부모 테이블의 행에 대한
    DELETE 를 허용한다.
    (부모 테이블의 행을 삭제하면 참조하는 자식테이블의 행도
    함께 지워진다)
 8) 자료형이 반드시 부모테이블의 컬럼과 일치해야 한다
 9) 참조되는 컬럼은 PK이거나 UK(Unique Key)만 가능하다
 10) 외부키, 참조키, 외부식별자 등으로 불린다.
   11) REFERENCES 'S'를 꼭 붙일 것
 
 * 제약조건을 정의하는 방법은 2가지 방법이 제공된다.
   1) 테이블 생성 명령어 마지막에 기술하는 방법
      : 테이블 레벨 정의
   2) 컬럼을 정의할 때 같이 정의하는 방법
      : 컬럼 레벨 정의
   둘 중에 테이블 레벨 정의가 가독성이 높다.
      
기존 스크립트(*.sql)에는 의미적으로만 dno로 연결되었을 뿐
제약조건이 없기 때문에 dept의 행을 지워도 에러가 안생겼음

1) PK와 FK가 추가된 dept와 emp 테이블을 생성한다.  
DROP TABLE emp;
DROP TABLE dept;
PURGE RECYCLEBIN; -- Windows의 휴지통 비우기 기능과 동일
  
부모 테이블인 dept 테이블부터 생성해야 한다      
CREATE TABLE dept(
  dno VARCHAR2(2) CONSTRAINT dept_dno_pk PRIMARY KEY,
  dname VARCHAR2(14),
  loc VARCHAR2(8),
  director VARCHAR2(4)
);

DROP TABLE dept;

CREATE TABLE dept(
  dno VARCHAR2(2),
  dname VARCHAR2(14),
  loc VARCHAR2(8),
  director VARCHAR2(4),
  CONSTRAINT dept_dno_pk PRIMARY KEY(dno)
);

CREATE TABLE emp(
  eno VARCHAR2(4),
  ename VARCHAR2(10),
  job VARCHAR2(6),
  mgr VARCHAR2(4),
  hdate DATE,
  sal NUMBER,
  comm NUMBER,
  dno VARCHAR2(2),
  CONSTRAINT emp_eno_pk PRIMARY KEY(eno),
  CONSTRAINT emp_dno_fk FOREIGN KEY(dno)
    REFERENCES dept(dno)
);

 PK로 정의된 dept의 dno, emp의 eno 컬럼은 
중복된 값 X, NULL X
 FK로 정의된 emp의 dno는 dept의 dno를 참조하도록 
설정했으므로, emp에 데이터를 입력할 때 fk가 존재하지 않는
데이터를 입력하면 에러가 발생한다.

dept와 emp에 데이터를 입력하고 제약조건 설정을 테스트
INSERT INTO dept(dno, dname, loc)
 VALUES('10', '개발', '서울');
 
INSERT INTO emp(eno, ename, dno)
 VALUES('2000', '김연아', '10');

PK에 이미 '10'번 부서가 있으므로 중복데이터 입력 방지
PK에 대한 무결성을 '개체 무결성'이라 한다
INSERT INTO dept(dno, dname, loc)
 VALUES('10', '총무', '부산');

FK값이 부모테이블에 존재하지 않으므로 입력 방지
FK에 대한 무결성을 '참조 무결성'이라 한다
INSERT INTO emp(eno, ename, dno)
 VALUES('2001', '아이유', '20');


데이터 모델링해서 물리 데이터베이스 테이블 생성방법 2가지
1) ER-Win 툴에서 설정을 잘 선택, 제약조건이름 부여...
   자동 생성(툴을 잘 사용해야 함)
2) 모델링(ERD) -> 테이블 상세표 -> 스크립트(*.sql) 생성 -> 실행
  현재 이 방법을 더 추천






      
      
      
      
    
    
 
 
 
 
 
 
 
 
 
 
 
 