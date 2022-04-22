package jdbc.ex03.jdbcinsert;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class JdbcInsert {
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
					
			// 5. 데이터 삽입
			String strInsert = "INSERT INTO emp(eno, ename)\r\n"
							+ "  VALUES('9000', '홍길동')";
			int cnt = statemt.executeUpdate(strInsert);
			System.out.println("result : " + cnt);
			
			// 6. 객체 해제
			statemt.close();
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}








