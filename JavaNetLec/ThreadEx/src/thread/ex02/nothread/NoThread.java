package thread.ex02.nothread;

class Student {
	public void music() {
		System.out.println("music...");
	}
	public void study() {
		System.out.println("study...");
	}
}
class StudentWork {
	public static void duringCaffe(Student st)  throws InterruptedException {
		for(int i=0; i<20; i++) {
			if(i%2==0) 
				st.study();
			else
				st.music();
			Thread.sleep(500);
			}
		}
	}
public class NoThread {
	public static void main(String[] args) throws InterruptedException  { //쓰레드는 메인메서드를 우선적으로 순서대로 작동한다
		StudentWork.duringCaffe(new Student());
	}
}
