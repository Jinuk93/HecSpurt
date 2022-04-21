테이블 생성과 데이터 타입의 이해
; DB에서 데이터를 저장하는 가장 기본적인 구조는
  테이블(Table)이다 .
  오라클에는 테이블 이외에 뷰(View), 인덱스(Index),
  시퀀스(Sequence)등 여러 개체가 있고 이들 중에
  물리적인 공간을 갖는 개체를 세그먼트(Segment)라고
  분류하는데, 이들 중 테이블은 사용자가 직접 조회 가능한
  데이터를 저장하는 유일한 세그먼트이다.
  DB를 테이블 관점에서 보면, DB란 테이블에 저장된 
  데이터의 효율성과 무결성을 보장하기 위한 시스템으로
  이해할 수 있다.
  
  1. 테이블 생성과 삭제
     테이블은 행(Row)과 컬럼(열, Column)로 이루어진
    매우 익숙한 형태의 자료구조이다.
     테이블 형태의 자료구조는 문서의 일반적인 형태로
    DB이전부터 사용되어져 온 것으로 역사가 길다.
     정보시스템에서 문서의 형태였던 도표의 구조를 도입해서
    테이블이라 명명하고 사용한 것이다.
     초창기 파일 시스템을 기반으로 한 DB시스템에서 레코드와
    필드로 구성된 파일이 도표를 대신했지만 
    RDB(Relational DataBase)가 본격적으로 사용되면서부터
    행(Row)과 컬럼(Column)으로 구성된 테이블이 이를 대신한다.
    
    CREATE TABLE 테이블명(
      컬럼명    데이터타입 [DEFAULT 디폴트값] [컬럼 레벨 제약조건],
      컬럼명    데이터타입 [DEFAULT 디폴트값] [컬럼 레벨 제약조건],
    );
    
    1) 데이터 타입
      컬럼에 입력될 데이터의 종류와 크기를 결정한다(자료형)
    2) DEFAULT
      입력이 누락되었을 때 기본 입력값을 정의한다
      디폴트값을 지정하지 않으면 null 값이 저장된다
    3) 컬럼 레벨 제약조건
      PK, FK, UK, CHECK, NOT NULL 등을 지정한다
    4) 테이블 레벨 제약조건
      PK, FK, UK, CHECK 만 지정한다
      NOT NULL 은 정의할 수 없다.
      
    DROP TABLE 테이블명
    [CASCADE CONSTRAINT];
    1) 테이블을 삭제한다
    2) CASCADE CONSTRAINT : 테이블이 다른 테이블로부터
       참조되는 경우 해당 제약조건을 먼저 삭제한 후
       테이블을 삭제한다.
       
    SELECT table_name, column_name, 
           data_type, data_length
    FROM user_tab_columns   -- sys 계정의 소유 테이블
    WHERE table_name = 테이블명;
    1) user_tab_columns 데이터 딕셔너리(Data Dictionary)
      를 통해서 지정한 테이블의 구조를 자세히 검색한다
    2) data_type : 컬럼의 데이터 타입
    3) data_length : 컬럼의 길이
  
  2. 테이블 생성 이름 규칙
    1) 문자로 시작한다
    2) 30자 이내로 한다
    3) 영문, 숫자, _, $, # 만을 사용한다
    4) 한글은 사용가능하지만 되도록 안쓴다
      (코드 오류때문에)
    5) 테이블은 동일한 유저(스키마, 계정)안에서 유일해야 한다
    6) 예약어(명령어등)는 사용이 불가능하다
    7) 대소문자를 구별하지 않는다
       (생성할 때 사용한 문자와는 관계없이 모든 이름은 
        대문자로 저장된다)
        
  3. 데이터 타입
    1) 가장 많이 사용되는 데이터 타입
    2) 문자타입
       CHAR, VARCHAR2, LONG, CLOB
    3) 숫자타입
       NUMBER
    4) 날짜타입
       DATE
    5) 이진타입
       RAW, LONG RAW, BLOB, BFILE
    6) ROWID 타입
       ROWID
     
     VARCHAR2, NUMBER, DATE 이 3가지 자료형이
     99%이상 사용된다.
     
  4. 데이터 타입 상세
    1) VARCHAR2(n) : 가변길이 문자타입
                    (1 <= n <= 4000 byte)
    2) CHAR(n): 고정길이 문자타입
                (1 <= n <= 4000 byte)
    3) NUMBER(n, p): 숫자 타입
                    n은 전체 자리수
                    p는 소수점 이하 자리수
                    전체 자리수를 초과할 경우는 입력거부되지만,
                    소수점 이하자리수가 초과되면 반올림입력
                    소수점 이하의 값이 없는 경우는 길이를
                    지정하지 않는 것이 좋다
    4) DATE : 날짜 타입
              출력이나 입력 형식과 무관하게 
              YYYY/MM/DD:HH24:MI:SS 형태로 저장된다
              (기원전 4712년 1월 1일 ~ 서기 9999년 12월 31일)
    5) LONG : 2GB까지 저장 가능한 가변길이 문자 타입
              단 조건 검색할 수 없다.
              테이블에는 하나의 LONG 컬럼만 정의할 수 있다.
              대신 CLOB 를 사용한다
    6) CLOB : LONG 를 개선한 타입
              최대 4G까지 저장 가능하고 한 테이블의 여러 컬럼에
              정의할 수 있다.
    7) BLOB : 4G까지 저장 가능한 가변길이 이진 타입
    8) ROW(n) : 가변길이 이진타입(n < 2000)
    9) BFILE : 외부 파일저장을 위한 이진 타입.
               4G 이내 파일을 저장한다
    10) ROWID : ROWID 를 저장하기 위한 데이터 타입.
                주로 PL-SQL 프로그래밍에서 많이 사용되며
                각 문자는 64진수로 Encoding 되어있다.
                
테이블을 생성하자
테이블명 : board
컬럼 구성 : no(게시물 번호)
           name(작성자)
           sub(제목)
           content(내용)
           hdate(입력일시)


테이블 이름을 반드시 대문자로 입력한다
CREATE TABLE board(
  no NUMBER,
  name VARCHAR2(50),
  sub VARCHAR2(100),
  content VARCHAR2(4000),
  hdate DATE DEFAULT sysdate
);

DESC board;

--데이터 딕셔너리에서 테이블을 확인하고 싶으면
--반드시 대문자로 테이블 명을 써야 한다
SELECT table_name, column_name, 
       data_type, data_length
FROM user_tab_columns   -- sys 계정의 소유 테이블
WHERE table_name = 'BOARD';

INSERT INTO board(no)
 VALUES (1);
 
INSERT INTO board(no, hdate)
 VALUES (2, '2010/10/12');
 
COMMIT;

SELECT * FROM board;


DATE 타입을 이해해보자
CREATE TABLE hd(
  no NUMBER,
  hdate DATE
);

INSERT INTO hd
 VALUES(1, sysdate);
 
COMMIT;
 
SELECT * FROM hd;

연월일은 같지만 시분초가 다르므로 검색되지 않는다
SELECT *
 FROM hd
 WHERE hdate='2022/04/21';

범위 검색을 해야 한다
SELECT *
 FROM hd
 WHERE hdate BETWEEN '2022/04/21' AND '2022/04/22';

SELECT *
 FROM hd
 WHERE hdate >= '2022/04/21' AND hdate < '2022/04/22';

아래 방법은 비추천
왜냐하면 hdate를 문자열로 자동 형 변환하므로
대용량 테이블에서는 심각한 성능 저하가 일어날 수 있다.
SELECT *
 FROM hd
 WHERE hdate LIKE '22/04/21%';

1) 우리나라에서는 날짜는 DATE 보다 VARCHAR2(8)
   이렇게 정의하는 경우가 많다.
   대신 시분초를 사용할 수 없게 된다.
2) 외국에서는 
   TRUNC(sysdate) 시분초를 항상 00:00:00이 되게
   저장한다
3) sysdate 를 사용하면 범위검색을 사용해야 한다









    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
              
              
              
              
       
       
       
       
       
       
       
  
  
  
  
  
  
  
  
  
  
  
  
  
  
        
  
  
  
  
  
  
  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  