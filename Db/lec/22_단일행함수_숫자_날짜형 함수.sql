단일 행 함수 - 숫자, 날짜형 함수

ROUND : 그냥 쓰면 소수점을 반올림해서 정수로
        ROUND(m, n)
        n자리까지 반올림한다
        ROUND(123.4567, 3) => 123.457
TRUNC : TRUNC(m, n)
        n자리 미만을 절삭한다
        TRUNC(123.4567, 3) => 123.456
MOD : MOD(m, n)
      m을 n으로 나눈 나머지 계산한다
      MOD(10, 4) => 2
POWER : POWER(m, n)
        m의 n승 계산한다
        POWER(2, 4) => 16
CEIL  : CEIL(m)
        m보다 큰 가장 작은 정수를 찾는다
        CEIL(2.34) => 3
FLOOR : FLOOR(m)
        m보다 작은 가장 큰 수를 찾는다
        FLOOR(2.34) => 2
ABS : ABS(m)
      m의 절대값을 계산한다
      ABS(-4) => 4
SQRT :  SQRT(m)
        m의 제곱근을 계산한다
        SQRT(9) => 3
SIGN : SIGN(m)
        m이 음수일 때 -1, 양수일 때 1, 0이면 0을 반환
        SIGN(-3) => -1
        
1)다양한 숫자 함수를 이용한 결과를 확인한다
SELECT ROUND(98.765), TRUNC(98.765), --ROUND 반올림
       ROUND(98.765, 2), TRUNC(98.765, 2)
  FROM dual;

2)부서의 연봉을 계산한다. 단 100단위 미만은 절삭한다
SELECT enm, ename, TRUNC(sal*12+NVL(comn,0), -2) 연봉 --TRUNC 절삭
  FROM emp;
  
SELECT TRUNC(19786.786, 2), TRUNC(19786.786, -2)
  FROM dual;
        
--날짜 함수

--3)현재 시간을 검색하자
SELECT sysdate
  FROM dual;

--4)김연아의 
--오늘 날짜, 입사 일자, 입사일로부터 오늘까지 기간,
--입사일 이후 100일이 지난날 등을 검색하고
--날짜 연산의 결과를 보자
ALTER SESSION SET nls_date_format='YY/MM/DD';

SELECT sysdate, hdate, sysdate-hdate, hdate+100
  FROM emp
  WHERE ename='김연아';


날짜 + 숫자 = 날짜(일수 이후 날짜)
날짜 - 숫자 = 날짜(일수 이전 날짜)
날짜 + 숫자/24 = 날짜 (시간을 더한 날짜)
날짜 - 날짜 = 숫자 (두 날짜 간에 차(일수))

날짜 함수는 주로 회계 정산시 많이 사용한다
ERP 솔루션, SI 회계



YYYY : 년도
MM : 월
DD : 날짜
HH : 시간
MI : 분
SS : 초
        
ROUND : ROUND(날짜, 형식)
        형식에 맞추어 반올림한 날짜를 반환한다
        ROUND(sysdate, 'DD') => 2020/02/26
TRUNC : TRUNC(날짜, 형식)
        형식에 맞추어 절삭한 날짜를 반환한다
        TRUNC(sysdate, 'YYYY') => 2020/01/01
MONTHS_BETWEEN : MONTHS_BETWEEN(날짜1, 날짜2)
                 두 날짜간의 기간을 월 수로 계산한다
                 MONTHS_BETWEEN('2020/03/01', '2020/04/01')
                 => 1
ADD_MONTHS : ADD_MONTHS(날짜, n);
             날짜에 n달을 더한 날짜를 계산한다
             ADD_MONTHS('2020/03/01', 23)
             => '2022/02/01'
NEXT_DAY : NEXT_DAY(날짜, 요일)
           날짜 이후 지정된 요일에 해당하는 날짜를 계산
           요일 표현은 'sun', '일요일', 1과 같이
           다양한 표현이 가능하다
LAST_DAY : LAST_DAY(날짜)
           날짜를 포함한 달의 마지막 날짜를 계산
           LAST_DAY('2020/02/25') => 2020/02/29
        

5) 숫자와 날짜를 반올림하여 출력한다
SELECT sysdate, 
        ROUND(sysdate, 'YY') 년,
        ROUND(sysdate, 'YY') 년,
        ROUND(sysdate, 'YY') 년,
  FROM dual;

6) 숫자와 날짜를 절삭하여 출력한다
SELECT sysdate,
    TRUNC(sysdate, 'YY') 년,
    TRUNC(sysdate, 'MM') 월,
    TRUNC(sysdate, 'DD') 일,
  FROM dual;

7) 김연아가 오늘까지 일한 일수를 검색한다
입사일을 포함하기 위해 +1을 해줬다
SELECT TRUNC(sysdate, 'DD') - TRUNC(hdate, 'DD')+1 "일한 날"
  FROM emp
  WHERE ename='김연아';

8) 20번 부서 직원들이 현재까지 근무한 개월 수를 검색한다
SELECT eno, ename, TRUNC(MONTHS_BETWEEN(sysdate, hdate)) 근무개월
  FROM emp --ename 직원 이름 eno 사원번호
  WHERE dno='20'; --dno 근무개월

9) 20번 부서원들이 입사 100일째 되는 날과 10년째 되는 날을 검색한다
SELECT eno, ename, hdate 입사일, hdate+99 "입사 100일째",
      ADD_MONTHS(hdate, 10*12) "입사 10년째 되는 날"
  FROM emp
  WHERE don='20';

10) 20번 부서원들이 입사한 이후 첫 번째 일요일을 검색한다
SELECT eno, ename, hdate,
      NEXT_DAY(hdate, '일요일') "입사 후 첫번째 일요일"
  FROM emp
  WHERE dno='20';

SELECT NEXT_DAY(sysdate, '일요일') "오늘이후첫번째일요일"
  FROM dual;

11) 20번 부서원들의 입사한 달의 마지막 날짜와
입사한 달에 근무 일수를 검색한다
--(단 입사일은 근무일에서 제외한다)
SELECT eno, ename, hdate,
       LAST_DAY(hdate) "입사한 달 마지막 날짜",
       LAST_DAY(TRUNC(hdate))-TRUNC(hdate) "입사한달근무일수"
  FROM emp
  WHERE dno='20';









      
      
      
      
      
      
      
      
      
      