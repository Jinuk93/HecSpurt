package ch02;

import java.util.Scanner;

public class Twenties {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

	
		System.out.println("나이를 입력하시오");
		int age = sc.nextInt();
		if((age>=20) && (age<30)) { //age가 20~29 사이인지 검사
			System.out.println("20대 입니다.");
			System.out.println("20대라서 행복합니다");
		}
		else
			System.out.println("20대가 아닙니다");
		sc.close();
	}
}
