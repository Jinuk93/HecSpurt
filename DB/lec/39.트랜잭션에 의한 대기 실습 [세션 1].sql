[세션 1]

1) 데이터를 변경하자(UPDATE) - 트랜잭션 시작
    마초의 행에는 독점 잠금이 발생된다.
    student 테이블에는 공유 잠금이 발생된다.
    student 테이블은 새로운 학과인 '사회'로 변경된다.
    Undo Segment 에는 마초의 변경 이전 학과인
    '화학' 정보가 저장된다.
SELECT sno, sname, major
FROM student
WHERE sname='마초';

UPDATE student SET major='사회'
WHERE sname='마초';

SELECT sno, sname, major
FROM student
WHERE sname='마초';


4) 상대방이 독점잠금이 걸린 행을
   다시 변경하려고 시도하였으나
   세션1의 트랜잭션이 끝나지 않아
   무한 대기상태에 걸려있다
   
   트랜잭션을 완료한다
COMMIT;

커밋을 완료하면 상대 세션인 세션2는 대기상태에서 빠져나와
새로 변경된 데이터를 적용한다
  
  
5) 세션1의 트랜잭션은 마무리되었고
   세션2의 트랜잭션은 진행중인 상태
   현재 검색을 하면 내가 적용한 상태로 검색된다
SELECT sno, sname, major
FROM student
WHERE sname='마초';   
   
8) 세션2의 트랜잭션이 완료되고 검색을 한다   
SELECT sno, sname, major
FROM student
WHERE sname='마초';
   
   
   
   