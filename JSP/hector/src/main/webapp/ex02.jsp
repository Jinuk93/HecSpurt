<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	//jsp는 Java in html 이다. 그러므로, html 안에 <% % >을 사용함으로서 Java코드를 집어넣는다
	int a =2;
	int b =3;
	int sum = a+b;
	out.println("a + b의 합 = " + sum);
	%>
</body>
</html>