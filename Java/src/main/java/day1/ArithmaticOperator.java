/*
exam 2-5. /�� % ��� ������ ����
*/
package day1;

import java.util.Scanner;

public class ArithmaticOperator {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("������ �Է��ϼ���");
		int time = sc.nextInt();
		int second = time % 60; //60���� ���� ������ ��
		int minute = (time / 60) % 60; // 60���� ���� ���� �ٽ� 60���� ���� ������ ��
		int hour = (time/60) /60; //60���� ���� ���� �ٽ� 60���� ���� ���� �ð�
		
		System.out.println(time + "�ʴ� ");
		System.out.println(hour + "�ð� ");
		System.out.println(minute + "�� ");
		System.out.println(second + "���Դϴ�. ");
		sc.close();
	}
}
