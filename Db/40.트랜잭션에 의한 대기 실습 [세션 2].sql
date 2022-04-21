[세션 2]

2) 다른 세션에서 변경하고 트랜잭션이 
  완료되지 않은 행을 검색한다
    Undo Segment 의 데이터를 읽어온다
SELECT sno, sname, major
FROM student
WHERE sname='마초';

3) 독점 잠금이 걸린 행을 UPDATE 시도한다
UPDATE student SET major='경제'
WHERE sname='마초';


6) 무한 대기가 풀리고 명령이 실행된 후
   검색을 한다
SELECT sno, sname, major
FROM student
WHERE sname='마초';  


7) 트랜잭션 완료
COMMIT;
