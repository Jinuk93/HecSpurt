package thread.ex11.syncthread;

class Anum {
	int accuNum = 0;
	int diffNum = 0;
	
	// t0, t1 �� �� ���� ������� accuNum�� ����
	// t2,t3 ������� diffNum�� ����
	// ��, ����ȭ�� �κ��� �� ����
	
	//lockŰ ��ü�� 2�� ����(�ڹ���)
	Object key0 = new Object();
	Object key1 = new Object();
	
	void accumulate(int val) {
		synchronized(key0) {
			accuNum += val;
		}
	}	
		
	void calcDiff(int val) {
		synchronized(key1) {
			diffNum -= val; //��� ��������			
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
		
		//�������� ���ϱ� ���� ������
		Sum sum0 = new Sum(aNum, 1, 5000);
		Sum sum1 = new Sum(aNum, 5001, 10000);
		Thread t0 = new Thread(sum0);
		Thread t1 = new Thread(sum1);
		
		//�������� ���ϱ� ���� ������
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
