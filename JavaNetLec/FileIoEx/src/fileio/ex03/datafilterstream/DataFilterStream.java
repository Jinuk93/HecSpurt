package fileio.ex03.datafilterstream;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class DataFilterStream {
	public static void main(String[] args) throws IOException {
		// 1단계
		OutputStream out = new FileOutputStream("MyData.bin");
		
		// 출력스트림 객체와 결합하는 필터스트림 객체 생성 == 필터스트림 생성
		DataOutputStream filterOut = new DataOutputStream(out);
	
		// 2단계
		filterOut.writeInt(365);
		filterOut.writeDouble(3.14); //필터의 기능 == 데이터를 저장?
		
		// 3단계
		filterOut.close(); // 이 메서드는 out.close();의 기능도 포함
	
		/*위에서 저장한 정수값과 실수값을 다시 읽어보자*/
		InputStream in = new FileInputStream("MyData.bin");
		DataInputStream filterIn = new DataInputStream(in);
		
		int num = filterIn.readInt();
		double dNum = filterIn.readDouble();
		
		filterIn.close();
		
		System.out.println("int = " + num);
		System.out.println("double = " + dNum);

	}
}
