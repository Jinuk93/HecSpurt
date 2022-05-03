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
	<% String bloodType = request.getParameter("bloodType"); %>

	<h3>Forward Tag Example</h3>
	코난님의 혈액형은 <%=bloodType %>이고, 정확한 판단력을 가진 합리주의이다.
</body>
</html>