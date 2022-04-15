package net.ex05.multithreadserver;

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

/*
[멀티스레드 동기 서버]
1) 장점 : 실시간으로 여러 클라이언트에 대응할 수 있다.
2) 단점 : 클라이언트의 증가에 따라 스레드도 증가한다.
         스레드 증가 -> 스케쥴링에 영향
         -> Conext Switching이 많이 발생
         -> 반응속도가 저하된다
         (Apache Server의 특징)
*/
public class MultiThreadEchoServer {
	final static int PORT = 9000;
	
	public static void main(String[] args) {
		try {
			//1) 접속 대기 소켓 생성(클라이언트의 접속을 받아서 새로운 소켓과 연결해주는 역할)
			ServerSocket serverSocket = new ServerSocket(PORT);
			
			//2) 대기 소켓은 accept()를 호출하고 기다리고 있다.
			//   클라이언트가 접속하면 accept()는 클라이언트와 연결된
			//   새로운 소켓을 반환하게 된다.
			//   이때 이 소켓을 통해 클라이언트와 통신을 담당할 스레드 객체를 생성한다
			//   "메인 스레드"는 이 연결처리 후 스레드 객체 할당 작업을 계속 반복한다
			while(true) {
				System.out.println();
				System.out.println("mainThread - Wait client...");
				Socket clientSocket = serverSocket.accept();
				// 스레드 객체에 클라이언트와 연결된 통신 소켓을 전달한다.
				// 클라이언트와 통신을 "에코스레드"에 전담시키기 위해서				
				// 어떤 클라이언트가 접속했는지 정보 확인
				InetAddress inetAddr = clientSocket.getInetAddress();
				System.out.println("Connect " + inetAddr.getHostAddress());
				System.out.println("Run EchoThread!");
				EchoThread echoThread = new EchoThread(clientSocket, inetAddr);
				echoThread.start();				
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}

class EchoThread extends Thread{
	
	private Socket socket;
	private InetAddress inetAddr;
	
	EchoThread(Socket socket, InetAddress inetAddr){
		this.socket = socket;
		this.inetAddr = inetAddr;
	}

	@Override
	public void run() {
		try {				
			//1) 송수신 스트림 얻기
			OutputStream out = socket.getOutputStream();
			OutputStreamWriter outW = new OutputStreamWriter(out);
			PrintWriter pw = new PrintWriter(outW);
			
			InputStream in = socket.getInputStream();
			InputStreamReader inR = new InputStreamReader(in);
			BufferedReader br = new BufferedReader(inR);
			
			//2) 반복적인 echo 기능을 수행하기 위해 반복문 사용
			while(true) {
				// 클라이언트가 보내온 데이터 수신
				String line = br.readLine();
				if(line == null) {
					System.out.println("Disconnect Client " + 
									inetAddr.getHostAddress());
					break;
				}
				System.out.println("Received " + inetAddr.getHostAddress() +
									" Data : " + line);
				//클라이언트로 echo 전송
				pw.println(line);
				pw.flush();
			}
			
			//3) 연결이 끊어지면 모든 스트림 해제
			br.close();
			pw.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}

	}	
}















