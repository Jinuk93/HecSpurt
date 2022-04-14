package thread.ex07.NotSyncThread;

class Anum {
	static int num = 0;
	
	
	//��ũ�γ������� ���������� ���´� == �޼��� ���� ������ �������� ���������� ���´�
	//����, num += val ������ ������ �޼��尡 ���ϵǱ� �������� �ٸ� ������� ������� �Ѿ�� �ʴ´�
	//��, ���ؽ�Ʈ ����Ī�� �Ͼ�� �ʴ´�
	// �޼����� �ѹ��� 1���� ������ ������ �������ش�
	// ����(synchronized) : �������ٸ��´� -> �ٸ� ������� ������� �ȳѾ -> 1���� �����忬�� ����
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
	 run()�� ������ 2���� ���� ������ ȣ���ϴ� �޼���
	 ������, accumulate() ���ο����� num�̶�� static ������
	 �����尡 ���ÿ� ������ �� �ִ�.
	 �̷��� �����Ǵ� ������ ���� �ְ�� ������ �����Ѵ�
	 �׷��Ƿ�, �̷� ���������� ���� �ְ��� ���� ����ȭ ����� �ʿ��ϴ� 
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
