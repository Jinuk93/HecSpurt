package fileio.ex09.bufferedreader;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
/*
메모장을 읽는 클래스
*/
public class StringBufferedReader {
	public static void main(String[] args) throws IOException {
		Reader in = new FileReader("String.txt"); //String.txt 메모장을 읽는다
		BufferedReader bIn = new BufferedReader(in);
		
		while(true) {
			String str = bIn.readLine(); // 한줄씩 읽는다
			if(str == null)
				break;
			System.out.println(str);
		}
	
		bIn.close();
	}
}
