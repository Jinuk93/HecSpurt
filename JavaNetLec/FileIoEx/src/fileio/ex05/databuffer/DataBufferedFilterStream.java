package fileio.ex05.databuffer;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/*

*/
public class DataBufferedFilterStream {
	public static void main(String[] args) throws IOException {
		
		OutputStream out = new FileOutputStream("MyData.bin");
		BufferedOutputStream bOut = new BufferedOutputStream(out);
		DataOutputStream dOut = new DataOutputStream(bOut);
		
		dOut.writeInt(9999);
		dOut.writeDouble(1.124);
		dOut.close();
		
		//파일에서 로딩
		InputStream in = new FileInputStream("MyData.bin");
		BufferedInputStream bIn = new BufferedInputStream(in);
		DataInputStream dIn = new DataInputStream(bIn);
		int num = dIn.readInt();
		double dNum = dIn.readDouble();
		dIn.close();
		
		System.out.println("int = " + num);
		System.out.println("double = " + dNum);

	}

}
