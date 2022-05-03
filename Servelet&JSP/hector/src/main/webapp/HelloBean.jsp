<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<%@page
	import="org.global.beans.HelloBean"%> 
<body>
<%-- 	<%
	HelloBean hello = (HelloBean)
					request.getAttribute("hello");
	if(hello == null) {
		hello = new HelloBean();
		request.setAttribute("hello", hello);
	}
	out.print(hello.getName());
	hello.setName("conan");
	out.println(hello.getName());
	%> --%>
	
	<jsp:useBean class="org.global.beans.HelloBean" id="hello"/>
		<jsp:getProperty property="name" name="hello"/><br>
		<jsp:getProperty property="number" name="hello"/><br>
		<jsp:getProperty property="name" name="hello" param="name"/>
		<jsp:getProperty property="number" name="hello" param="number"/>
		<jsp:getProperty property="name" name="hello"/><br>
		<jsp:getProperty property="number" name="hello"/><br>	
</body>
</html>