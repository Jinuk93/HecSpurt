1) 학생의 평균 평점을 다음 형식에 따라 소수점 이하 2자리까지 검색하세요
'OOO 학생의 평균 평점은 O.OO입니다.'
SELECT sname||' 학생의 평균 평점은 '||TO_CHAR(avr, '0.99')||'입니다.'
FROM student;

2) 교수의 부임일을 다음 형식으로 표현하세요
'OOO 교수의 부임일은 YYYY년 MM월 DD일입니다.'
SELECT pname||' 교수의 부임일은 '||TO_CHAR(hiredate, 'YYYY"년" MM"월 "DD"일"')||'입니다.'
FROM professor; 

3) 교수중에 3월에 부임한 교수의 명단을 검색하세요
SELECT pno, pname, hiredate
FROM professor
WHERE TO_CHAR(hiredate, 'MM')=03;


