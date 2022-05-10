package Member;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/loginProc")
public class loginProc extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
	
	
		//jdbc 로직
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "scott";
		String dbPwd = "tiger";
	
		PreparedStatement pstmt = null;
		Connection con = null;
		ResultSet rs = null; 
		String sqlId = null;
		String sqlPwd = null;
		//
		try {
			//1단계 드라이버로더
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//2단계 디비연결
			con=DriverManager.getConnection(url, dbId, dbPwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		String sql="SELECT * FROM MEMBERS where userId=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) { //불린형
				//성공, true, 아이디 있음
			sqlId = rs.getString("userId"); //1번
			sqlPwd = rs.getString("userPwd");	
			
			
			}else {
				//실패, false, 아이디 없음
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}

}
