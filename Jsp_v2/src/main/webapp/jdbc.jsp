<%@page import="cookie.Book"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import ="java.sql.*" %>
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
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection(url, dbId, dbPwd);
ArrayList<Book> bookList = new ArrayList<Book>();

%>

<%
String sql = "SELECT * FROM BOOK";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
		/* out.println(rs.getString(1) + "&nbsp;"
								+ rs.getString(2)+ "&nbsp;"
								+ rs.getString(3) + "&nbsp;"
								+ rs.getString(4) + "<br/>"); */
		bookList.add(new Book(Integer.parseInt(rs.getString(1)),
									rs.getString(2),
									rs.getString(3),
									Integer.parseInt(rs.getString(4))));
		
	}
%>
<c:set var="list" value="<%=bookList %>" />
<table border="1">
	<tr>
		<th>bookid</th>
		<th>bookname</th>
		<th>publisher</th>
		<th>price</th>
	</tr>
	<c:forEach var="item" items="${list}">
		<tr>
			<td>${item.bookid}</td>
			<td>${item.bookname}</td>
			<td>${item.publisher}</td>
			<td>${item.price}</td>
		</tr>
	</c:forEach>
</table>

</body>
</html>