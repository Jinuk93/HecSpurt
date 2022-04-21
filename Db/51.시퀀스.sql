<시퀀스(Sequence)>
;  시퀀스는 유일한 숫자를 제공하는 객체다.
   보통 함수나 프로그램으로 구현하는 기능을 오라클은
   객체로 제공함으로써 더 간단히 데이터를 생성할 수 있도록
  지원한다.
  
  테이블에 입력되는 데이터 중에는 절대 중복되면 안되는
 부분이 있다.
  대표적으로 복합키를 대체하는 대리키(인공키)와 같은
  '일련번호'가 있다.
  일반적으로는  현재까지 입력된 값의 최대값을 검색해서
 +1을 하여 새로운 값으로 입력하는 방법을 많이 사용한다.
  그러나 이런 방법으로는 여러 개의 트랜잭션이 동시에
 수행되는 환경에서 입력 실패가 번번히 발생한다는 단점이
 있다. 
  그래서 오라클에서는 시퀀스를 사용한다.
  
  어플리케이션 개발시 많이 사용한다.
  
  CREATE SEQUENCE 시퀀스명
  [START WITH 시작값
   INCREMENT BY 증가값
   MAXVALUE [상한값|NOMAXVALUE]
   MINVALUE [하한값|NOMINVALUE]
   CYCLE|NOCYCLE
   CACHE [cache 개수|NOCACHE]];
   1) 자동으로 유일한 값을 생성하는 시퀀스를 생성한다
   2) START_WITH : 할당을 시작하는 값을 정의한다.
       지정하지 않으면 MINVALUE 값이 정의된다.
       - MINVALUE 값보다 작은 값을 지정할 수 없다.
   3) INCREMENT BY : 생성되는 값의 증가치를 결정한다.
        지정하지 않으면 1에서 시작한다.
   4) MAXVALUE : 생성될 상한값을 정의한다.
        기본 설정은 NOMAXVALUE 이다.
   5) MINVALUE : 하한값을 정의한다. 
        기본 설정은 NOMINVALUE 이다.
       - NOMINVALUE 로 지정되면 START_WITH 값은
        1로 정의된다.
   6) CYCLE : 상한 값까지 생성한 이후 다시 하한값부터
        재생성할 것인지 여부
       - 지정하지 않으면 NOCYCLE 가 기본 설정
       - NOCYCLE 에서 상한 값이 정의되어 있으면 값은
         상한값가지 생성되고 이후에는 생성되지 않는다.
   7) CACHE : 메모리에 미리 생성될 값의 개수를 정의한다.
       - 지정하지 않으면 20개를 미리 생성해둔다.
       
 ALTER SEQUENCE 시퀀스명
 INCREMENT BY 증가값
 MAXVALUE [상한값|NOMAXVALUE]
 MINVALUE [하한값|NOMINVALUE]
 CYCLE | NOCYCLE
 CACHE cache_개수|NOCACHE;
   1) 시퀀스의 설정을 변경한다
   2) START WITH 값은 변경할 수 없다
     - 이외 모든 설정은 CREATE SEQUENCE 와 동일하다.
     
 DROP SEQUENCE 시퀀스명;
   1) 시퀀스를 삭제한다.
   
 시퀀스명.nextval
 시퀀스명.currval
   1) nextval : 시퀀스로부터 유일한 값을 할당받는다.
     - 여러 사용자(세션)에서 공유 가능하지만 어떤 경우도
      중복되지 않는다.
   2) currval : 시퀀스로부터 마지막으로 할당받은 값을
       다시 할당받는다
     - nextval 이후에만 사용가능하다.
   3) 주로 INSERT 문의 VALUES 절이나 UPDATE 의 SET 절에서
     많이 사용된다.
     
시퀀스를 2가지 방법으로 생성해보자


디폴트 설정(1씩 증가)



순환 시퀀스 생성
CACHE 자동으로 20개 만들어놓는 것
보다 MAXVALUE 가 커야한다
그래서 아래는 에러


  
시퀀스로부터 값을 할당받아 사용한다


현재 시퀀스로 사용된 최대값을 얻어오기


롤백을 해도 시퀀스는 그냥 증가한다
중복되지 않은 값을 쓸때는 유용하지만
만약 무조건 GAP(1에서 3이 넘어가는 것)은 
생길 수 밖에 없다.

     
     
    
     
     
     
     
     
      
      
      
      
      
      
 
 
 
 
 
  
   
   
   
   
   
   
     
     
     
     
     
     
   
   
   
   
   
 
 
 
 
 
 
       
       
       
       
       
       
       
       
        
        
        
        
  
        
        
        
        
       
       
   
   
   
   
   
  
  
  
  
  
  
  