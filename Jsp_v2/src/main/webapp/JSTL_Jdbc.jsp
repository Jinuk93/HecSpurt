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
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String dbId = "scott";
	String dbPwd = "tiger";
	PreparedStatement pstmt = null;
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection(url, dbId,dbPwd);
%>
<%
	String update = "update BOOK set bookname='야구의 역사' where bookid=1";
	//실행		
	pstmt = conn.prepareStatement(update);
	pstmt.executeUpdate();
	
	String delete = "delete from book where bookid=10";
	//실행
	pstmt = conn.prepareStatement(delete);
	pstmt.executeUpdate();
	
	String sql = "SELECT * FROM BOOK";
	//실행
	pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>

<%
	while(rs.next()) {
		out.println(rs.getString(1) + "&nbsp;" + rs.getString(2) 
					+ "&nbsp;"+ rs.getString(3)+"&nbsp;"+ rs.getString(4)+
					"<br>");
	}
%>
</body>
</html>