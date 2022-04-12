/*
while문을 이용하여 정수를 여러 개 입력 받고 평균을 출력하라. 0이 입력되면 입력을 종료한다.

개수와 합산까지만 구하는 듯 싶다!
*/
package ch02;

import java.util.Scanner;

public class WhileSample {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		int count = 0, n = 0; // n 입력받는 정수, count는 정수의 개수
		double sum = 0; 
		
		System.out.println("정수를 입력하고 마지막에 0을 입력하세요");
		while((n = sc.nextInt()) != 0) { // 0이 입력되면 while문을 벗어난다
			sum = sum + n; // n의 누적합산 = sum
			count ++;
		}
		System.out.println("수의 개수는 " + count + "개이며 ");
		System.out.println("평균은 " + sum/count + "입니다.");
		sc.close();
	}
}
