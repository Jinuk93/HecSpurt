package thread.ex10.syncthread;

class Anum {
	String name;
	int num = 0;
	
	Anum(String name) {
		this.name = name;
	}
	
	//�޼��忡 synchronized�� �ָ� �޼��� ��ü ������ ���������� ����ȭ�� �̷������
	//�׷���, �Ϻ� ������ �����ǰ� �ִٸ� �޼��� ��ü�� ����ȭ�� �ϴ� �ͺ���
	//���� ���� ����κи� ����ȭ�ϴ� ���� �ӵ��鿡�� �ٶ����ϴ�
	//�� ���� �ش�κи� ����ȭ�� �Ѵ�
	void accumulate(int val) {
		//����ȭ �� �κ�
		synchronized(this) {
			num += val;			
		}	
		//����ȭ �� �κ�
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