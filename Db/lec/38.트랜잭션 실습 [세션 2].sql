[세션 2]

3) 다른 세션에서 동일한 행을 검색해본다
    독점 잠금이 세션1에 의해 걸려있으므로
    Undo Segment 에서 값을 읽어온다.
SELECT sno, sname, avr
FROM student
WHERE sname='마초';


5) 다시 검색하자
SELECT sno, sname, avr
FROM student
WHERE sname='마초';

