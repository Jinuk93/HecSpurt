package fileio.ex08.bufferedwriter;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.Scanner;
/*
문자열 메모장 만들기
*/
public class StringBufferedWriter {
	public static void main(String[] args) throws IOException {
		Writer out = new FileWriter("String.txt");
		BufferedWriter bOut = new BufferedWriter(out);
		Scanner sc = new Scanner(System.in);
		
		while(true) {
			System.out.println("input >> ");
			String str = sc.next();
			if(str.equals("exit"))
				break;
			bOut.write(str);
			bOut.newLine();
		}		
		bOut.close();
		sc.close();
	}
}
