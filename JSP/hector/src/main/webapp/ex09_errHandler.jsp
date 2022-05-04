<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%@ page isErrorPage="true" %>
 다음과 같은 예외가 발생하였습니다
 <p>
 <%=exception.getMessage() %>
</body>
</html>