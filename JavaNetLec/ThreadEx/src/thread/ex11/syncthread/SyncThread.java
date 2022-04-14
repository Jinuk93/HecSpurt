package thread.ex11.syncthread;

class Anum {
	int accuNum = 0;
	int diffNum = 0;
	
	// t0, t1 이 두 개의 스레드는 accuNum을 공유
	// t2,t3 스레드는 diffNum을 공유
	// 즉, 동기화할 부분이 두 군데
	
	//lock키 객체를 2개 생성(자물쇠)
	Object key0 = new Object();
	Object key1 = new Object();
	
	void accumulate(int val) {
		synchronized(key0) {
			accuNum += val;
		}
	}	
		
	void calcDiff(int val) {
		synchronized(key1) {
			diffNum -= val; //계속 누적뺄셈			
		}
	}
}
class Minus implements Runnable {

	Anum aNum;
	int start, end;
	
	Minus(Anum aNum, int start, int end) {
		this.aNum = aNum;
		this.start = start;
		this.end = end;
	}
	@Override
	public void run() {
		for(int i=start; i<=end; i++) 
			aNum.calcDiff(i);
	}	
}
class Sum implements Runnable {

	Anum aNum;
	int start, end;
	
	Sum(Anum aNum, int start, int end) {
		this.aNum = aNum;
		this.start = start;
		this.end = end;
	}
	@Override
	public void run() {
		for(int i=start; i<=end; i++) 
			aNum.accumulate(i);
	}	
}

public class SyncThread {
	public static void main(String[] args) throws InterruptedException {
		Anum aNum = new Anum();
		
		//누적합을 구하기 위한 스레드
		Sum sum0 = new Sum(aNum, 1, 5000);
		Sum sum1 = new Sum(aNum, 5001, 10000);
		Thread t0 = new Thread(sum0);
		Thread t1 = new Thread(sum1);
		
		//누적차를 구하기 위한 스레드
		Minus minus0 = new Minus(aNum, 1, 5000);
		Minus minus1 = new Minus(aNum, 5001, 10000);
		Thread t2 = new Thread(minus0);
		Thread t3 = new Thread(minus1);
		
		
		t0.start();
		t1.start();
		t2.start();
		t3.start();
		
		t0.join();
		t1.join();
		t2.join();
		t3.join();
		
		System.out.println("1~100 accum = " + aNum.accuNum);
		System.out.println("1~100 accum = " + aNum.diffNum);
	}
}
