/*
¦���� �հ� Ȧ���� ���� ���Ͻÿ�. 
*/
package ch02;

public class ForEx {

	public static void main(String[] args) {
		int odd=0, even=0; //even ¦���� ��, odd Ȧ���� ��
		for(int i=1; i<=100; i++) { //i<=100 �̶�� ���ǽ��� ����, ���ѷ����� �����Եȴ�
			if(i%2 == 0) {
				even += i;
		}else  
			odd += i;
		}
		System.out.println("¦���� �� = " + even);
		System.out.println("Ȧ���� �� = " + odd);
		}	
	}
