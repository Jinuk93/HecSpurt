/*
exam 2-1. Hello 자바 프로그램의 기본 구조 
*/
package day1;

public class Hello {

	public static int sum(int n, int m) { //int n, int m은 
		return n + m ;
	//int n, int m 매개변수 parameter할 때 받을 수 있는 값,매개변수==인수=parameter=argument
	//return : 호출한 곳에다가 값을 전달
	//return 문을 만나게되면 sum 메소드는 종료된다 ( 밑에 메소드들이 더 있다고하더라도! )
}

	//main() 메소드에서 실행 시작
	public static void main(String[] args) {
		int i = 20; //20은 리터럴 상수 , 초기화 시켜줌(데이터 저장)
		int s; // int 는 data type이다. int는 정수형 타입
		char a; // char 한 문자형, ' ' (싱글 따옴표), 긴 것은 String
	
		s = sum(i, 10); // sum() 메소드 호출에서 return 값으로 받아옴,
		a = '?';
		System.out.println(a); //문자 "?"화면 출력
		System.out.println("Hello"); // "Hello" 문자열 화면출력, String 문자열 타입의 데이터
		System.out.println(s); // 정수 s 값 화면 출력
	}
}