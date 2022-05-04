<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>쿠키 정보 확인</h3>
	<%
	Cookie[] cookies = request.getCookies();
	if(cookies != null) {
		out.println("현재 설정된 쿠키의 수 : " + cookies.length);
		out.println("<br>=================================<br>");
		for(int i=0; i<cookies.length; i++) {
			out.println("쿠키 속성 이름 [" + i + "] : " + cookies[i].getName() + "<br>");
			out.println("쿠키 속성 이름 [" + i + "] : " + cookies[i].getValue() + "<br>");
			out.println("<br>=================================<br>");
		}
	}%>
</body>
</html>