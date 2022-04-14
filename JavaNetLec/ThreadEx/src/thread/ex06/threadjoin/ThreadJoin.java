package thread.ex06.threadjoin;

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
	public class ThreadJoin {
		public static void main(String[] args) {
			Sum sum0 = new Sum(1, 50);
			Sum sum1 = new Sum(51, 100);
			
			Thread t0 = new Thread(sum0);
			Thread t1 = new Thread(sum1);
			t0.start();
			t1.start();
			
			/*
			메인 스레드와 t0,t1 스레드는 별개로 동작. 그러므로, t0,t1스레드를 동작시키자마자
			메인은 다음을 진행하고 프로세스를 마무리한다
			 */
			
			System.out.println("1~100 = " + (sum0.getNum()+sum1.getNum()));
		} 
	}
