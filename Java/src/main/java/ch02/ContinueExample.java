package ch02;

import java.util.Scanner;

public class ContinueExample {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("������ 5�� �Է��ϼ���");
		int sum = 0;
		
		for(int i=0; i<5; i++) { //int i�� for���ȿ��� i��� ���������� ����, 0�� ���� �ʱ�ȭ
			int n = sc.nextInt();
			if(n<=0) { 
				continue; // 0�̳� ������ ��� ������ �ʰ� ���� �ݺ����� ����
			}else {
				sum += n; // ����� ��� ����
			}
			 System.out.println("����� ���� " + sum);
			 sc.close();
			}
		}
	}
