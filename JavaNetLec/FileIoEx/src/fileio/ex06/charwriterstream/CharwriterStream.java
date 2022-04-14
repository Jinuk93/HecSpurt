package fileio.ex06.charwriterstream;

import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;

/*
2����, ���ڿ� ���·� ������ϴ��� ���� �ɼ��� �ٸ���
1�ܰ� �� ��Ʈ�� �����Ѵ�. ��, ���ڿ� �����̹Ƿ� ���Ŀ� �´� Ŭ���� ��ü�� �����Ѵ�
2�ܰ�, �����
3�ܰ�, ��Ʈ�� �ݱ�
*/
public class CharwriterStream {
	public static void main(String[] args) throws IOException {
		//1�ܰ� <����>
		Writer out = new FileWriter("My.txt"); //txtŸ���� My��� ���ϸ����� �Ʒ��� ���� ����Ѵ�
		
		//2�ܰ� <����ϰ�>
		out.write('A');
		out.write('B');
		out.write("HongGilDong");

		//3�ܰ� <�ݴ´�>
		out.close();
	}
}
