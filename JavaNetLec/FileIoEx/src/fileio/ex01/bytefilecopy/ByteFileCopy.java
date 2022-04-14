package fileio.ex01.bytefilecopy;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/*���� �����,��Ʈ��ũ ��� 3�ܰ�
1�ܰ�. ��Ʈ�� ����(��,��� ��Ʈ��) = open�ܰ�
2�ܰ�. ���Ϻ����ϱ�
3�ܰ�. �аų� �����ϱ� = read/write�ܰ�
4�ܰ�. ��Ʈ�� �ݱ� = close�ܰ�
*/
public class ByteFileCopy {
	public static void main(String[] args) throws IOException {
		//1�ܰ�. ��Ʈ������ = open �ܰ� ������ �Ͼ��.
		InputStream in = new FileInputStream("putty.exe"); //�Է� ��Ʈ�� ����
		OutputStream out = new FileOutputStream("aatty.exe"); //��� ��Ʈ�� ����
		
		int copyByte = 0; // �󸶳� �о����� ?
		int byteData = 0; // 1����Ʈ�� ������ �����
		/*
		 * byteData�� 1����Ʈ�� ������ ����Ҷ�� �Ѵ�.
		 * �� 1����Ʈ�� �����ϴ���?
		 * ���� �Լ��� �����Ͱ� ���� ��, -1�� ��ȯ�ϴµ�, -1�� �����ϱ� ���ؼ��̴�
		 */	
		
		// �ð� ������ ���� ����غ���
		long sTime = System.currentTimeMillis();
		System.out.println("copy file start!");
		
		// 2�ܰ�. ���� �����ϱ�
		while(true) {
			byteData = in.read();
			if(byteData == -1)
				break;
			out.write(byteData);
			copyByte++;
		}
		System.out.println("copy file end!");
		long eTime = System.currentTimeMillis();
	 
		// 3�ܰ�. ��Ʈ�� �ݱ�
		in.close();
		out.close();
		
		System.out.println("copy Byte : " + copyByte);
		System.out.println("copy Time : " + (eTime-sTime));
	}
}
