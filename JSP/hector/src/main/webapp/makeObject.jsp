<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<%@page
	import="org.global.beans.Members"%> 
<body>
	<jsp:useBean id="member" scope="request" class="org.global.beans.Members" />
		<jsp:setProperty name="member" property="userId" value="conan" />
		<jsp:setProperty name="member" property="name" value="코난" />
	<jsp:forward page="useObject.jsp"/>
</body>
</html>