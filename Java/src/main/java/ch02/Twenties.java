package ch02;

import java.util.Scanner;

public class Twenties {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

	
		System.out.println("���̸� �Է��Ͻÿ�");
		int age = sc.nextInt();
		if((age>=20) && (age<30)) { //age�� 20~29 �������� �˻�
			System.out.println("20�� �Դϴ�.");
			System.out.println("20��� �ູ�մϴ�");
		}
		else
			System.out.println("20�밡 �ƴմϴ�");
		sc.close();
	}
}
