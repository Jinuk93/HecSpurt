<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:forward page="param_data.jsp">
		<jsp:param name="userId" value='admin' />
		<jsp:param name="name" value='<%=java.net.URLEncoder.encode("관리자") %>' />
	</jsp:forward>
	<p>Java Server Page
</body>
</html>