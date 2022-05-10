package Member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO2 {
	
	
	//DAO 클래스는 단순히 DB연동만 담당하기 때문에 불필요하게 객체를 여러개 생성 할 필요가 없습니다.
	//그래서 싱글톤 패턴을 적용해서 객체를 1개만 생성하도록 만듭니다.
	
	//singleton 싱글톤
	//1. 스스로 객체를 1개 생성한다
	private static MemberDAO dao2 = new MemberDAO();
	//2. 외부에서 생성자를 호출할 수 없도록 생성자에 private 제한을 붙임
	private MemberDAO2() {
	}
	//3. 외부에서 객체생성을 요구하면 getter메서드를 이용해서 1번의 객체를 반환
	public static MemberDAO getInstance() {
		return dao2;
		}
	
	//디비연결 1,2단계
	public Connection getConnection() throws Exception {
		 String url = "jdbc:oracle:thin:@localhost:1521:xe";
		 String dbId = "scott";
		 String dbPwd = "tiger";
		 
		 PreparedStatement pstmt = null;
		 Connection con = null;
	  
		 //1단계 드라이버로더
		 Class.forName("oracle.jdbc.driver.OracleDriver");
		 //2단계 디비연결
		 con=DriverManager.getConnection(url, dbId,dbPwd);
		 return con;
		}
	
	//연결 닫기
	public void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		 if(pstmt!=null)try{pstmt.close();}
	   		catch(SQLException ex){}
		 if(con!=null)try{con.close();}
	   		catch(SQLException ex){}
		 if(rs !=null)try {rs.close();}
		 	catch(SQLException ex){}
	}
	
	//연결 닫기
	public void close(Connection con, PreparedStatement pstmt) {
		 if(pstmt!=null)try{pstmt.close();}
	   		catch(SQLException ex){}
		 if(con!=null)try{con.close();}
	   		catch(SQLException ex){}
	}
	
	//모든 멤버조회
	public ArrayList<MemberDTO2> selectMemberAll(){
		Connection con = null;
		PreparedStatement pstmt = null; //sql문장을 먼저 미리 쓰겠다
		ArrayList<MemberDTO2> arMember = new ArrayList<MemberDTO2>();  
		
		String sql = "SELECT * FROM MEMBERS";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			MemberDTO2 dto2 = null;
			
			//4단계 실행
		    ResultSet rs = pstmt.executeQuery();
		    rs.next(); //불린형
		    	while(rs.next()) {	    		
		    		String userId = rs.getString("userId");
		    		String userPwd = rs.getString("userPwd");
		    		String userName = rs.getString("userName");
		    		String phoneNo = rs.getString("phoneNo");
		    		String address = rs.getString("address");
		    		String email = rs.getString("email");
		    		MemberDTO2 dto3 = new MemberDTO2(userId, userPwd, userName, phoneNo, address, email);
		    		arMember.add(dto3);
		    	}	
		    	
			} catch (Exception e) {
				e.printStackTrace();
				
			}finally{
				close(con, pstmt);
			}
			return arMember;
	}
	
	//특정 멤버조회
	public MemberDTO2 selectMember(String userId) {
		
		Connection con = null;
		PreparedStatement pstmt = null; //sql문장을 먼저 미리 쓰겠다
		 
		String sql = "SELECT * FROM MEMBERS WHERE userID =?";
		MemberDTO2 dto3=new MemberDTO2();
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			MemberDTO2 dto2 = null;
			
			pstmt.setString(1, userId);
		
			//4단계 실행
		    ResultSet rs = pstmt.executeQuery();
		    
		    if(rs.next()) {
		    	String userId2 = rs.getString("userId");
	    		String userPwd = rs.getString("userPwd");
	    		String userName = rs.getString("userName");
	    		String phoneNo = rs.getString("phoneNo");
	    		String address = rs.getString("address");
	    		String email = rs.getString("email");
	    		dto3 = new MemberDTO2(userId, userPwd, userName, phoneNo, address, email);	
		    }
		    	
		    
			} catch (Exception e) {
				e.printStackTrace();
				
			}finally{
				close(con, pstmt);
			
			}
		return dto3;
	}
	
	//회원정보 삽입
	public int insertMember(MemberDTO dto) {
		
		Connection con = null;
		PreparedStatement pstmt = null; //sql문장을 먼저 미리 쓰겠다
		 
		String sql = "INSERT INTO "
				+ "MEMBERS(userId, userPwd, userName, phoneNumber, address, email) values(?,?,?,?,?,?)";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			MemberDTO2 dto2 = null;
			ResultSet rs= null;
			
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getUserPwd());
			pstmt.setString(3, dto.getUserName());
			pstmt.setString(4, dto.getPhoneNo());
			pstmt.setString(5, dto.getAddress());
			pstmt.setString(6, dto.getEmail());
			
			//4단계 실행
		    int result = pstmt.executeUpdate();
		    return result;
		    
			} catch (Exception e) {
				e.printStackTrace();
				return 0;
			}finally{
				close(con, pstmt);
			
			}
	}
	
	//특정 멤버 수정
	public int updateMember(MemberDTO dto) {
		
		Connection con = null;
		PreparedStatement pstmt = null; //sql문장을 먼저 미리 쓰겠다
		 
		//Update sql문 작성
        String sql = "UPDATE MEMBERS SET userPwd=?, userName=?," + 
        		"phoneNo=?, address=?, email=? WHERE userId=?";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			MemberDTO2 dto2 = null;
			ResultSet rs= null;
			
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getUserPwd());
			pstmt.setString(3, dto.getUserName());
			pstmt.setString(4, dto.getPhoneNo());
			pstmt.setString(5, dto.getAddress());
			pstmt.setString(6, dto.getEmail());
			
			//4단계 실행
		    int result = pstmt.executeUpdate();
		    return result;
		   
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}finally{
			close(con, pstmt);
		}
	}
	
	//특정 멤버 삭제
	public int deleteMember(String userId) {
		Connection con = null;
		PreparedStatement pstmt = null; //sql문장을 먼저 미리 쓰겠다
		 
		//Update sql문 작성
        String sql = "DELETE FROM MEMBERS WHERE userID = ?";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			//4단계 실행
		    int result = pstmt.executeUpdate();
		    return result;
		   
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}finally{
			close(con, pstmt);
		}
	}
}