package fileio.ex09.bufferedreader;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
/*
�޸����� �д� Ŭ����
*/
public class StringBufferedReader {
	public static void main(String[] args) throws IOException {
		Reader in = new FileReader("String.txt"); //String.txt �޸����� �д´�
		BufferedReader bIn = new BufferedReader(in);
		
		while(true) {
			String str = bIn.readLine(); // ���پ� �д´�
			if(str == null)
				break;
			System.out.println(str);
		}
	
		bIn.close();
	}
}
