package thread.ex03.threadex;

class Study extends Thread{

	@Override
	public void run() {
		for(int i=0;i<10;i++) {
			System.out.println("study...");
			try {
				Thread.sleep(300);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}	
}

class Music extends Thread{

	@Override
	public void run() {
		for(int i=0;i<10;i++) {
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
		study.start();	// study 스레드가 run()을 동작시킨다.
		music.start();	// music 스레드가 run()을 동작시킨다.
	}
}









