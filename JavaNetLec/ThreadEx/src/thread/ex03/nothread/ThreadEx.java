package thread.ex03.nothread;

class Study extends Thread {
	
	//source -> implement���� Thread�� run()�� üũ
	@Override
	public void run() {
		for(int i=0; i<10; i++) {
			System.out.println("study...");
			try {
				Thread.sleep(300);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
}
class Music extends Thread {

	//source -> implement���� Thread�� run()�� üũ
	@Override
	public void run() {
		for(int i=0; i<10; i++) {
			System.out.println("music...");
			try {
				Thread.sleep(300);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
}
public class ThreadEx {
	public static void main(String[] args) {
		Study study = new Study();
		Music music = new Music();
		
		study.start(); //start�� �ϸ� �����尡 ����ȴ�, �����尡 ���� �������̵� �� run�� ����
		music.start();
	}
}
