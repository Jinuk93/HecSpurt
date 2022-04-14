package fileio.ex01.bytefilecopy;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/*파일 입출력,네트워크 통신 3단계
1단계. 스트림 생성(입,출력 스트림) = open단계
2단계. 파일복사하기
3단계. 읽거나 저장하기 = read/write단계
4단계. 스트림 닫기 = close단계
*/
public class ByteFileCopy {
	public static void main(String[] args) throws IOException {
		//1단계. 스트림생성 = open 단계 과정이 일어난다.
		InputStream in = new FileInputStream("putty.exe"); //입력 스트림 생성
		OutputStream out = new FileOutputStream("aatty.exe"); //출력 스트림 생성
		
		int copyByte = 0; // 얼마나 읽었느냐 ?
		int byteData = 0; // 1바이트를 저장할 저장소
		/*
		 * byteData는 1바이트를 저장할 저장소라고 한다.
		 * 왜 1바이트를 저장하느냐?
		 * 읽을 함수의 데이터가 없을 때, -1을 반환하는데, -1을 저장하기 위해서이다
		 */	
		
		// 시간 측정을 위해 계산해보자
		long sTime = System.currentTimeMillis();
		System.out.println("copy file start!");
		
		// 2단계. 파일 복사하기
		while(true) {
			byteData = in.read();
			if(byteData == -1)
				break;
			out.write(byteData);
			copyByte++;
		}
		System.out.println("copy file end!");
		long eTime = System.currentTimeMillis();
	 
		// 3단계. 스트림 닫기
		in.close();
		out.close();
		
		System.out.println("copy Byte : " + copyByte);
		System.out.println("copy Time : " + (eTime-sTime));
	}
}
