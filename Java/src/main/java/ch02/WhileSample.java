/*
while���� �̿��Ͽ� ������ ���� �� �Է� �ް� ����� ����϶�. 0�� �ԷµǸ� �Է��� �����Ѵ�.

������ �ջ������ ���ϴ� �� �ʹ�!
*/
package ch02;

import java.util.Scanner;

public class WhileSample {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		int count = 0, n = 0; // n �Է¹޴� ����, count�� ������ ����
		double sum = 0; 
		
		System.out.println("������ �Է��ϰ� �������� 0�� �Է��ϼ���");
		while((n = sc.nextInt()) != 0) { // 0�� �ԷµǸ� while���� �����
			sum = sum + n; // n�� �����ջ� = sum
			count ++;
		}
		System.out.println("���� ������ " + count + "���̸� ");
		System.out.println("����� " + sum/count + "�Դϴ�.");
		sc.close();
	}
}
