package netex02.echoclient;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.UnknownHostException;

/*Ŭ���̾�Ʈ�� �������� �ξ� �ܼ��ϴ�
1. ������ �ּ�(ip, port)�� ������ ���� ����
-> �����ڿ��� connect�� �����Ѵ�
2. ��ü�� �����Ǿ��ٸ� ������ �Ǿ����Ƿ� ����� ������
3. ������ Echo �����̹Ƿ� Ŭ���̾�Ʈ�� ���� �����͸� �״�� ������
4. close()�� ȣ���ϸ� ����� ��Ʈ���� ������
*/

public class EchoClient {
	public static void main(String[] args) throws UnknownHostException, IOException {
		// 1.  ������ ������ ����(�޴��� ����) ����
		// 127.0.0.1�� loop address��� �ؼ� �ܺθ����� ������ ����
		// �ڽ��� Host ������ ����� �ϰڴٶ�� �ǹ��� ip�ּ�
		Socket clientSocket = new Socket("127.0.0.1", 9000);
		
		// 2. ���� �����ڿ��� ���ὺƮ���� �����Ǿ����Ƿ� ��Ű���
		//	  ������ ������ ���ڿ��� �Է¹ޱ� ���� �Է� ��ü ����
		InputStreamReader ink = new InputStreamReader(System.in);
		BufferedReader keyboard = new BufferedReader(ink); //��ĳ�ʸ� ����ص� �ȴ�
		
		// 3. ���� ��ü�κ��� �ۼ��� ��Ʈ�� ���
		OutputStream out = clientSocket.getOutputStream();
		OutputStreamWriter outW = new OutputStreamWriter(out);
		PrintWriter pw = new PrintWriter(outW);
		
		InputStream in = clientSocket.getInputStream();
		InputStreamReader inR = new InputStreamReader(in);
		BufferedReader br = new BufferedReader(inR);
		
		// 4. ����ڰ� �Է��� �����͸� ������ �����ϰ�,
		// ������ echo�� �����͸� �����ؼ� �ֿܼ� �����ش�
		// �̰��� quit�� �ԷµǱ� ������ �ݺ��Ѵ�
		while(true) {
			// ����� �Է�
			System.out.println("input >> ");
			String line = keyboard.readLine();
			if(line.equals("quit")) {
				System.out.println("Client Ended!!");
				break;
			}
			// ������ ����
			System.out.println("Server Sended : " + line);
			pw.println(line);
			pw.flush();
			
			// ������ echo������ ����
			String echo = br.readLine();
			if(echo == null) {
				System.out.println("Server Ended!!");
				break;
			}
			System.out.println("Received Server : " + echo);	
		}
			// 5. ��Ʈ�� ���� ����
			pw.close();
			br.close();
			System.out.println("Client - server Ended!!");
	}
}
