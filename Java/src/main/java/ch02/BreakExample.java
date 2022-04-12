/*
"exit"이 입력되면 while문을 벗어나도록 break문을 활용하는 프로그램을 작성하라! 
*/
package ch02;

import java.util.Scanner;

public class BreakExample {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("exit을 입력하면 종료됩니다"); // 실행되자마자, 콘솔에 출력되는 출력문
		
		while(true) {
			System.out.print(">>");
			String text = sc.nextLine();
			
			if(text.equals("exit")) {	//"exit"이 입력되면 반복종료
				break; //while문을 벗어남
			}
			System.out.println("종료합니다.");
			sc.close();
		} 
	}
}
