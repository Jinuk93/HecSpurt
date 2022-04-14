package fileio.ex04.bufferstream;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/*
Buffer(임시저장소)를 제공하는 filter 클래스
 */

public class BufferedFileCopy {
	public static void main(String[] args) throws IOException {
		//1단계 : 스트림 생성(입,출력)
		InputStream in = new FileInputStream("putty.exe");
		OutputStream out = new FileOutputStream("butty.exe");
		
		//버퍼를 제공하는 필터클래스
		BufferedInputStream bIn = new BufferedInputStream(in);
		BufferedOutputStream bOut = new BufferedOutputStream(out);

		// 1byte씩 입출력을 해도 버퍼가 존재하므로 이전보다 훨씬 빠르다
		int copyByte = 0;
		int byteData = 0;
		
		// 버퍼를 통해 속도가 얼마나 개선되는지 시간측정을 해본다
		long sTime = System.currentTimeMillis();
		
		while(true) {
			byteData = bIn.read();
			if(byteData == -1)
				break;
			bOut.write(byteData);
			copyByte++;	
		}
		
		long eTime = System.currentTimeMillis();
		
		bIn.close();
		bOut.close();
		
		System.out.println("Copy Bytes : " + copyByte);
		System.out.println("Copy Times : " + (eTime-sTime));
	}

}
