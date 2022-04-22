트랜잭션과 잠금의 이해
1) 실습에는 2개의 일반 사용자 세션이 사용된다.
2) 동일한 계정으로 접속한 SQL Developer를 2개 실행한다.
3) 2개의 창은 [세션1]과 [세션2]로 구분한다.

[세션1]

1)
SELECT * FROM student WHERE sname='마초';

UPDATE student SET avr = 0.1
WHERE sname='마초';


2) COMMIT 을 하지 않았으므로 마초의 행에는
  독점 잠금이 발생하고, student 테이블에는
  공유 잠금이 발생하였다.
  student 테이블의 avr 값은 새로 변경되었고
  Undo Segment 에는 마초의 이전 avr 값이 저장되었다.
SELECT sno, sname, avr
FROM student
WHERE sname='마초';


4) 트랜잭션을 완료하자
COMMIT;



