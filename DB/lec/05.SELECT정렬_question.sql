--1) 성적순으로 학생의 이름을 검색하세요
SELECT avr 성적, sno, sname
 FROM student
 ORDER BY avr DESC;
 
--2) 학과별 성적순으로 학생의 정보를 검색하세요
SELECT major, avr, sno, sname
 FROM student
 ORDER BY major, avr DESC;

--3) 학년별 성적순으로 학생의 정보를 검색하세요
SELECT syear, avr, sno, sname
 FROM student
 ORDER BY syear, avr DESC;

--4) 학과별 학년별로 학생의 정보를 성적순으로 검색하세요
SELECT major, syear, avr, sno, sname
 FROM student
 ORDER BY major, syear, avr DESC;
 
--5) 학점순으로 과목 이름을 검색하세요
SELECT st_num, cno, cname
 FROM course
 ORDER BY st_num DESC;


--6) 각 학과별로 교수의 정보를 검색하세요
SELECT section, pno, pname, hiredate, orders
 FROM professor
 ORDER BY section;
 
--SELECT *
-- FROM professor
-- ORDER BY section;

--7) 지위별로 교수의 정보를 검색하세요
SELECT orders, pno, pname, section, hiredate
 FROM professor
 ORDER BY orders;

--8) 각 학과별로 교수의 정보를 부임일자 순으로 검색하세요
SELECT section, hiredate, pno, pname, orders
 FROM professor
 ORDER BY section, hiredate;




