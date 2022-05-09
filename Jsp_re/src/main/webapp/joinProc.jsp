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
	<%@page import="Member.MemberDTO"%> 
<body>
	<% 
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "scott";
		String dbPwd = "tiger";
		PreparedStatement pstmt = null;
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection(url, dbId,dbPwd);
	%>
	<%
	Member.MemberDTO member = new Member.MemberDTO();
	%>
	
	<!-- JoinForm에서 입력한 데이터를 그대로 출력한다 -->
	<table border="1">
	<caption>사용자가 입력한 데이터</caption>
		<tr>
			<td>아이디</td>
			<td><%=request.getParameter("userId")%></td> 
			<td>비밀번호</td>
			<td><%=request.getParameter("userPwd")%></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=request.getParameter("userName") %></td>
			<td>전화번호</td>
			<td><%=request.getParameter("phoneNo") %></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><%=request.getParameter("address")%></td>
			<td>이메일</td>
			<td><%=request.getParameter("email")%></td>
	</table>
	
	<%
	String sql = "SELECT * FROM MEMBERS";
	//실행
	pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();
	
	String insert = "INSERT INTO MEMBERS(userId,userPwd,userName,phoneNo,address,email) VALUES(?,?,?,?,?,?)";
	//실행
	pstmt = conn.prepareStatement(insert);
	
/* 	pstmt.setString(1, "" + request.getParameter("userId"));
	pstmt.setString(2, "" + request.getParameter("userPwd"));
	pstmt.setString(3, "" + request.getParameter("userName"));
	pstmt.setString(4, "" + request.getParameter("phoneNo"));
	pstmt.setString(5, "" + request.getParameter("address"));
	pstmt.setString(6, "" + request.getParameter("email"));	 */	
	pstmt.setString(1, "a");
	pstmt.setString(2, "a");
	pstmt.setString(3, "a");
	pstmt.setString(4, "a");
	pstmt.setString(5, "a");
	pstmt.setString(6, "a");	
		
	pstmt.executeUpdate();
		
	ResultSet rs = pstmt.executeQuery();
	%>
	
	<br>
	<!-- JoinForm에서 입력한 데이터를 데이터베이스에 저장한다 -->
	<!-- 데이터베이스에 저장한 데이터를 테이블에서 검색한 결과를 화면에 출력한다 -->
		<table border="1">
		<caption>테이블에서 읽어온 데이터</caption>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id" maxlength="5"></td>
			<td>비밀번호</td>
			<td></td>
		</tr>
		<tr>
			<td>이름</td>
			<td></td>
			<td>전화번호</td>
			<td></td>
		</tr>
		<tr>
			<td>주소</td>
			<td></td>
			<td>이메일</td>
			<td><input type="password" name="password" maxlength="10"></td>
		</tr>
			<td>가입일</td>
			<td colspan="3"></td>
		</tr>
	</table>
</body>
</html>