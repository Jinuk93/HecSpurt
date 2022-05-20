<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
  // 한글처리
  request.setCharacterEncoding("UTF-8");
  // userId, userPwd name가져오기
  String userId = "userId";
  String userPwd = "userPwd";
  String userName = request.getParameter("userName");
  ResultSet rs = null;
  
  try {
   // 1단계 드라이버로더
   Class.forName("oracle.jdbc.driver.OracleDriver");
   // 2단계 디비연결
   Connection con = null;
   String url = "jdbc:oracle:thin:@localhost:1521:xe";
   String dbId = "scott";
   String dbPwd = "tiger";

   con = DriverManager.getConnection(url, dbId, dbPwd);
   // 3단계 : id에 해당하는 passwd를 가져오는 sql(sql 생성)
   PreparedStatement pstmt = null;
   String sql = "";
   
   sql = "select userPwd from members where userId=?";
   pstmt = con.prepareStatement(sql);
   pstmt.setString(1, userId);
   // 4단계 실행 => rs저장
   rs = pstmt.executeQuery();
   // 5단계 rs 데이터있으면 id있음
   //   폼비밀번호 rs비밀번호 비교 맞으면 => 수정
   //                     틀리면 => 비밀번호틀림
   //            없으면 id없음
   if(rs.next()){
    //id있음
//     rs.getString(1);
    String dbPass=rs.getString("passwd");
    if(userPwd.equals(dbPass)){
     //비밀번호 맞음 수정
     sql = "update members set userName=? where userId=? and userPwd=?";
     pstmt=con.prepareStatement(sql);
     pstmt.setString(1, userName);
     pstmt.setString(2, userId);
     pstmt.setString(3, userPwd);
        
     // 4단계 실행
     pstmt.executeUpdate(); //insert,update,delete
     out.println("정보수정 성공!");
  		}else{
     		out.println("비밀번호 틀림!");
    		 }    
   		}else{
    out.println("id가 존재하지 않습니다");//id없음
   }
   
  } catch (Exception e) {
   e.printStackTrace();
  }finally{
   
  }
 %>
</body>
</html>