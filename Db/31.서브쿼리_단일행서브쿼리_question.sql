<서브 쿼리를 사용하세요>
1) 관우보다 평점이 우수한 학생의 학번과 이름을 검색하세요
SELECT sno, sname
FROM student
WHERE avr > (SELECT avr 
              FROM student
              WHERE sname='관우');


2) 관우와 동일한 학년 학생 중에 평점이 사마감과 동일한 학생을 검색하세요
SELECT sno, sname
FROM student
WHERE syear = (SELECT syear 
               FROM student
               WHERE sname='관우')
AND avr = (SELECT avr 
           FROM student
           WHERE sname='사마감');



3) 관우보다 일반 화학과목의 학점이 더 낮은 학생의 명단을 학점과 검색하세요
SELECT grade
 FROM student s, course c, score r, scgrade g
 WHERE s.sno=r.sno AND r.cno=c.cno
 AND result BETWEEN loscore AND hiscore
 AND sname='관우'
 AND cname='일반화학';

SELECT s.sno, sname, grade
FROM student s, course c, score r, scgrade g
WHERE s.sno=r.sno AND r.cno=c.cno AND result BETWEEN loscore AND hiscore
AND cname='일반화학'
AND grade > (SELECT grade
             FROM student s, course c, score r, scgrade g
             WHERE s.sno=r.sno AND r.cno=c.cno
             AND result BETWEEN loscore AND hiscore
             AND sname='관우'
             AND cname='일반화학')
AND sname!='관우';

SELECT s.sno, sname, result
FROM student s, course c, score r
WHERE s.sno=r.sno AND r.cno=c.cno
AND cname='일반화학'
AND result < (SELECT result
             FROM student s, course c, score r
             WHERE s.sno=r.sno AND r.cno=c.cno
             AND sname='관우'
             AND cname='일반화학')
AND sname!='관우';


4) 인원수가 가장 많은 학과를 검색하세요
SELECT major, COUNT(*)
 FROM student
 GROUP BY major;
 
SELECT MAX(COUNT(*))
 FROM student
 GROUP BY major;
 
SELECT major, COUNT(*)
FROM student
GROUP BY major
HAVING COUNT(*) = (SELECT MAX(COUNT(*))
                   FROM student
                   GROUP BY major);


5) 학생 중 기말고사 성적이 가장 낮은 학생의 정보를 검색하세요
SELECT sno, AVG(result)
  FROM score
  GROUP BY sno;
  
SELECT MIN(AVG(result))
  FROM score
  GROUP BY sno;

SELECT s.sno, sname, AVG(result)
FROM student s, score r
WHERE s.sno=r.sno
GROUP BY s.sno, sname
HAVING AVG(result) = (SELECT MIN(AVG(result))
                      FROM score
                      GROUP BY sno);








