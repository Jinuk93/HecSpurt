package fileio.ex02.Bufferfilecopy;

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
/*
���� ����� 3�ܰ�� �����ϴ�
�ٸ� �аų� ������ ��, ���� ũ�� �̻� ���� �õ��ȴ�
���� �ӵ��� �����Ǵ� ȿ���� �ִ�
 */
public class BufferFileCopy {
	public static void main(String[] args) throws IOException {
		
		// 1�ܰ� ��Ʈ�� ����
		InputStream in = new FileInputStream("putty.exe");
		OutputStream out = new FileOutputStream("futty.exe");
		
		// ����
		int copyByte = 0; // ��ü �����Ʈ �о���?(����ߴ�)
		int readLen = 0;  // �ѹ� ���� ��, �󸶳� �о���?
		byte[] buf = new byte[1024]; // ������ �ѹ��� 1024��ŭ �о�帱 �����
		//�ռ����, class���� �������� �̸� ���� �� �ִ� ũ�⸦ �����Ѵ�.
		
		long sTime = System.currentTimeMillis();
		// 2�ܰ�
		while(true) {
			//buf ũ�⸸ŭ �б⸦ �õ��ϵ�, ���� ���� ũ��� readLen���� ������Ѷ�!
			readLen = in.read(buf); //buf�� 1024��ŭ�� ũ��(�迭)
			if(readLen == -1) 
				break;
			// �迭�� ������ġ (�ε��� 0)�������� readLenũ�⸸ŭ �����ض�
			out.write(buf, 0, readLen);
			copyByte += readLen; // ���� �о�帰 ����Ʈ
			System.out.println("copyByte =" + readLen);
		}
		
		long eTime = System.currentTimeMillis();
		
		// 3�ܰ�
		in.close();
		out.close();
		
		System.out.println("Copy Bytes : " + copyByte );
		System.out.println("Copy Times : " + (eTime-sTime));
	}
}
