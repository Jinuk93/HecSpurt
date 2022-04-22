<제약 조건 관리>
;제약 조건 생성하는 방법
1) 테이블을 생성할 때 같이 생성하기
   1-1) 컬럼 레벨 생성
   1-2) 테이블 레벨 생성
2) 테이블의 컬럼과 자료형만 생성한 후
   나중에 ALTER 명령으로 제약조건 추가하기
   
* 모델러들은 2)번을 더 선호하는 경향이 있다

* 제약조건을 일시적으로 활성화/비활성화 할 수 있다
1) 대규모 배치 처리(대용량 데이터 입력시)
  데이터의 무결성이 확인된 경우라면
  제약조건 검사를 하지 않는 편이 속도가 훨씬 빠르다
  이럴 때 제약조건을 비활성하고 데이터 입력 후
  다시 제약조건을 활성화한다
  만일 제약조건에 위배되는 데이터가 있다면 쿼리로
  검사해서 발견할 수 있다.
2) 사이트 초기 개발시
  부모-자식 테이블의 관계가 설정되어 있으면
  테이블의 단위테스트에서 데이터 입력이 번거로울 수 
  있다. 개발자들은 초기 개발시 일시 비활성화하여 테스트
  를 진행하는 경우가 종종 있다.
  물론 나중에 다시 활성화해야 한다.
  
  <제약 조건 추가/삭제>
  ALTER TABLE 테이블명
  ADD CONSTRAINT 제약조건명 제약조건타입;
  1) NOT NULL을 제외한 제약조건을 추가한다
  2) 제약조건타입 : 제약 조건별 설정 방법과 동일
  3) NOT NULL 제약 조건은 MODIFY 명령으로 추가
  
  ALTER TABLE 테이블명
  MODIFY 컬럼 CONSTRAINT 제약조건명 NOT NULL;
  1) NOT NULL 제약 조건을 추가한다
  2) 삭제 방법은 다른 제약조건과 동일하다.
  
  ALTER TABLE 테이블명
  DROP PRIMARY KEY|UNIQUE(컬럼)|CONSTRAINT 제약조건명 [CASCADE];
  1) 제약 조건을 삭제한다
  2) CASCADE : PK나 UK가 삭제될 경우 이를 참조하는 FK도 삭제된다.

CREATE TABLE class(
  cno VARCHAR2(2),
  cname VARCHAR2(50)
);

CREATE TABLE st(
  sno VARCHAR2(2),
  sname VARCHAR2(50),
  cno VARCHAR2(2)
);

INSERT INTO class VALUES('01', '노랑새싹반');
INSERT INTO class VALUES('02', '연두잎새반');

INSERT INTO st VALUES('01', '김연아', '01');
INSERT INTO st VALUES('02', '홍길동', '02');
INSERT INTO st VALUES('03', '임꺽정', '03');

--제약 조건 추가
ALTER TABLE class
 ADD CONSTRAINT class_cno_pk PRIMARY KEY(cno);
ALTER TABLE class
 ADD CONSTRAINT class_cname_uk UNIQUE(cname);
ALTER TABLE st
 ADD CONSTRAINT st_sno_pk PRIMARY KEY(sno);


테이블에 잘못된 데이터가 입력되는 경우
제약조건 추가가 실패하게 된다.
ALTER TABLE st
 ADD CONSTRAINT st_cno_fk FOREIGN KEY(cno)
  REFERENCES class(cno);


데이터를 수정하고 다시 위의 명령을 실행하면
정상적으로 동작한다
UPDATE st SET cno='01'
 WHERE cno='03';
 
COMMIT;

ALTER TABLE st
 ADD CONSTRAINT st_cno_fk FOREIGN KEY(cno)
  REFERENCES class(cno);
  
NOT NULL 조건 추가

ALTER TABLE class
 MODIFY cname CONSTRAINT class_cname_nu NOT NULL;



제약 조건 삭제
CASCADE 를 쓰면 class_cno_pk 조건이 삭제되고
관련된 참조 조건인 st_cno_fk 조건도 삭제된다.

만약 CASCADE 를 안쓰면 class_cno_pk 도 삭제가 안된다.
왜냐하면 자식테이블이 fk조건으로 참조하고 있기 때문에

ALTER TABLE class
 DROP CONSTRAINT class_cno_pk;
 
ALTER TABLE class
 DROP CONSTRAINT class_cno_pk CASCADE;
 
ALTER TABLE class
 DROP CONSTRAINT class_cname_nu;
ALTER TABLE class
 DROP CONSTRAINT class_cname_uk;
ALTER TABLE st
 DROP CONSTRAINT st_sno_pk;


제약 조건 활성화/비활성화
ALTER TABLE 테이블명
ENABLE CONSTRAINT 제약조건명;
1) 비활성화된 제약조건을 활성화한다
2) PK나 UK 제약조건이 활성화되면 인덱스가 만들어진다

ALTER TABLE 테이블명
DISABLE CONSTRAINT 제약조건명 [CASCADE];
1) 제약조건을 비활성화한다
2) PK나 UK인 경우 인덱스가 삭제된다
3) 비활성화된 제약조건은 제약조건을 검사하지 않는다.

부모 class테이블의 pk, 자식 st테이블의 fk 설정 제약조건
ALTER TABLE class
 ADD CONSTRAINT class_cno_pk PRIMARY KEY(cno);
ALTER TABLE st
 ADD CONSTRAINT st_cno_fk FOREIGN KEY(cno)
  REFERENCES class(cno);

부모 class에 cno='03'이 없으므로 에러 발생
SELECT * FROM class;
SELECT * FROM st;

INSERT INTO st
 VALUES('10', '김다은', '03');


부모 class 먼저 cno='03'인 행을 삽입
자식 st 에 cno='03'인 행을 삽입


제약조건에 의해 부모 먼저-자식 나중이라는 순서가 생기지만
현장상황에서는 일단 자식데이터가 먼저 확보되면
자식부터 입력해야 할수도 있다
이럴 때 "제약조건의 비활성화"를 사용한다
ALTER TABLE st
 DISABLE CONSTRAINT st_cno_fk;


제약조건을 비활성화했으므로 자식 먼저 들어갈 수 있다
INSERT INTO st
 VALUES('10', '김다은', '03');

나중에 부모데이터를 넣는다
INSERT INTO class
 VALUES('03', '분홍열매반');

제약조건을 다시 활성화한다
ALTER TABLE st
 ENABLE CONSTRAINT st_cno_fk;


대용량 배치 작업(테이블 자동 생성, 데이터 삽입...)시
제약조건을 비활성화하는 이유
1) 부모테이블의 데이터보다 자식테이블의 데이터가 먼저
  확보되는 경우
2) 데이터를 삽입할 때마다 제약조건이 있으면 검사하는 시간이
  소요된다. 그래서 무결성이 인정되는 데이터라면
  검사시간을 줄이기 위해 제약조건을 비활성화하고 
  삽입후 다시 활성화한다

<대규모 배치 작업을 효율적으로 수행하는 방법>
1. 가능한 DATABASE BUFFER CACHE 의 크기를 늘려 잡는다.
  - 온라인 처리중이 아니면 SHARED POOL 의 크기를 임시로
    줄인다.
2. 다이렉트 로드를 이용해서 작업을 수행한다
  - 이때는 DATABASE BUFFER CACHE 를 이용하지 않음으로
    크기를 늘릴 필요가 없다.
3. 입력 테이블과 관련된 모든 제약조건을 비활성화한다.
  - 제약조건에 맞지 않은 데이터는 입력이 끝난 이후
   EXCEPTION 기능을 이용해서 검색할 수 있다.


















  
  
  
  
  
  