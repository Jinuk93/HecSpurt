<%@page import="cookie.BookBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="i" begin="2" end="9">
	<c:forEach var="j" begin="1" end="9">
		${i}*${j} = ${i*j}<br/> 
	</c:forEach>
</c:forEach>
<hr/>
<c:forEach var="k" begin="1" end="10" step="2">
	${k} 
</c:forEach>
<br/> 
<hr/>

<c:forTokens items="소설/역사/인문/정치/미술/종료/여행/과학" delims="/" var="token">
	${token }
</c:forTokens>
</body>
</html>