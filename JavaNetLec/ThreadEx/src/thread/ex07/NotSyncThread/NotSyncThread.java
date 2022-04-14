package thread.ex07.NotSyncThread;

class Anum {
	static int num = 0;
	
	
	//싱크로나이즈드는 동시접근을 막는다 == 메서드 내에 여러개 스레드의 동시접근을 막는다
	//따라서, num += val 연산이 끝나서 메서드가 리턴되기 전까지는 다른 스레드로 제어권이 넘어가지 않는다
	//즉, 컨텍스트 스위칭이 일어나지 않는다
	// 메서드의 한번에 1개의 스레드 연산을 보장해준다
	// 정리(synchronized) : 동시접근막는다 -> 다른 스레드로 제어권이 안넘어감 -> 1개의 스레드연산 보장
	static synchronized void accumulate(int val) {
		num += val;
	}
}

class Sum implements Runnable {
	int start, end;
	
	Sum(int start, int end) {
		this.start = start;
		this.end = end;
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
			Anum.accumulate(i);
		}
	}
	public class NotSyncThread {
		public static void main(String[] args) throws InterruptedException {
			Sum sum0 = new Sum(1, 50);
			Sum sum1 = new Sum(51, 100);
			
			Thread t0 = new Thread(sum0);
			Thread t1 = new Thread(sum1);
			
			t0.start();
			t1.start();
			
			t0.join();
			t1.join();
			
			System.out.println("1~100 accum = " + Anum.num);
			}
		}
