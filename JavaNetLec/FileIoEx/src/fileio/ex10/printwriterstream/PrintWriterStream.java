package fileio.ex10.printwriterstream;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.Scanner;

public class PrintWriterStream {
	public static void main(String[] args) throws IOException {
		Writer out = new FileWriter("print.txt");
		BufferedWriter bOut = new BufferedWriter(out);
		PrintWriter pOut = new PrintWriter(bOut);
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("What's Your Name >>  ");
		String name = sc.next();
		System.out.print("What's Your Age >>  ");
		int age = sc.nextInt();
		System.out.print("What's Your Height >>  ");
		float height = sc.nextFloat();
		System.out.print("What's Your Weight >>  ");
		float weight = sc.nextFloat();
		
		pOut.print("My Name is " + name + "\n");
		pOut.println();
		pOut.println();
		pOut.printf("My Age is %03d\n", age);
		pOut.printf("My Height is %.2f\n", height);
		pOut.printf("My Weight is %.2f\n", weight);
		
		
		pOut.close();
		sc.close();
	}
}










