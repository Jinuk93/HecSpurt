package thread.ex01.nothread;
/*
 
*/
//������� ���θ޼��带 �켱������ ������� �۵��Ѵ�
public class NoThread {
	public static void study() throws InterruptedException { // �޼���1
		for(int i=0; i<10; i++) {
			System.out.println("studying in caffe");
			Thread.sleep(500); //�ӵ��� �� �� �ٿ�����, 0.5�ʸ��� ��¹��� ���´�
		}
	}
	public static void music() throws InterruptedException { // �޼���2
		for(int i=0; i<10; i++) {
			System.out.println("hearing the music in caffe");
			Thread.sleep(500); //�ӵ��� �� �� �ٿ�����, 0.5�ʸ��� ��¹��� ���´�
		}
	}
	public static void main(String[] args) throws InterruptedException { //������� ���θ޼��带 �켱������ ������� �۵��Ѵ�
		try {
			study();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		try {
			music();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
}
