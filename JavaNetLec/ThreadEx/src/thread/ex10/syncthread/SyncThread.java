package thread.ex10.syncthread;

class Anum {
	String name;
	int num = 0;
	
	Anum(String name) {
		this.name = name;
	}
	
	//메서드에 synchronized를 주면 메서드 전체 연산이 끝날때까지 동기화가 이루어진다
	//그러나, 일부 변수만 공유되고 있다면 메서드 전체에 동기화를 하는 것보다
	//공유 변수 연산부분만 동기화하는 것이 속도면에서 바람직하다
	//이 때는 해당부분만 동기화를 한다
	void accumulate(int val) {
		//동기화 전 부분
		synchronized(this) {
			num += val;			
		}	
		//동기화 후 부분
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
		Sum sum0 = new Sum(aNum, 1, 5000);
		Sum sum1 = new Sum(aNum, 5001, 10000);
		
		Thread t0 = new Thread(sum0);
		Thread t1 = new Thread(sum1);
		
		t0.start();
		t1.start();
		
		t0.join();
		t1.join();
		
		System.out.println("1~100 accum = " + aNum.num);
	}
}
