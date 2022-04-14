package thread.ex03.nothread;

class Study extends Thread {
	
	//source -> implement에서 Thread의 run()을 체크
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

	//source -> implement에서 Thread의 run()을 체크
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
		
		study.start(); //start를 하면 쓰레드가 실행된다, 쓰레드가 위의 오버라이드 된 run을 실행
		music.start();
	}
}
