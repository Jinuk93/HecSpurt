/*
"exit"�� �ԷµǸ� while���� ������� break���� Ȱ���ϴ� ���α׷��� �ۼ��϶�! 
*/
package ch02;

import java.util.Scanner;

public class BreakExample {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("exit�� �Է��ϸ� ����˴ϴ�"); // ������ڸ���, �ֿܼ� ��µǴ� ��¹�
		
		while(true) {
			System.out.print(">>");
			String text = sc.nextLine();
			
			if(text.equals("exit")) {	//"exit"�� �ԷµǸ� �ݺ�����
				break; //while���� ���
			}
			System.out.println("�����մϴ�.");
			sc.close();
		} 
	}
}
