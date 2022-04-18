--1) 송강 교수가 강의하는 과목을 검색한다 \
SELECT p.pno, pname, cno, cname
FROM professor p, course c
WHERE p.pno=c.pno
AND pname='송강';

--2) 화학 관련 과목을 강의하는 교수의 명단을 검색한다
SELECT p.pno, pname "화학과목강의교수", cname
FROM professor p, course c
WHERE p.pno=c.pno
AND cname LIKE '%화학%';


--3) 학점이 2학점인 과목과 이를 강의하는 교수를 검색한다
SELECT cno, cname, st_num, p.pno, pname
FROM professor p, course c
WHERE p.pno=c.pno
AND st_num=2;

--4) 화학과 교수가 강의하는 과목을 검색한다
SELECT cno, cname "화학과교수강의과목"
FROM professor p, course c
WHERE p.pno=c.pno
AND section='화학';

--5) 화학과 1학년 학생의 기말고사 성적을 검색한다
SELECT major, syear, s.sno, sname, cno, result
FROM student s, score r
WHERE s.sno=r.sno
AND major='화학' AND syear=1;

--6) 일반화학 과목의 기말고사 점수를 검색한다
SELECT sno, result
FROM course c, score r
WHERE c.cno=r.cno
AND cname='일반화학';

--7) 화학과 1학년 학생의 일반화학 기말고사 점수를 검색한다
SELECT major, syear, s.sno, sname, cname, result
FROM student s, course c, score r
WHERE s.sno=r.sno AND c.cno=r.cno
AND major='화학' AND syear=1 AND cname='일반화학';


--8) 화학과 1학년 학생이 수강하는 과목을 검색한다
SELECT DISTINCT cname
FROM student s, course c, score r
WHERE s.sno=r.sno AND c.cno=r.cno
AND major='화학' AND syear=1;


--9) 유기화학 과목의 평가점수가 F인 학생의 명단을 검색한다
SELECT s.sno, sname, cname, result, grade
FROM student s, course c, score r, scgrade g
WHERE s.sno=r.sno AND c.cno=r.cno
AND result BETWEEN loscore AND hiscore
AND cname='유기화학' AND grade='F';

