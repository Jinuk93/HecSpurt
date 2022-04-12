package ch02;

import java.util.Scanner;

public class ForEX2 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Input Number : ");
		int number = sc.nextInt();
		for(int i=1; i<10; i++) {
			System.out.println(number+"*"+i+"="+number*i);
		}
	}
}
