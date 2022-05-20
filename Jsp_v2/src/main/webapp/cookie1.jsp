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
	Cookie cookie = new Cookie("appleCookie", "apple");
	
	cookie.setMaxAge(60*1);
	/* cookie delete setMaxAge -> 0 */
	/* cookie.setMaxAge(0); */
	//cookie.setValue("tea");
	response.addCookie(cookie);
%>
<h3>쿠키생성</h3>
<p> 쿠키 내용 확인은 <a href="tasteCookie.jsp">여기로</a>!!!</p>\

<%-- <%
	response.sendRedirect("tasteCookie.jsp");
%> --%>
</body>
</html>