<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>1에서 10까지의 합은?</h3>
	<%
	int result = 0;
	
	for(int i=1; i<=10; i++) {
		result += i;
	}
	out.println("1에서 10까지의 합은 " + result + "입니다");
	%>
	<%
	int count =0;
	
	for(int i=1; i<=10; i++) {
		result += i;
	}
	out.println("1에서 10까지의 합은 " + result + "입니다");
	%>
</body>
</html>