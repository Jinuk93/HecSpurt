package fileio.ex10.printwriterstream;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.Scanner;

/*
*/
public class PrintWriterStream {
	public static void main(String[] args) throws IOException {
		Writer out = new FileWriter("print.txt");
		BufferedWriter bOut = new BufferedWriter(out);
		PrintWriter pOut = new PrintWriter(bOut);
	
		Scanner sc = new Scanner(System.in);
		
		System.out.println("What's your name >>");
		String name = sc.next();
		System.out.println("What's your age >>");
		int age = sc.nextInt();
		System.out.println("What's your height >>");
		float height = sc.nextFloat();
		System.out.println("What's your weight >>");
		float weight = sc.nextFloat();

		pOut.print("My name is " + name + "\n");
		pOut.println();
		pOut.println();
		pOut.printf("My age is %02d\n", age);
		pOut.printf("My height is %.2f\n", height);
		pOut.printf("My weight is %.2f\n", weight);
		
		pOut.close();
		sc.close();
	}
}
