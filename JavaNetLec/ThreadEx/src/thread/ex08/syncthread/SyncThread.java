package thread.ex08.syncthread;

class Sum implements Runnable {

	static int num = 0;
	int start, end;
	
	Sum(int start, int end) {
		this.start = start;
		this.end = end;
	}
	
	void accumulate(int val) {
		num += val;
	}
	
	/*
	 run()은 스레드 2개가 각각 별개로 호출하는 메서드
	 하지만, accumulate() 내부에서는 num이라는 static 변수를
	 스레드가 동시에 접근할 수 있다.
	 이렇게 공유되는 변수는 값이 왜곡될 위험이 존재한다
	 그러므로, 이런 공유변수의 값의 왜곡을 막는 동기화 기법이 필요하다 
	 */
	
	@Override
	public void run() {
		for(int i=start; i<=end; i++) 
			accumulate(i);
	}
	
}

public class SyncThread {
	public static void main(String[] args) throws InterruptedException {
		Sum sum0 = new Sum(1, 50);
		Sum sum1 = new Sum(51, 100);
		
		Thread t0 = new Thread(sum0);
		Thread t1 = new Thread(sum1);
		
		t0.start();
		t1.start();
		
		t0.join();
		t1.join();
		
		System.out.println("1~100 accum = " + Sum.num);
	}
}
