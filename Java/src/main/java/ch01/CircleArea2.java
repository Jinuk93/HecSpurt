package ch01;

public class CircleArea2 {

	public static void main(String[] args) {
		int x=2, y=10, z=0;
		
		z=x++*2+--y-5+x*(y%2);
		
		System.out.println("z = " +z);
		System.out.println(8>>1);
		
		int opr = 4;
		System.out.println(opr++);
		System.out.println(opr);

	}
}
