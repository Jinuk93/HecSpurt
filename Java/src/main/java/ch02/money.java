/*
돈을 입력받아 5만원권, 만원권, 천원권, 오백원 동전, 백원동전짜리로 출력하시오.
*/
package ch02;

import java.util.Scanner;

public class money {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Input Money : ");
		
		int money = sc.nextInt(); // 예시 61240원
		int m50000 = money / 50000;
		money = money / 50000;
		int m10000 = money / 10000; //
		money = money % 1000;
		int m1000 = money / 1000;
		money = money % 1000;
		int m500 = money % 500;
		money = money % 500;
		int m100 = money / 100;
		
		sc.close();
		
		System.out.println("50,000 : " + m50000);
		System.out.println("10,000 : " + m10000);
		System.out.println("1,000 : " + m1000);
		System.out.println("500 : " + m500);
		System.out.println("100 : " + m100);
		}		
	}
