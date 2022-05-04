<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- loginForm.jsp / loginProc2.jsp / Session_main.jsp / SessionEx2.jsp -->
	<%
	request.setCharacterEncoding("utf-8");
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	session.setAttribute("userId", userId);
	session.setMaxInactiveInterval(60*1);
	%>
	<h1>Session 예제</h1>
<form action="sessionEx2.jsp" method="post">
	1. 가장 좋아하는 계절은? <br>
	<input type="radio" name="season" values="봄">봄
	<input type="radio" name="season" values="여름">여름
	<input type="radio" name="season" values="가을">가을
	<input type="radio" name="season" values="겨울">겨울
	<p>
	2. 가장 좋아하는 과일은? <br>
	<input type="radio" name="fruit" values="수박">수박
	<input type="radio" name="fruit" values="사과">사과
	<input type="radio" name="fruit" values="복숭아">복숭아
	<input type="radio" name="fruit" values="자두">자두
	<p>
	<input type="submit" value="결과보기">
</form>
</body>
</html>