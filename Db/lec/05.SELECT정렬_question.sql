--1) 성적순으로 학생의 이름을 검색하세요
SELECT sname, sno, AVR 성적
FROM student
ORDER BY avr DESC;

--2) 학과별 성적순으로 학생의 정보를 검색하세요
SELECT SNO, SNAME, SEX, SYEAR, MAJOR, AVR
FROM STUDENT
ORDER BY MAJOR, AVR DESC;

--3) 학년별 성적순으로 학생의 정보를 검색하세요
SELECT SNO, SNAME, SEX, SYEAR, MAJOR, AVR
FROM STUDENT
ORDER BY SYEAR, AVR DESC;

--4) 학과별 학년별로 학생의 정보를 성적순으로 검색하세요
SELECT SNO, SNAME, SEX, SYEAR, MAJOR, AVR
FROM STUDENT
ORDER BY major, SYEAR, avr DESC;

--5) 학점순으로 과목 이름을 검색하세요
SELECT st_num, cno, cname
FROM course
ORDER BY st_num DESC;

--6) 각 학과별로 교수의 정보를 검색하세요
SELECT * 
FROM PROFESSOR
ORDER BY section;

--7) 지위별로 교수의 정보를 검색하세요
SELECT pno, pname, section, orders, hiredate
FROM PROFESSOR
ORDER BY orders;

--8) 각 학과별로 교수의 정보를 부임일자순으로 검색하세요
SELECT pno, pname, section, orders, hiredate
FROM PROFESSOR
ORDER BY hiredate DESC;