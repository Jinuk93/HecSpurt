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
		// 1�ܰ�
		OutputStream out = new FileOutputStream("MyData.bin");
		
		// ��½�Ʈ�� ��ü�� �����ϴ� ���ͽ�Ʈ�� ��ü ���� == ���ͽ�Ʈ�� ����
		DataOutputStream filterOut = new DataOutputStream(out);
	
		// 2�ܰ�
		filterOut.writeInt(365);
		filterOut.writeDouble(3.14); //������ ��� == �����͸� ����?
		
		// 3�ܰ�
		filterOut.close(); // �� �޼���� out.close();�� ��ɵ� ����
	
		/*������ ������ �������� �Ǽ����� �ٽ� �о��*/
		InputStream in = new FileInputStream("MyData.bin");
		DataInputStream filterIn = new DataInputStream(in);
		
		int num = filterIn.readInt();
		double dNum = filterIn.readDouble();
		
		filterIn.close();
		
		System.out.println("int = " + num);
		System.out.println("double = " + dNum);

	}
}
