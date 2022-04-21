[세션 1]

1) 관우, 장각 학생의 학과 정보를 검색한다
SELECT sno, sname, major
FROM student
WHERE sname IN ('관우', '장각');

2) 관우 학생의 학과를 경제로 변경시도한다
   트랜잭션 시작
UPDATE student SET major='경제'
WHERE sname='관우';

3) 변경이 잘 되었는지
     관우, 장각 학생의 학과 정보를 검색한다
     아직 트랜잭션이 완료되지 않은 상태
SELECT sno, sname, major
FROM student
WHERE sname IN ('관우', '장각');

8) 세션2가 장각의 트랜잭션을 진행중인 것을 모르고 
   장각의 학과를 천문 학과로 변경을 시도
UPDATE student SET major='천문'
WHERE sname='장각';

세션2는 관우 학생의 변경을 시도했으므로 무한 대기상태였고
세션1은 세션2에 의해 트랜잭션이 진행중인 장각의 변경을
시도했으므로 동시에 무한 대기 상태로 빠져든다.
이렇게 2개의 세션모두 무한 대기상태에 빠져든 것을
DeadLock이라 부른다.

DeadLock은 세션 사용자에 의해 해결되지 않으므로
오라클은 먼저 무한 대기상태에 걸린 세션을 오류 처리하고
강제로 마지막 명령만 ROLLBACK 함으로써 DeadLock을 해결한다
   
COMMIT;
   
   