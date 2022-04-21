--Natural Join이나 Using절 조인으로 해결하라

--1) 송강 교수가 강의하는 과목을 검색한다
SELECT pno, pname, cno, cname
FROM professor
NATURAL JOIN course
WHERE pname='송강';

SELECT pno, pname, cno, cname
FROM professor
JOIN course USING (pno)
WHERE pname='송강';


--2) 화학 관련 과목을 강의하는 교수의 명단을 검색한다
SELECT pname "화학과목강의교수", cname
FROM professor
NATURAL JOIN course
WHERE cname LIKE '%화학%';

SELECT pname "화학과목강의교수", cname
FROM professor
JOIN course USING (pno)
WHERE cname LIKE '%화학%';


--3) 학점이 2학점인 과목과 이를 강의하는 교수를 검색한다
SELECT cno, cname, st_num, pno, pname
FROM course
NATURAL JOIN professor
WHERE st_num=2;

SELECT cno, cname, st_num, pno, pname
FROM course
JOIN professor USING (pno)
WHERE st_num=2;


--4) 화학과 교수가 강의하는 과목을 검색한다
SELECT cname "화학과교수강의과목"
FROM course
NATURAL JOIN professor
WHERE section='화학';

SELECT cname "화학과교수강의과목"
FROM course
JOIN professor USING (pno)
WHERE section='화학';


--5) 화학과 1학년 학생의 기말고사 성적을 검색한다
SELECT major, syear, sno, sname, cno, result
FROM student
NATURAL JOIN score
WHERE major='화학' AND syear=1;

SELECT major, syear, sno, sname, cno, result
FROM student
JOIN score USING (sno)
WHERE major='화학' AND syear=1;


--6) 일반화학 과목의 기말고사 점수를 검색한다
SELECT sno, result
FROM score
NATURAL JOIN course
WHERE cname='일반화학';

SELECT sno, result
FROM score
JOIN course USING (cno)
WHERE cname='일반화학';


--7) 화학과 1학년 학생의 일반화학 기말고사 점수를 검색한다
SELECT major, syear, sno, sname, cname, result
FROM student
NATURAL JOIN score--course  --score
NATURAL JOIN course--score --course
WHERE major='화학' AND syear=1 AND cname='일반화학';

SELECT major, syear, sno, sname, cname, result
FROM student
JOIN score USING (sno)
JOIN course USING (cno)
WHERE major='화학' AND syear=1 AND cname='일반화학';


--8) 화학과 1학년 학생이 수강하는 과목을 검색한다
SELECT DISTINCT cname
FROM student
NATURAL JOIN score
NATURAL JOIN course
WHERE major='화학' AND syear=1;

SELECT DISTINCT cname
FROM student
JOIN score USING (sno)
JOIN course USING (cno)
WHERE major='화학' AND syear=1;








