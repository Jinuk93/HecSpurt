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
Buffer(�ӽ������)�� �����ϴ� filter Ŭ����
 */

public class BufferedFileCopy {
	public static void main(String[] args) throws IOException {
		//1�ܰ� : ��Ʈ�� ����(��,���)
		InputStream in = new FileInputStream("putty.exe");
		OutputStream out = new FileOutputStream("butty.exe");
		
		//���۸� �����ϴ� ����Ŭ����
		BufferedInputStream bIn = new BufferedInputStream(in);
		BufferedOutputStream bOut = new BufferedOutputStream(out);

		// 1byte�� ������� �ص� ���۰� �����ϹǷ� �������� �ξ� ������
		int copyByte = 0;
		int byteData = 0;
		
		// ���۸� ���� �ӵ��� �󸶳� �����Ǵ��� �ð������� �غ���
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
