<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>로그인</h1>
	<form action="/test/loginProc" method="post">
	아 이 디 : <input type="text" name="userId"><br>
	비밀 번호: <input type="password" name="userPwd">
	<br><br>
	<input type="submit" value="로그인">
	<input type="button" value="회원가입" onclick="location.href='exam2_joinFrm'"><br>
	</form>
</body>
</html>