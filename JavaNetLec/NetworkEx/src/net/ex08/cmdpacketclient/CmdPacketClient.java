package net.ex08.cmdpacketclient;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket;

/*
[Application Layer의 약속을 정의(프로토콜 정의=패킷설계)]
패킷 설계
1) 고정길이
2) 구분자방식              - select
3) 고정길이헤더+가변길이데이터
4) 포맷(json, xml, ...)

패킷설계
cmd|값0|값1
cmd는 해당 패킷이 어떤 의미인지를 알려주는 용도
cmd에 따라 값0과 값1의 처리가 달라질 수 있다.
ex)
긴급알림 :  A|코로나 조심하세요
위치데이터 : P|253.34|345.23|553.2   위도|경도|고도
캐릭터아이템 : I|엑스칼리버|물약|물약|포션|단검
주기위치전송 : P|I|253.34|345.23|553.2  Position->Interval
긴급위치전송 : P|E|253.34|345.23|553.2  Position->Emergency
*/
/*
이곳에서는 사칙연산을 서버와 클라이언트간에 약속으로 정해서
클라이언트는 연산종류와 2개의 값을 서버로 전송
서버는 수신된 데이터를 토대로 결과를 계산해서 클라이언트로 전송
+|35|24   => 서버로 전송
59        => 서버는 응답을 클라이언트로 전송
*|3|4   => 서버로 전송
12        => 서버는 응답을 클라이언트로 전송
*/


public class CmdPacketClient {
	final static String IP = "127.0.0.1";
	final static int PORT = 9000;
	
	public static void main(String[] args) {
		try {
			Socket socket = new Socket(IP, PORT);
			
			InputStreamReader inK = new InputStreamReader(System.in);
			BufferedReader keyboard = new BufferedReader(inK);
			
			OutputStream out = socket.getOutputStream();
			OutputStreamWriter outW = new OutputStreamWriter(out);
			PrintWriter pw = new PrintWriter(outW);
			
			InputStream in = socket.getInputStream();
			InputStreamReader inR = new InputStreamReader(in);
			BufferedReader br = new BufferedReader(inR);
			
			while(true) {
				System.out.print("input operator(+ - * / quite) >> ");
				String cmd = keyboard.readLine();
				if(cmd.equals("quit")) {
					System.out.println("Client Ended!");
					break;
				}
				System.out.print("Input First Number >> ");
				int num0 = Integer.parseInt(keyboard.readLine());
				System.out.print("Input Second Number >> ");
				int num1 = Integer.parseInt(keyboard.readLine());
				
				// 패킷 구성
				String packet = String.format("%s|%d|%d", cmd, num0, num1);
				System.out.println("Send Packet : " + packet);
				pw.println(packet);
				pw.flush();
				
				// 결과값 수신
				String result = br.readLine();
				System.out.println("Result = " + result);
				System.out.println();
			}
			
			keyboard.close();
			pw.close();
			br.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}

















