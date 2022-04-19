단일 행 함수 - 문자함수
; 프로그래머는 복잡한 SQL 문의 이해나
  오라클이 제공하는 함수를 몰라도 사용에는 문제가 없다
  But, SQL 문을 잘 이해해야 되는 이유가 있다
  1) 데이터를 프로그램에서 가공처리하는 것보다
     DBMS에서 처리해서 결과만 받아오는 것이
     성능상 훨씬 낫다
  2) 아키텍처 면에서 프로그램은 받아온 결과를
     보여주는데 주력하고, DBMS는 데이터를 저장/처리
     에 집중하면 둘 간에 적정한 역할의 분리가 이루어
     지므로 유연성이 증대된다
     (프로그램과 DBMS가 느슨한 연결이 되어서
     변경/유지보수에 좋다)

문자함수
LOWER 문자열을 소문자로 변환한다
UPPER 문자열을 대문자로 변환한다
INITCAP 첫문자만 대문자로 나머지는 소문자로
--
1)ERP 부서가 있는 지역을 검색한다


문자연산함수
SUBSTR 문자열내에 지정된 위치의 문자열을 반환(문자열, 위치, 개수)
        SUBSTR('oracle', 1, 2) => or
LENGTH 문자열의 길이를 반환
        LENGTH('oragle') => 6
INSTR 지정된 문자의 위치를 리턴
      INSTR('oracle', 'a') => 3
TRIM 접두어나 접미어를 잘라낸다
     TRIM('o' FROM 'oracle') => racle
LPAD, RPAD 지정된 문자열의 길이만큼 빈부분에
           문자를 채운다
           LPAD('20000', 10, '*')
           => *****20000
CONCAT('김', '연아') => 김연아

2)부서 명과 위치를 하나의 컬럼으로 검색한다
--CONCAT는 문자열을 연결해주는 함수지만
--잘 사용하지 않는다
--왜냐하면 || 을 더 많이 사용한다


3) 부서명과 길이를 출력하라


4) SUBSTR함수를 이용해서 컬럼에 일부 내용만을 검색한다


5) 사원 이름에 'a'가 나타나는 위치를 출력한다




6) TRIM 함수를 이용 다양한 방법으로 문자열을 검색한다


TRIM은 주로 공백 문자를 제거하는데 거의 사용된다
입력 시 '홍길동' 이렇게 입력하지 않고
' 홍길동', '홍길동 ' 입력되는 경우가 있다
이때 ename='홍길동';
TRIM(ename)='홍길동' 을 하면 앞뒤의 공백문자를 제거해준다

7) 이름과 급여를 각각 10컬럼으로 검색한다


8) 부서명의 마지막 글자를 제외하고 검색한다


--문자치환함수
--TRANSLATE : 문자단위 치환된 값을 리턴한다
--            TRANSLATE('oracle', 'o', '#')
--            => #racle
--REPLACE : 문자열단위 치환된 값을 리턴한다
--            REPLACE('oracle', 'or', '##')
--            => ##acle

-- REPLACE를 더 많이 쓴다
9)









