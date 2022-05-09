<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//1. JNDI 서버 객체 생성
InitialContext ic = new InitialContext();
//2. lookup()
DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/myoracle");
//3. getConnection()
Connection conn = ds.getConnection();
PreparedStatement pstmt = conn.prepareStatement("select * from book");
ResultSet rs = pstmt.executeQuery();
while(rs.next()) {
	out.print(rs.getString(1) + ":" + rs.getString(2) + "<br>");
}
//반납
rs.close(); pstmt.close(); conn.close();
%>
</body>
</html>