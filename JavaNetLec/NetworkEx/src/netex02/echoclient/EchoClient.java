package netex02.echoclient;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
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
		BufferedReader keyboard = new BufferedReader(ink);
		
	}
}
