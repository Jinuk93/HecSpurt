package ch02;

import java.util.Scanner;

public class ContinueExample {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("정수를 5개 입력하세요");
		int sum = 0;
		
		for(int i=0; i<5; i++) { //int i는 for문안에서 i라는 지역변수를 선언, 0의 값을 초기화
			int n = sc.nextInt();
			if(n<=0) { 
				continue; // 0이나 음수를 경우 더하지 않고 다음 반복으로 진행
			}else {
				sum += n; // 양수인 경우 덧셈
			}
			 System.out.println("양수의 합은 " + sum);
			 sc.close();
			}
		}
	}
