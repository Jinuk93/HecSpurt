--1) 화학과와 물리학과 학생을 검색하라
SELECT *
 FROM student
 WHERE major='화학' OR major='물리';
 
 
--2) 화학과가 아닌 학생중에 1학년 학생을 검색하라
SELECT *
FROM student
WHERE NOT major='화학' AND syear=1;

SELECT *
FROM student
WHERE major!='화학' AND syear=1;


--3) 물리학과 3학년 학생을 검색하라
SELECT *
FROM student
WHERE major='물리' AND syear=3;


--4) 평점이 2.0에서 3.0사이인 학생을 검색하라
SELECT *
FROM student
WHERE avr >= 2.0 AND avr <= 3.0;


--5) 교수가 지정되지 않은 과목중에 학점이 3학점인 과목을 검색하라
SELECT *
FROM course
WHERE pno IS NULL AND st_num=3;


--6) 화학과 관련된 과목중 평점이 2학점 이하인 과목을 검색하라
SELECT *
FROM course
WHERE st_num <= 2 AND cname LIKE '%화학%';


--7) 화학과 정교수를 검색하라
SELECT *
FROM professor
WHERE section='화학' AND orders='정교수';


--8) 물리학과 학생중에 성이 사마씨인 학생을 검색하라
SELECT *
FROM student
WHERE major='화학' AND sname LIKE '사마%';


--9) 부임일이 1995년 이전인 정교수를 검색하라
SELECT * 
FROM professor
WHERE hiredate < '1995/01/01' AND orders='정교수';


--10) 성과 이름이 각각 1글자인 교수를 검색하라
SELECT *
FROM professor
WHERE pname LIKE '__';

