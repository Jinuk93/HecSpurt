package Member;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cookie.Book;

@WebServlet("/JoinProc")
public class JoinProc extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public JoinProc() {
        super();
    }
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberDTO member = new MemberDTO(
				request.getParameter("userId"),
				request.getParameter("userPwd"),
				request.getParameter("userName"),
				request.getParameter("phoneNo"),
				request.getParameter("address"),
				request.getParameter("email")
				);
		
		//jdbc 로직
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "scott";
		String dbPwd = "tiger";
		
		PreparedStatement pstmt = null;
		Connection con = null;
		int result = 0;
		try {
			//1단계 드라이버로더
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//2단계 디비연결
			con=DriverManager.getConnection(url, dbId,dbPwd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String sql="insert into MEMBERS(userId, userPwd, userName, phoneNo, address, email)"
				+ " VALUES(?,?,?,?,?,?)";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getUserPwd());
			pstmt.setString(3, member.getUserName());
			pstmt.setString(4, member.getPhoneNo());
			pstmt.setString(5, member.getAddress());
			pstmt.setString(6, member.getEmail());
			result = pstmt.executeUpdate();	 //select 제외한 나머지
			//ResultSet rs = pstmt.executeQuery() select만
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		
		if(result == 1){
			response.sendRedirect("exam2_joinResult.jsp");
		}else {
			response.sendRedirect("exam2_joinFrm.jsp");
		}
		  
		
		
		//요청 파라미터 추출 -> MemberDTO 객체 생성하여 member에 참조
		//request.setAttribute("MemberDTO", member); //요청정보에 속성으로 추가
		//회원가입시 포워드 페이지
		//RequestDispatcher rd = request.getRequestDispatcher("exam2_joinResult.jsp");
		//rd.forward(request, response);
		//response.sendRedirect("주소");
	
	}

}
