package jdbc.ex01.jdbccreate;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class JdbcCreate {
	// 1. Oracle에 접속하기 위한 클래스 객체를 메모리에 로딩
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		// 2. 오라클 서버 접속 주소, 계정
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "bitjava";
		String pass = "bitjava";
		
		try {
			// 3. 오라클 서버 접속 객체 생성
			Connection con = DriverManager.getConnection(url, id, pass);
			
			// 4. sql 쿼리문을 실행하기 위한 객체 생성
			Statement statemt = con.createStatement();
			
			// 5. sql문 작성
			String strCreate = "CREATE TABLE dept(\r\n"
							+ "  dno VARCHAR2(2),\r\n"
							+ "  dname VARCHAR2(14),\r\n"
							+ "  loc VARCHAR2(8),\r\n"
							+ "  director VARCHAR2(4)\r\n"
							+ ")";
			
			// 6. 실행
			// cnt는 몇개 행이 적용되었느냐?
			int cnt = statemt.executeUpdate(strCreate);
			System.out.println("result : " + cnt);
			
			// 7. 데이터 삽입
			String strInsert = "INSERT INTO dept(dno, dname, loc)\r\n"
							+ "  VALUES('01', '개발', '서울')";
			cnt = statemt.executeUpdate(strInsert);
			System.out.println("result : " + cnt);
			
			// 8. dept의 pk 제약조건 설정
			String strAlter = "ALTER TABLE dept\r\n"
					+ " ADD CONSTRAINT dept_dno_pk PRIMARY KEY(dno)";
			cnt = statemt.executeUpdate(strAlter);
			System.out.println("result : " + cnt);
			
			// 9. 객체 해제
			statemt.close();
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}








