package Member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Member.MemberDTO;

public class MemberDAO {
	
		 //디비연결 1,2단계
		 private Connection getConnection() throws Exception { //예외처리
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
		 
		 //회원가입
		 public void joinMember(MemberDTO member){
			 Connection con = null;
			 PreparedStatement pstmt=null; //sql문장을 먼저 미리 쓰겠다
			 String sql="";
		  
		  try{
		   //1,2단계 메서드 호출
		   con = getConnection();

		   //3단계 insert
		   sql="insert into MEMBERS VALUES(userId,userPwd,userName,phoneNo,address,email)";
		   pstmt=con.prepareStatement(sql);
		   
		   pstmt.setString(1, member.getUserId());
		   pstmt.setString(2, member.getUserPwd());
		   pstmt.setString(3, member.getUserName());
		   pstmt.setString(4, member.getPhoneNo());
		   pstmt.setString(5, member.getAddress());
		   pstmt.setString(6, member.getEmail());
		   
		   //4단계 실행
		   pstmt.executeUpdate();
		  }catch(Exception e){
		   e.printStackTrace();
		  }finally{
		   if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
		   if(con!=null)try{con.close();}catch(SQLException ex){}
		  }
		 }
		 
		 //유저체크
		 public int userCheck(String userId, String userPwd){
		  int check=-1;
		  Connection con = null;
		  PreparedStatement pstmt=null; //sql문장을 먼저 미리 쓰겠다
		  String sql="";
		  ResultSet rs = null;
		  
		  try {
		   //1,2단계 메서드 호출
		   con = getConnection();
		   //3단계 id에 해당하는 userPwd 가져오기
		   sql = "select * from members where userId=?";
		   pstmt = con.prepareStatement(sql);
		   pstmt.setString(1, "userId");
		   //4단계 rs저장
		   rs = pstmt.executeQuery();
		   
		   //5단계 
		   //데이터가 있으면
		   //비밀번호 비교, 맞으면 check=1
		   //            틀리면 check=0
		   //없으면 
		   //아이디  		 없음   check=-1
		   
		   if(rs.next()){
		    //id있음
			//		     rs.getString(1);
		    String dbPass = rs.getString("userPwd");
		    if(userPwd.equals(dbPass)){
		     check=1;
		    }else{
		     check=0;
		    }
		   }else{
		    check=-1;
		   }    
		  } catch (Exception e) {
		   e.printStackTrace();
		  }finally{
		   if(rs!=null)try{rs.close();}catch(SQLException ex){}
		   if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
		   if(con!=null)try{con.close();}catch(SQLException ex){}
		  }
		  return check;
		 }
		}
