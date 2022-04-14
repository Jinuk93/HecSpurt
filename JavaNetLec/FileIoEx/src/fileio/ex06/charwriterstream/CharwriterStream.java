package fileio.ex06.charwriterstream;

import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;

/*
2진법, 문자열 형태로 열어야하느냐 등의 옵션이 다르다
1단계 때 스트링 생성한다. 단, 문자열 형식이므로 형식에 맞는 클래스 객체를 생성한다
2단계, 입출력
3단계, 스트림 닫기
*/
public class CharwriterStream {
	public static void main(String[] args) throws IOException {
		//1단계 <쓰고>
		Writer out = new FileWriter("My.txt"); //txt타입의 My라는 파일명으로 아래의 글을 출력한다
		
		//2단계 <출력하고>
		out.write('A');
		out.write('B');
		out.write("HongGilDong");

		//3단계 <닫는다>
		out.close();
	}
}
