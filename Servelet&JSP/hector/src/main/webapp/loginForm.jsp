<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- loginForm.jsp / loginProc.jsp / loginProc2.jsp / Session_main.jsp / SessionEx2.jsp -->
	<%if(session.isNew() || session.getAttribute("userId") == null ) { %>
		String msg = (String)request.getAttribute("error"); %>
		
	<form action="./loginProc.jsp" method="post">
		아 이 디 : <input type = "text" name="userId"><br>
		비밀 번호 : <input type="password" name="userPwd"><br>
		<input type="submit" value="로그인">
	</form>
	<%} else { %>
		<a href="loginProc.jsp">로그아웃</a> 
	<%} %>
</body>
</html>