--ON 절, 좌우외부조인 사용하라
1) 각 과목의 과목명과 담당 교수의 교수명을 검색하라

2) 화학과 학생의 기말고사 성적을 모두 검색하라
SELECT s.sno, sname, cname, result
FROM students s
JOIN score r ON (s.sno=r.rno)
JOIN course c ON (c.cno=r.cno)
WHERE major='화학';


3) 유기화학과목 수강생의 기말고사 시험점수를 검색하라
SELECT r.sno, result
FROM score r
JOIN course c ON r.cno=c.cno
WHERE cname='유기화학';

4) 화학과 학생이 수강하는 과목을 담당하는 교수의 명단을 검색하라
SELECT DISTINCT pname
FROM professor p
JOIN course c ON p.pno=c.pno
JOIN score r ON c.cno=r.cno
JOIN students ON s.sno=r.sno
WHERE major='화학';

5) 모든 교수의 명단과 담당 과목을 검색한다
SELECT pno, pname, cname
FROM professor LEFT JOIN course USING (pno);
LEFT JOIN course USING (pno);

6) 모든 교수의 명단과 담당 과목을 검색한다(단 모든 과목도 같이 검색한다)
SELECT pno, pname, cname
FROM professor
FULL JOIN course USING pno;


