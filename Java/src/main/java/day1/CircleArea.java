/*
exam 2-2. 리터럴, 상수 사용하기
문제 : 원의 면적을 구하는 프로그램을 작성하라 
*/
package day1;

public class CircleArea {

	public static void main(String[] args) {
		final double PI = 3.14; //상수명은 대문자로 만든다
		double radius = 10.2;
		double circleArea = radius*radius*PI;
		
		//원의 면적을 화면에 출력한다
		System.out.print("반지름 " + radius + " ,");
		System.out.println(" 원의면적 "  + circleArea);
		
	}
}
