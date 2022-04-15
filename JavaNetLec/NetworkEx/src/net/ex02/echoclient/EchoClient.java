package net.ex02.echoclient;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.UnknownHostException;

/*
클라이언트는 서버보다 훨씬 단순하다
1) 서버의 주소(ip, port)를 가지고 소켓 생성
  => 생성자에서 connect를 진행함
2) 객체가 생성되었다면 연결이 되었으므로 통신이 가능함
3) 서버가 Echo서버이므로 클라이언트가 보낸 데이터를 그대로 돌려줌
4) close()를 호출하면 연결된 스트림이 해제됨
*/
public class EchoClient {
	public static void main(String[] args) throws UnknownHostException, IOException {
		// 1) 서버에 접속할 소켓 생성(휴대폰 개통)
		// 127.0.0.1은 loop address라고 해서 외부망으로 나가지 말고
		// 자신의 Host내에서 통신을 하겠다라는 의미의 ip주소
		Socket clientSocket = new Socket("127.0.0.1", 9000);
		
//		2) 소켓 생성자에서 연결스트림이 생성되었으므로 통신가능
//           서버에 전송할 문자열을 입력받기 위해 입력 객체 생성
		InputStreamReader ink = new InputStreamReader(System.in);
		BufferedReader keyboard = new BufferedReader(ink);
		
//		3) 소켓 객체로부터 송수신 스트림 얻기
		OutputStream out = clientSocket.getOutputStream();
		OutputStreamWriter outW = new OutputStreamWriter(out);
		PrintWriter pw = new PrintWriter(outW);
		
		InputStream in = clientSocket.getInputStream();
		InputStreamReader inR = new InputStreamReader(in);
		BufferedReader br = new BufferedReader(inR);
		
//		4) 사용자가 입력한 데이터를 서버로 전송하고,
//           서버가 echo한 데이터를 수신해서 콘솔에 보여준다.
//           이것을 quit가 입력되기 전까지 반복한다.
		while(true) {
			// 사용자 입력
			System.out.print("input >> ");
			String line = keyboard.readLine();
			if(line.equals("quit")) {
				System.out.println("Client Ended!");
				break;
			}
			// 서버로 전송
			System.out.println("Server Sended : " + line);
			pw.println(line);
			pw.flush();
			
			// 서버의 echo데이터 수신
			String echo = br.readLine();
			if(echo == null) {
				System.out.println("Server Ended!");
				break;
			}
			System.out.println("Received Server : " + echo);
		}
		
//		5) 스트림 연결 종료
		pw.close();
		br.close();
	}
}









