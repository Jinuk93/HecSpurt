package fileio.ex02.Bufferfilecopy;

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
/*
파일 입출력 3단계는 동일하다
다만 읽거나 저장할 때, 일정 크기 이상 많이 시도된다
따라서 속도가 개선되는 효과가 있다
 */
public class BufferFileCopy {
	public static void main(String[] args) throws IOException {
		
		// 1단계 스트림 생성
		InputStream in = new FileInputStream("putty.exe");
		OutputStream out = new FileOutputStream("futty.exe");
		
		// 설정
		int copyByte = 0; // 전체 몇바이트 읽었니?(기록했니)
		int readLen = 0;  // 한번 읽을 떄, 얼마나 읽었니?
		byte[] buf = new byte[1024]; // 파일을 한번에 1024만큼 읽어드릴 저장소
		//앞서배운, class와의 차이점은 미리 읽을 수 있는 크기를 지정한다.
		
		long sTime = System.currentTimeMillis();
		// 2단계
		while(true) {
			//buf 크기만큼 읽기를 시도하되, 실제 읽은 크기는 readLen으로 저장시켜라!
			readLen = in.read(buf); //buf는 1024만큼의 크기(배열)
			if(readLen == -1) 
				break;
			// 배열의 시작위치 (인덱스 0)에서부터 readLen크기만큼 저장해라
			out.write(buf, 0, readLen);
			copyByte += readLen; // 실제 읽어드린 바이트
			System.out.println("copyByte =" + readLen);
		}
		
		long eTime = System.currentTimeMillis();
		
		// 3단계
		in.close();
		out.close();
		
		System.out.println("Copy Bytes : " + copyByte );
		System.out.println("Copy Times : " + (eTime-sTime));
	}
}
