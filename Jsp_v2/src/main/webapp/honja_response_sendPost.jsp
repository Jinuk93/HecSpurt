<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>response_sendPost 페이지</title>
</head>
<body>
Post 부분 입니다.
 
<% request.setCharacterEncoding("UTF-8"); %>
 
<%
String user = (String)request.getParameter("name3");
request.getSession().setAttribute("userName", user);
response.sendRedirect("honja_page_control_end2.jsp");
%>
</body>
</html>