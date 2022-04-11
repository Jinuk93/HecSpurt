/*
exam 2-5. /와 % 산술 연살자 응용
*/
package day1;

import java.util.Scanner;

public class ArithmaticOperator {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("점수를 입력하세요");
		int time = sc.nextInt();
		int second = time % 60; //60으로 나눈 나머지 초
		int minute = (time / 60) % 60; // 60으로 나눈 몫을 다시 60으로 나눈 나머지 분
		int hour = (time/60) /60; //60으로 나눈 몫을 다시 60으로 나눈 몫은 시간
		
		System.out.println(time + "초는 ");
		System.out.println(hour + "시간 ");
		System.out.println(minute + "분 ");
		System.out.println(second + "초입니다. ");
		sc.close();
	}
}
