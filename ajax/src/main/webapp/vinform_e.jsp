
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*, javax.sql.*, javax.naming.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%
   InitialContext io = new InitialContext();
   DataSource ds = (DataSource) io.lookup("java:comp/env/jdbc/myoracle");
   Connection conn = ds.getConnection();
   String bookID = request.getParameter("val");
   PreparedStatement pstmt = conn.prepareStatement("select * from book where bookid = ?");
   pstmt.setString(1, bookID);
   ResultSet rs = pstmt.executeQuery();
   while(rs.next()){
      out.print(rs.getString(1) + " : " + rs.getString(2) + "<br/>");
   }
   rs.close();
   pstmt.close();
   conn.close();
%>
</body>
</html>