

단일 행 함수 - 변환 함수

날짜 출력 형식
년 : YYYY : 네자리로 표현된 년도(1999, 2020, 2011)
     YY   : 두자리로 표현된 년도(99, 20)
            앞에 두자리는 현재 년도를 사용한다
            99년은 2099년을 의미한다
     RR   : 두자리로 표현된 년도(99, 20)
            앞에 두자리는 현재 년도와 가까운 년도를 
            사용한다
            99년은 1999년, 20년은 2020년
월  MM    : 두자리 숫자로 표현된 월 (03, 04)
   MONTH : 영문이나 한글로 표현된 월(MARCH, APRIL, 3월)
   MON   : 약자로 표현된 영문 및 한글 월(MAR, APR, 3월)
           한글인 경우는 MONTH 와 동일하다
일  DD   : 두자리 숫자로 표현된 일자(01, 02)
   DAY   : 영문이나 한글요일(SUNDAY, MONDAY, 일요일)
   DY   : 약자로 표현된 요일(SUN, MON, 일, 월)
시  HH24 : 1시에서 24시까지 표현
    HH   : 1시에서 12시까지 표현
            정확한 표현을 위해 AM/PM을 추가하는 것이 좋다
분  MI   : 두자리 분 표시
초  SS   : 두자리 초 표시
   SSSS : 하루를 초로 환산한 다음 표현(0-86399)
오전/오후 AM/PM : 오전 오후 표기

숫자 출력 형식
9   숫자의 출력 폭지정(자리수가 부족하면 생략)
0   선행 0표기(자리수를 반드시 맞춘다)
$   화폐 표기(달러)
L   지역 화폐 표기(각 국가 코드에 따라 다르다)
,   쉼표 위치 지정
.   마침표 위치 지정
MI  음수의 -기호를 오른쪽에 표기
EEEE 실수 표현법을 이용

변환 함수
TO_CHAR : 날짜나 숫자를 문자로 변환한다
          출력 데이터 형식을 지정한다(출력 포맷)
          TO_CHAR(날짜, 출력형식)
          TO_CHAR(숫자, 출력형식)
TO_DATE : 데이터를 날짜형으로 해석한다
          TO_DATE(문자, 해석형식)
TO_NUMBER : 데이터를 숫자로 해석한다
            대부분의 경우 오라클의 자동 형변환에 의해
            숫자로 읽을 수 있는 문자는 자동 변환됨으로
            잘 사용하지 않는다
            SQL 보다 PL-SQL에서 가끔 사용한다


1) 현재 날짜를 다양한 형식으로 출력해보자
SELECT sysdate,
       TO_CHAR(sysdate, 'YYYY/MM/DD') 날짜,
       TO_CHAR(sysdate, 'YYYY/MM/DD:HH24:MI:SS') 날짜,
       TO_CHAR(sysdate, 'YY/MM/DD:HH:MI:SS AM') 날짜
 FROM dual;
 
SELECT TO_CHAR(sysdate, 'DD Month YYYY') 날짜
 FROM dual;
 
SELECT TO_CHAR(sysdate, 'DAY Mon YY') 날짜
 FROM dual;
 
SELECT TO_CHAR(sysdate, 'DY Mon YY') 날짜
 FROM dual;
 
SELECT TO_CHAR(sysdate, '"오늘은 "YYYY"년 "MM"월 "DD"일 입니다."') 날짜
 FROM dual;


2) 20번 부서 사원의 입사일을 다음의 형식으로 검색한다
'XXX 사원의 입사일은 XXXX년 XX월 XX일입니다.'
SELECT ename||' 사원의 입사일은 '||
       TO_CHAR(hdate, 'YYYY"년 "MM"월 "DD"일 입니다."') 입사일
 FROM emp
 WHERE dno='20';


3) 다양한 형식으로 숫자를 출력해 보자
SELECT TO_CHAR(12345.678, '999,999.99999') 숫자
 FROM dual;

SELECT TO_CHAR(12345.678, '099,999.999') 숫자
 FROM dual;
 
SELECT TO_CHAR(12345.678, '9,9999.9') 숫자
 FROM dual;
 
SELECT TO_CHAR(12345.678, '9,999.9') 숫자
 FROM dual;   -- 소수점 앞자리가 부족하면 출력장애가 발생한다.
 
SELECT TO_CHAR(1234, '$999,999') 숫자
 FROM dual;
 
SELECT TO_CHAR(1234, 'L999,999') 숫자
 FROM dual;
 
SELECT TO_CHAR(-1234, '999,999MI') 숫자
 FROM dual;
 
SELECT TO_CHAR(123456789, '9.999EEEE') 숫자
 FROM dual;

4) 20번 부서의 사원의 보너스가 급여의 몇 퍼센트인지 검색한다
급여는 월간급여이고 보너스는 연간 보너스이다
보너스가 null 인 경우는 0으로 환원해서 검색한다
SELECT eno, ename,
       TO_CHAR(NVL(comm,0)/(sal*12)*100, '99')||'%' 급여비율
 FROM emp
 WHERE dno='20';
 
SELECT eno, ename,
       ROUND(NVL(comm,0)/(sal*12)*100)||'%' 급여비율
 FROM emp
 WHERE dno='20';

            
5) 1992년 이전에 입사한 사원의 정보를 검색하자
SELECT eno, ename, hdate
 FROM emp
 WHERE hdate < TO_DATE('1992/01/01', 'YYYY/MM/DD');

세션의 출력 형식이 'DD-MON-YY'등과 같이 달라진다면
WHERE hdate < '1992/01/01' 방식의 비교는
정상적인 실행을 보장할 수 없다
이럴 때는 세션의 출력형식을 변경하던지 아니면
비교 문자열을 출력형식에 맞추던지 해야 한다.
이것은 날짜의 표기 방식이 OS나 오라클의 지원 언어 등에
따라 달라져서 발생하는 문제이다.
SQL 문장을 작성하는 개발자가 세션의 날짜 형식과 무관한
SQL 문장을 작성하고 싶다면 반드시 TO_DATE함수를 사용해서
비교해야 한다. 
TO_DATE 로 작성된 SQL 문은 어떤 오라클 환경에서도 동일한
사용이 보장된다.
이것을 '이식성이 좋다' 라고 표현한다

          
          
          
          
          
















'



    
    

           
           
           
           
           
           