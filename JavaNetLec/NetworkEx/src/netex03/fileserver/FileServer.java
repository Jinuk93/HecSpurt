package netex03.fileserver;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;

/*
1. Ŭ���̾�Ʈ�� ������ ������ ��û�Ѵ�(���� �̸� ����)
2. ������ �ش� ������ ������ ��, Ŭ���̾�Ʈ�� �����Ѵ�
3. ������ ������ ����� �����Ѵ� 
*/
public class FileServer {
	public static void main(String[] args) {
		try {
			// 1. ���� ��� ���� ����
			ServerSocket serverSocket = new ServerSocket(9000);
			// 2. Ŭ���̾�Ʈ ���� ��� �� ���� ����
			System.out.println("Wait Client...");
			Socket conSocket = serverSocket.accept();
			System.out.println("Connect Client");
			
			// 3. ������ ���� ����� stream�� ��´�
			InputStream in = conSocket.getInputStream();
			DataInputStream dIn = new DataInputStream(in);
			
			OutputStream out = conSocket.getOutputStream();
			DataOutputStream dOut = new DataOutputStream(out);
			
			// 4. Ŭ���̾�Ʈ�� ��û�ϴ� ���ϸ��� �����Ѵ�
			String fileName = dIn.readUTF();
			System.out.println("Request File : " + fileName);
			
			// 5. ��û������ �����Ѵ�
			FileInputStream fIn = new FileInputStream(fileName);
			
			// 6. ��û ������ Ŭ���̾�Ʈ�� �����Ѵ�
			int cnt = 0;
			while(true) {
				int data = fIn.read();
				if(data == -1) {
					System.out.println("Send Complete!");
					break;
				}
				System.out.println("Sending..." +  cnt++);
				dOut.write(data);
			}
			
			// 7. ������ ������ ����/��� ��Ʈ�� ����
			fIn.close();
			dIn.close();
			dOut.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
