/*
��Ģ ������ �Է¹޾� �������ִ� ���α׷��� �ۼ��Ͻÿ�. �ǿ����ڴ� ��� �Ǽ��̴�.
*/
package ch02;

import java.util.Scanner;

public class arithmetic {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Input op1 operator op2 : ");
	
		double op1 = sc.nextDouble(); // ���� ���� �޴� ���� == op1
		String operator = sc.next(); // +, -, *, /* �д´�. �׿��� String�� Error ��� 25line���� ����
		double op2 = sc.nextDouble(); // �ι����� �޴� ���� == op2
		
		double result = 0; // result ���� �켱������ �ʱ�ȭ ��Ų��
		
		switch(operator) {
			case "+" : result = op1+op2; break;
			case "-" : result = op1-op2; break;
			case "*" : result = op1*op2; break;
			case "/" : result = op1/op2; break;
			
		default : System.out.println("Error"); // ��Ģ���� �̿��� ��ȣ�� �Է¹����� Error ���?
		}
		System.out.println("result = " + result);
	}
}
