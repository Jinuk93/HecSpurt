package netex01.echoserver;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;

/*������ ���񽺸� �����ϴ� ���μ����� ���´´�.
TCP > UDP
1. ������ ��ȭ�Ⱑ �ʿ��ϴ�(���� ����)
2. ������ �ּҸ� ������(�ּҸ� �ο�(�ּҿ� ������ ���´�) - bind)
3. ���� ��û�ϴ� Ŭ���̾�Ʈ�� �޾��־�� �Ѵ�(accept)
4. ��û�� �޾Ƶ��̸� �ۼ��� ��Ʈ���� ����ȴ�
5. ��Ʈ���� ����Ǹ� ����� �����ϴ�
6. close�� ȣ���ϸ� ��Ʈ���� �����ȴ�*/

public class EchoServer {
	public static void main(String[] args) throws IOException {
		// 1. ���� ����(��ȭ�� ����)
		// ip/port�� �ʿ��ѵ�,
		// ip�� ���� host�� ip�� �ڵ��Ҵ��Ѵ�
		// ��� port�� ������� �Ѵ� -> �׷��� ���Ƿ� 9000���� �������
		ServerSocket serverSocket = new ServerSocket(9000);
				//serverSocket�� ������� ����
		// 2. Ŭ���̾�Ʈ�� ������ ��ٸ��� accept
		// accept()�� ȣ���ϸ� ����ϰ� �ִٰ� Ŭ���̾�Ʈ�� ����Ǹ�
		// accept()�� Ŭ���̾�Ʈ�� ����� ���ο� ��������� ��ȯ�Ѵ�
				//conSocket�� ���ο� ��������� ��ȯ�Ȱ��̴�.(���� ��ż���)
		System.out.println("Wait client...");
		Socket conSocket = serverSocket.accept();
		
		// 2-1. ������ ���������� Ȯ���Ѵ�
		InetAddress inetAddr = conSocket.getInetAddress();
		System.out.println(inetAddr.getHostAddress() + " connect!");
		
		
		// 3. ����������� ����� �� �� �ִ�
		// ���� ��Ʈ�� 
		OutputStream out = conSocket.getOutputStream();
		OutputStreamWriter outW = new OutputStreamWriter(out);
		PrintWriter pw = new PrintWriter(outW);
	
		// ���� ��Ʈ��
		InputStream in = conSocket.getInputStream();
		InputStreamReader inR = new InputStreamReader(in);
		BufferedReader br = new BufferedReader(inR);
	
		//4. �ۼ���
		while(true) {
			// Ŭ���̾�Ʈ�� ������ �����͸� ��ٸ��� �����ϸ� ���ڿ��� ��ȯ
			String line = br.readLine();
			
			//���� �����͸� ��ٸ��ٰ� null�� ��ȯ�Ǿ��ٸ� ������ ������ ����
			if(line == null) {
				System.out.println("Client Disconnect!");
				break;
			}
			
			System.out.println("Received : " + line);
			pw.println(line); // Ŭ���̾�Ʈ�� �׷��� ������
			pw.flush();		  // ���ۿ� ����� �����͸� ��� �����ض�
		}
		
		//5. ��Ʈ�� ����
		pw.close();
		br.close();
		System.out.println("client - server Ended!");
	
	}
	
}
