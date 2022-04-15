package netex04.fileclient;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.Scanner;

/*
1. ������ ����
2. ����ڷκ��� ���ϸ� �Է�
3. �Է¹��� ���ϸ� ������ ����
4. ���ο� ���ϸ��� ���ؼ� ��������
5. ���ۿϷ�Ǹ� ���� ���� 
*/
public class FileClient {
	public static void main(String[] args) {
		String ip = "127.0.0.1";
		int port = 9000;
		try {
			// 1. ������ �ּҸ� �ο��� ���� ����(������� �Ϸ�)
			Socket clientSocket = new Socket(ip, port);
			
			// 2. ����ڷκ��� ���ϸ��� �Է¹ޱ� ���� Ű���� �Է� ��ü ����
			Scanner sc = new Scanner(System.in);
			
			// 3. ������ ����� ���� ����� stream ��ü ���
			InputStream in = clientSocket.getInputStream();
			DataInputStream dIn = new DataInputStream(in);
			
			OutputStream out = clientSocket.getOutputStream();
			DataOutputStream dOut = new DataOutputStream(out);
			
			// 4. �����κ��� �ٿ�ε� �� ���ϸ� �Է�
			System.out.println("Input download fileName >> ");
			String fileName = sc.nextLine();
			
			// 5. ������ ���ϸ� ����
			dOut.writeUTF(fileName);
			System.out.println("Send fileName : " + fileName);
			
			// 6. ������ ���ϸ����� �����ϱ� ���� ���� ��Ʈ�� ����
			String newFileName = "new_" + fileName;
			FileOutputStream outFile = new FileOutputStream(newFileName);
			
			// 7. �����κ��� ���� ������ ���� �� ���Ͽ� ����
			int cnt = 0;
			while(true) {
				int data = dIn.read();
				if(data == -1) {
					System.out.println("Complete Download File!");
					break;
				}
				outFile.write(data);
				System.out.println("Receiving..." + cnt++);
			}
			
			// 8. Ű����/����/��� ��Ʈ�� ��� ����
			sc.close();
			outFile.close();
			dIn.close();
			dOut.close();
			
		}catch (UnknownHostException e) {
			e.printStackTrace();
		}catch (IOException e) {
			e.printStackTrace();
		}
	}
}
