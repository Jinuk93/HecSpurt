package ch02;

import java.util.Scanner;

public class Grading {

	public static void main(String[] args) {
		char grade;
		Scanner sc = new Scanner(System.in);
	
		System.out.println("점수를 입력하세요(0~100) : ");
		
		int score = sc.nextInt();
		if(score >= 90) // score가 90이상
			grade = 'A';
		else if(score >= 80) // score가 80이상 90미만
			grade = 'B';
		else if(score >= 70) // score가 70이상 80미만
			grade = 'C';
		else if(score >= 60) // score가 60이상 70미만
			grade = 'D';
		else // score가 60미만
			grade = 'F';
	
		System.out.println("학점은" + grade + "입니다.");
		sc.close();
	}
}
