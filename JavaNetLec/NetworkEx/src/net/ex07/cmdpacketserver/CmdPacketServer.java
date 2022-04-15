package net.ex07.cmdpacketserver;

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

public class CmdPacketServer {
	final static int PORT = 9000;
	
	public static String runArithCmd(String[] params) {
		int result = 0;
		String cmd = params[0];
		int num0 = Integer.parseInt(params[1]);
		int num1 = Integer.parseInt(params[2]);
		
		switch(cmd) {
		case "+":
			result = num0 + num1;
			break;
		case "-":
			result = num0 - num1;
			break;
		case "*":
			result = num0 * num1;
			break;
		case "/":
			result = num0 / num1;
			break;
		}
		return result + "";
	}
	
	public static String[] parsePacket(String line) {
		String[] params = line.split("\\|");
		return params;
	}
	
	public static void main(String[] args) {
		try {
			ServerSocket serverSocket = new ServerSocket(PORT);
			
			System.out.println("Wait client...");
			Socket conSocket = serverSocket.accept();
			
			InetAddress inetAddr = conSocket.getInetAddress();
			System.out.println("Connect " + inetAddr.getHostAddress());
			
			OutputStream out = conSocket.getOutputStream();
			OutputStreamWriter outW = new OutputStreamWriter(out);
			PrintWriter pw = new PrintWriter(outW);
			
			InputStream in = conSocket.getInputStream();
			InputStreamReader inR = new InputStreamReader(in);
			BufferedReader br = new BufferedReader(inR);
			
			while(true) {
				// 클라이언트가 보내온 전체 패킷을 수신
				String line = br.readLine();
				if(line == null) {
					System.out.println("Disconnect Client!");
					break;
				}
				System.out.println("Received Data : " + line);
				String[] params = parsePacket(line);
				String result = runArithCmd(params);
				System.out.printf("%s %s %s = %s\n", 
						params[1], params[0], params[2], result);
				
				// 클라이언트로 결과를 전송
				pw.println(result);
				pw.flush();
			}
			
			pw.close();
			br.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}








