<제약 조건의 이해와 설정2>
; NOT NULL, UK, CHECK

1) PK, FK를 제외한 나머지 제약조건
2) 이들은 모든 테이블에 반드시 필요한 것은 아니다.
   하지만 이를 통해 미리 프로세스상의 오류를 예방할 수 있다
   
<Unique Key 설정>
CREATE TABLE 테이블명(
  ...
  CONSTRAINT 제약조건명 UNIQUE (컬럼)
);

CREATE TABLE 테이블명(
  컬럼 데이터타입 CONSTRAINT 제약조건명 UNIQUE,
...);
 1) UK(Unique Key)를 정의한다
 2) 중복된 값을 허용하지 않지만 여러개의 NULL 은 허용한다
    - NULL 값은 비교가 불가능하므로 여러 개라도 중복이
     아니다.
 3) 고유키라고도 불린다
 4) 고유 인덱스(Unique Index)가 자동으로 생성된다.
 5) 사원 테이블의 사번, 주민번호 중에 
   사번은 PK, 주민번호는 UK 설정을 한다.
    
<NOT NULL 설정>
CREATE TABLE 테이블명(
  컬럼 데이터타입 CONSTRAINT 제약조건명 NOT NULL,
  ...
);
1) 컬럼 레벨 정의만 가능하다
2) 지정된 컬럼은 NULL 값을 허용하지 않는다
3) 반드시 NULL 값이 필요한 컬럼을 제외하고
  가능한 모든 컬럼에 NULL 값을 허용하지 않는 것이 좋다.
    
<CHECK 설정>
CREATE TABLE 테이블명(
  ...
  CONSTRAINT 제약조건명 CHECK(조건)
);

CREATE TABLE 테이블명(
  컬럼 데이터타입 CONSTRAINT 제약조건명 CHECK (조건),
  ...
);
 1) 행에 입력될 데이터의 조건을 정의한다
 2) 조건은 WHERE 절에 기술하는 조건형식과 동일하다.
 3) 어플리케이션에서 데이터의 조건을 체크하는 대신
    테이블에서 조건을 체크하도록 하는 것이다.
    (어플리케이션 코드양을 줄일 수 있다)
    
emp4 테이블을 생성한다
DROP TABLE emp4;

CREATE TABLE emp4(
  eno VARCHAR2(4),
  ename VARCHAR2(50) CONSTRAINT emp4_ename_nu NOT NULL,
  gno VARCHAR2(13),
  sex VARCHAR2(3),
  CONSTRAINT emp4_eno_pk PRIMARY KEY(eno),
  CONSTRAINT emp4_gno_uk UNIQUE(gno),
  CONSTRAINT emp4_gno_ch CHECK(LENGTH(gno)=13),
  CONSTRAINT emp4_sex_ch CHECK(sex IN('여', '남'))
);

정상 조건을 만족할 때 잘 입력됨
INSERT INTO emp4(eno, ename, gno, sex)
 VALUES('1001', '김연아', '7711262233845', '여');

NOT NULL 컬럼에 NULL 을 입력한 경우
INSERT INTO emp4(eno, ename, gno, sex)
 VALUES('1002', NULL, '7711262233847', '여');

INSERT INTO emp4(eno, gno, sex)
 VALUES('1003', '7711262233848', '여');

gno(주민번호) 중복시
INSERT INTO emp4(eno, ename, gno, sex)
 VALUES('1004', '수지', '7711262233845', '여');
 
gno(주민번호) 글자가 12글자일때
INSERT INTO emp4(eno, ename, gno, sex)
 VALUES('1005', '장나라', '771126223384', '여');

'여'/'남' 대신 'M'을 넣을 때
INSERT INTO emp4(eno, ename, gno, sex)
 VALUES('1006', '홍길동', '7711261233841', 'M');



    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    









