<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- jsp는 Java in html 이다. 그러므로, html 안에 < %를 사용함으로서 Java코드를 집어넣는다 -->
	<%int count=0; %>
	<!-- 1이 증가된 후 카운트 값은 -->
	<%out.println("1이 증가된 후 카운트 값은" +  ++count); %>
</body>
</html>