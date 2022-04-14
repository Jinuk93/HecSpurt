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
	 run()�� ������ 2���� ���� ������ ȣ���ϴ� �޼���
	 ������, accumulate() ���ο����� num�̶�� static ������
	 �����尡 ���ÿ� ������ �� �ִ�.
	 �̷��� �����Ǵ� ������ ���� �ְ�� ������ �����Ѵ�
	 �׷��Ƿ�, �̷� ���������� ���� �ְ��� ���� ����ȭ ����� �ʿ��ϴ� 
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
