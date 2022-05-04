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
	request.setCharacterEncoding("UTF-8");
	String name="장미";
	%>
	<jsp:include page="includeTagTop.jsp"/>
	include ActionTag의 Body임
</body>
</html>