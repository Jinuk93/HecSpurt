package ch02;

import java.util.Scanner;

public class switchEx {

	public static void main(String[] args) {
		char grade;
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Input score(1~100) : ");
		int score = sc.nextInt();
		score = score*10/100; //90점대,80점대로 만들어주기 위해 이 한문장이 핵심포인트!!
		
		switch(score) {
		case 10:
		case 9:
			grade = 'A';
			System.out.println("grade = " + grade);
			break;
		case 8:
			grade = 'B';
			System.out.println("grade = " + grade);
			break;
		case 7:
			grade = 'C';
			System.out.println("grade = " + grade);
			break;
		case 6:
			grade = 'D';
			System.out.println("grade = " + grade);
			break;
			
		
		}
		
	}
}
