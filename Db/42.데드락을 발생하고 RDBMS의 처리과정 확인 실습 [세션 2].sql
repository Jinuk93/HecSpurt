[세션 2]

4)  세션1에서 변경을 시도한 행을 포함한
    관우, 장각 학생의 학과 정보를 검색한다
SELECT sno, sname, major
FROM student
WHERE sname IN ('관우', '장각');


5) 장각 학생의 학과를 경제로 변경시도한다
UPDATE student SET major='경제'
WHERE sname='장각';

6)  잘 적용되었는지
    관우, 장각 학생의 학과 정보를 검색한다
SELECT sno, sname, major
FROM student
WHERE sname IN ('관우', '장각');


7) 관우 학생의 학과를 '물리'로 변경을 시도
   현재 세션1에 의해 관우 학생의 행은 독점잠금이
   걸려있는 상태이다.
UPDATE student SET major='물리'
WHERE sname='관우';

상대와 DeadLock상태에서 오라클의 에러 발생 후
강제로 마지막 명령만 
ROLLBACK 에 의해 무한 대기가 풀리게 된다.

SELECT sno, sname, major
FROM student
WHERE sname IN ('관우', '장각');

COMMIT;


