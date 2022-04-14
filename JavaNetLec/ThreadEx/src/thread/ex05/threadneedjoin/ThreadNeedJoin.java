package thread.ex05.threadneedjoin;

class Sum implements Runnable {

	int num=0;
	int start, end;
	
	Sum(int start, int end) {
		this.start = start;
		this.end = end;
	}
	
	@Override
	public void run() {
		for(int i=start; i<=end; i++) {
			num += i;
		}
	}
	public int getNum() {
		return this.num;
	}
}
	public class ThreadNeedJoin {
		public static void main(String[] args) {
			Sum sum0 = new Sum(1, 50);
			Sum sum1 = new Sum(51, 100);
			
			Thread t0 = new Thread(sum0);
			Thread t1 = new Thread(sum1);
			t0.start();
			t1.start();
			
			//t0, t1 스레드의 동작이 마칠 때까지 메인스레드 집에보내면 안된다
			/*첫번째 방법 sleep으로 대기시간을 늘린다. 단, 성능이 좋지못하다 비추천방법
			 try {
			 	Thread.sleep(10);
			 }catch( InterruptedException e) {
			 	e.printStackTrace();
			 }
			 */
			//두번째 방법 : 스레드 객체내의 run()이 리턴하면 jvm은 신호받게된다.
			//이 신호를 대기하는 join()을 사용하면 된다
			//main 스레드는 join()에서 신호가 올때까지 대기상태
			t0.join(); //t0,t1 둘 중 누가 빨리 끝나는지 모르므로, 둘 다 대기해!
			t1.join(); 
			
			
			System.out.println("1~100 = " + (sum0.getNum()+sum1.getNum()));
		} 
	}
