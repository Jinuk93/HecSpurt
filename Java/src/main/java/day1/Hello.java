/*
exam 2-1. Hello �ڹ� ���α׷��� �⺻ ���� 
*/
package day1;

public class Hello {

	public static int sum(int n, int m) { //int n, int m�� 
		return n + m ;
	//int n, int m �Ű����� parameter�� �� ���� �� �ִ� ��,�Ű�����==�μ�=parameter=argument
	//return : ȣ���� �����ٰ� ���� ����
	//return ���� �����ԵǸ� sum �޼ҵ�� ����ȴ� ( �ؿ� �޼ҵ���� �� �ִٰ��ϴ���! )
}

	//main() �޼ҵ忡�� ���� ����
	public static void main(String[] args) {
		int i = 20; //20�� ���ͷ� ��� , �ʱ�ȭ ������(������ ����)
		int s; // int �� data type�̴�. int�� ������ Ÿ��
		char a; // char �� ������, ' ' (�̱� ����ǥ), �� ���� String
	
		s = sum(i, 10); // sum() �޼ҵ� ȣ�⿡�� return ������ �޾ƿ�,
		a = '?';
		System.out.println(a); //���� "?"ȭ�� ���
		System.out.println("Hello"); // "Hello" ���ڿ� ȭ�����, String ���ڿ� Ÿ���� ������
		System.out.println(s); // ���� s �� ȭ�� ���
	}
}