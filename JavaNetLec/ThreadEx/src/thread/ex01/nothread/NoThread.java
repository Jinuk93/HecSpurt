package thread.ex01.nothread;
/*
 
*/
//쓰레드는 메인메서드를 우선적으로 순서대로 작동한다
public class NoThread {
	public static void study() throws InterruptedException { // 메서드1
		for(int i=0; i<10; i++) {
			System.out.println("studying in caffe");
			Thread.sleep(500); //속도를 한 번 줄여보자, 0.5초마다 출력문이 나온다
		}
	}
	public static void music() throws InterruptedException { // 메서드2
		for(int i=0; i<10; i++) {
			System.out.println("hearing the music in caffe");
			Thread.sleep(500); //속도를 한 번 줄여보자, 0.5초마다 출력문이 나온다
		}
	}
	public static void main(String[] args) throws InterruptedException { //쓰레드는 메인메서드를 우선적으로 순서대로 작동한다
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
