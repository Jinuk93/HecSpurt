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
	request.setCharacterEncoding("UTF-8");
	String userId = request.getParameter("name");
	String userColor = request.getParameter("likecolor");
	%>
	<%=userId%>님이 좋아하는 색깔은 <%=userColor%>입니다. 
	<%!
	String color = null;
	%>
	<%
	if(userColor.equals("red")) {
		color = "red"; 		
		}else if(userColor.equals("green")){
		color = "green"; //equals 사용
		}else{
		color = "blue";
	}
	%>
	<body bgcolor=<%=color %>>
	
</body>
</html>