<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	td {
	text-align : center;
	}
</style>
</head>
<body>
	<form action="ParamEx" method="post">	
		<table border="1">
			<th colspan="2">로그인</th>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="userId"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="userPwd"></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="전송"></th>
			</tr>
		</table>
	</form>
</body>
</html>