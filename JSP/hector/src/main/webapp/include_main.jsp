<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	include 전 name 파라미터 <%=request.getParameter("name") %>
	<hr>
	<% request.setCharacterEncoding("utf-8"); %>
	<jsp:include page="body_sub.jsp" flush="false">
		<jsp:param value="장마" name="name"/>
	</jsp:include>
	<hr>
	include 후 name 파라미터 : <%=request.getParameter("name")%>
</body>
</html>