package fileio.ex07.charreaderrstream;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;

/*
 
*/
public class CharReaderStream {
	public static void main(String[] args) throws IOException {
		//1�ܰ�
		Reader in = new FileReader("My.txt");
		
		//2�ܰ�
		char[] cBuf = new char[10];
		int readCnt = 0;
		readCnt = in.read(cBuf, 0, cBuf.length);
		String str = new String(cBuf);
		System.out.println(str);
		System.out.println("read Bytes : " + readCnt);
		
		//3�ܰ�
		in.close();
	}
}