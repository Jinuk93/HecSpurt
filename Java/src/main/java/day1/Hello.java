/*
exam 2-1. Hello �ڹ� ���α׷��� �⺻ ���� 
*/
package day1;

public class Hello {

	public static int sum(int n, int m) { //int n, int m�� �Ű�����
										  // �Ű����� == �μ� == parameter == argument
		return n + m ; // ȣ���� ������ ���� ����
					   // return ���� ������ ����, sum �޼ҵ� ���� ����ȴ� (�ؿ� �޼ҵ尡 �ִ���)
}
	public static void main(String[] args) { // Ŭ���� ���� ��, main() �޼ҵ尡 �켱������ ����ȴ�
		int i = 20; // 20�� ���ͷ� ���
		int s; // int �� data type�̰�, int�� ������ Ÿ���̴�
		char a; // char '�ϳ���' ������ type�̰�, ''(�̱� ����ǥ)�� ����. �� ���ڿ��� String type
	
		s = sum(i, 10); // sum()�޼ҵ带 ȣ���Ѵ� -> return �޼ҵ带 ���� ���� �޾ƿ´�.
		a = '?';
		System.out.println(a); // ���� "?"ȭ�� ���
		System.out.println("Hello"); // "Hello" ���ڿ� ȭ�����, String ���ڿ� Ÿ���� ������
		System.out.println(s); // ���� s �� ȭ�� ���
	}
}