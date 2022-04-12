/*
사칙 연산을 입력받아 실행해주는 프로그램을 작성하시오. 피연산자는 모두 실수이다.
*/
package ch02;

import java.util.Scanner;

public class arithmetic {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Input op1 operator op2 : ");
	
		double op1 = sc.nextDouble(); // 제일 먼저 받는 숫자 == op1
		String operator = sc.next(); // +, -, *, /* 읽는다. 그외의 String은 Error 출력 25line에서 설정
		double op2 = sc.nextDouble(); // 두번쨰로 받는 숫자 == op2
		
		double result = 0; // result 값을 우선적으로 초기화 시킨다
		
		switch(operator) {
			case "+" : result = op1+op2; break;
			case "-" : result = op1-op2; break;
			case "*" : result = op1*op2; break;
			case "/" : result = op1/op2; break;
			
		default : System.out.println("Error"); // 사칙연산 이외의 기호를 입력받으면 Error 출력?
		}
		System.out.println("result = " + result);
	}
}
