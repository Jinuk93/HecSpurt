<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- ParamEx.jsp / forwardRequeset.jsp / b.jsp -->
	
	<jsp:forward page="b.jsp">
		<jsp:param name="bloodType" value=<%=java.net.URLEncoder.encode("bloodType") %> />
	</jsp:forward>
</body>
</html>