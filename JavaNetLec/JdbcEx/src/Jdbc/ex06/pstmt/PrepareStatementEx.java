package jdbc.ex06.pstmt;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PrepareStatementEx {
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
			
			/*
			1) 동일 구조의 sql문을 반복 사용시 속도가 빠르다.
			동일한 구조의 sql문을 사용할 때 PreparedStatement는 사전에
			최적화 작업을 하고 전송시에는 변화되는 값만 넣어서 전송하므로
			Statement에 비해서 훨씬 빠른 실행이 가능하다.
			
			2) ?를 나중에 데이터 치환하므로 편리한 프로그래밍이 가능하다.
			*/
			String strInsert = "INSERT INTO student\r\n" +
							" VALUES(?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(strInsert);
			for(int i=0;i<1000;i++) {
				pstmt.setString(1,  "" + i);
				pstmt.setString(2,  "홍길동");
				pstmt.setString(3,  "남");
				pstmt.setInt(4,  4);
				pstmt.setString(5,  "IT");
				pstmt.setDouble(6,  0.95);
				
				int cnt = pstmt.executeUpdate();
				System.out.println(i + "result : " + cnt);
			}			
			
			// 6. 객체 해제
			pstmt.close();
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}