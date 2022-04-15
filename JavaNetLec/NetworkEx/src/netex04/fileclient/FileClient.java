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
1. 서버에 접속
2. 사용자로부터 파일명 입력
3. 입력받은 파일명 서버로 전송
4. 새로운 파일명을 정해서 파일저장
5. 전송완료되면 접속 해제 
*/
public class FileClient {
	public static void main(String[] args) {
		String ip = "127.0.0.1";
		int port = 9000;
		try {
			// 1. 서버의 주소를 부여한 소켓 생성(연결까지 완료)
			Socket clientSocket = new Socket(ip, port);
			
			// 2. 사용자로부터 파일명을 입력받기 위한 키보드 입력 객체 생성
			Scanner sc = new Scanner(System.in);
			
			// 3. 서버와 통신을 위한 양방향 stream 객체 얻기
			InputStream in = clientSocket.getInputStream();
			DataInputStream dIn = new DataInputStream(in);
			
			OutputStream out = clientSocket.getOutputStream();
			DataOutputStream dOut = new DataOutputStream(out);
			
			// 4. 서버로부터 다운로드 할 파일명 입력
			System.out.println("Input download fileName >> ");
			String fileName = sc.nextLine();
			
			// 5. 서버로 파일명 전송
			dOut.writeUTF(fileName);
			System.out.println("Send fileName : " + fileName);
			
			// 6. 서버가 파일명으로 저장하기 위한 파일 스트림 연결
			String newFileName = "new_" + fileName;
			FileOutputStream outFile = new FileOutputStream(newFileName);
			
			// 7. 서버로부터 파일 데이터 수신 후 파일에 저장
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
			
			// 8. 키보드/파일/통신 스트림 모두 해제
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
