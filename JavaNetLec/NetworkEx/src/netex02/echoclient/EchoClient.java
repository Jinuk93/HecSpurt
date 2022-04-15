package netex02.echoclient;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.Socket;
import java.net.UnknownHostException;

/*클라이언트는 서버보다 훨씬 단순하다
1. 서버의 주소(ip, port)를 가지고 소켓 생성
-> 생성자에서 connect를 진행한다
2. 객체가 생성되었다면 연결이 되었으므로 통신이 가능함
3. 서버가 Echo 서버이므로 클라이언트가 보낸 데이터를 그대로 돌려줌
4. close()를 호출하면 연결된 스트림이 해제됨
*/

public class EchoClient {
	public static void main(String[] args) throws UnknownHostException, IOException {
		// 1.  서버에 접속할 소켓(휴대폰 개통) 생성
		// 127.0.0.1은 loop address라고 해서 외부망으로 나가지 말고
		// 자신의 Host 내에서 통신을 하겠다라는 의미의 ip주소
		Socket clientSocket = new Socket("127.0.0.1", 9000);
		
		// 2. 소켓 생성자에서 연결스트림이 생성되었으므로 통신가능
		//	  서버에 전송할 문자열을 입력받기 위해 입력 개체 생성
		InputStreamReader ink = new InputStreamReader(System.in);
		BufferedReader keyboard = new BufferedReader(ink);
		
	}
}
