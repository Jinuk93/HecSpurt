/*
exam 2-1. Hello 자바 프로그램의 기본 구조 
*/
package day1;

public class Hello {

	public static int sum(int n, int m) { //int n, int m은 매개변수
										  // 매개변수 == 인수 == parameter == argument
		return n + m ; // 호출한 곳으로 값을 전달
					   // return 문을 만나는 순간, sum 메소드 들은 종료된다 (밑에 메소드가 있더라도)
}
	public static void main(String[] args) { // 클래스 실행 시, main() 메소드가 우선적으로 실행된다
		int i = 20; // 20은 리터럴 상수
		int s; // int 는 data type이고, int는 정수형 타입이다
		char a; // char '하나의' 문자형 type이고, ''(싱글 따옴표)를 쓴다. 긴 문자열은 String type
	
		s = sum(i, 10); // sum()메소드를 호출한다 -> return 메소드를 통해 값을 받아온다.
		a = '?';
		System.out.println(a); // 문자 "?"화면 출력
		System.out.println("Hello"); // "Hello" 문자열 화면출력, String 문자열 타입의 데이터
		System.out.println(s); // 정수 s 값 화면 출력
	}
}