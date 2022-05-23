<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@page import="java.util.Enumeration" %>
	<%
	Enumeration<?> en = request.getHeaderNames();
	while(en.hasMoreElements()) {
		String headerName = (String)en.nextElement();
		String headerValue = request.getHeader(headerName);
	%>
	<%=headerName%><%=headerValue%><br>
	<% 
	}
	%>
</body>
</html>