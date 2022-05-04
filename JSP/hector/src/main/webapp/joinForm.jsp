<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<%@page
	import="org.global.beans.Members"%> 
<body>
	<form action="joinProc.jsp" method="post">
	<table border="1">
		<tr align="center">
			<td colspan="4">회원 가입 정보</td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><input type="textarea"></td>
			<td>비밀번호</td>
			<td><input type="textarea"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="textarea"></td>
			<td>이메일</td>
			<td><input type="textarea"></td>
		</tr>
		<tr align="center">
			<td colspan="4"><input type="submit" value="회원가입"></td>
		</tr>
	</table>
	</form>
</body>
</html>