package ch02;

import java.util.Scanner;

public class ArrayAccess {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		int intArray[];
		intArray =  new int[5];
		int max=0; //���� ���� ū�� max�� �ʱ�ȭ
		
		System.out.println("�Լ� 5���� �Է��ϼ���");
		
		for(int i=0; i<5; i++) {
			intArray[i] = sc.nextInt(); //�Է� ���� ������ �迭�� ����
			if(intArray[i] > max) 
				max = intArray[i]; // max ����
		}
			System.out.println("���� ū ���� " + max + "�Դϴ�.");
			
			sc.close();
		}
	}


