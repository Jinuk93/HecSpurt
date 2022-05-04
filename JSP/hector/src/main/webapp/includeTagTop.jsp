<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- includeForm.jsp / includeTag.jsp / includeTagTop.jsp -->
	<%
	String name=request.getParameter("name");
	%>
	include ActionTag의 Top임
	<p>
	<b>내 이름은 <%=name %> 탐정이죠!</b>
	<hr>
</body>
</html>