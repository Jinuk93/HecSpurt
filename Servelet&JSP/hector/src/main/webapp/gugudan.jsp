<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>구구단 출력</h3>
	<%for(int i=2; i<10; i++) {
		for(int y=1; y<10; y++) {
			out.println(i + "*" + y + "=" + (i*y));%><br>
	<% //br 태그를 위해서 <% 태그를 또 쓴거임. br태그를 중간에 넣기 위해서!!
		}
	}
	%>	
</body>
</html>