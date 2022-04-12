/*
짝수의 합과 홀수의 합을 구하시오. 
*/
package ch02;

public class ForEx {

	public static void main(String[] args) {
		int odd=0, even=0; //even 짝수의 합, odd 홀수의 합
		for(int i=1; i<=100; i++) { //i<=100 이라는 조건식을 빼면, 무한루프에 빠지게된다
			if(i%2 == 0) {
				even += i;
		}else  
			odd += i;
		}
		System.out.println("짝수의 합 = " + even);
		System.out.println("홀수의 합 = " + odd);
		}	
	}
