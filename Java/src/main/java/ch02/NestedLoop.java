/*
������
*/
package ch02;

public class NestedLoop {

	public static void main(String[] args) {
		int x, y;
		
		for(x=2; x<10; x++) { // ���� int x,y �� ���������� ���ְ� for�� �ȿ� for(int x=1; x<10; �̷������� ��밡���ϴ�
			for(y=1; y<10; y++) {
				System.out.print(x + "*" + y + "=" + x*y); // ������ ���
 				System.out.print('\t'); // �ϳ��� ������ ��� == spacebar
			}
				System.out.println(); // �� ���� ������ ���� �ٷ� Ŀ���̵�
			}	
		}
	}
