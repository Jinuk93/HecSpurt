/*
구구단
*/
package ch02;

public class NestedLoop {

	public static void main(String[] args) {
		int x, y;
		
		for(x=2; x<10; x++) { // 위의 int x,y 의 변수선언을 없애고 for문 안에 for(int x=1; x<10; 이런식으로 사용가능하다
			for(y=1; y<10; y++) {
				System.out.print(x + "*" + y + "=" + x*y); // 구구셈 출력
 				System.out.print('\t'); // 하나씩 탭으로 띄기 == spacebar
			}
				System.out.println(); // 한 단이 끝나면 다음 줄로 커서이동
			}	
		}
	}
