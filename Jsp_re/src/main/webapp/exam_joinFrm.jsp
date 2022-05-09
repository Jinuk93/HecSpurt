<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Member.MemberDTO"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="exam_joinProc.jsp" method="post">
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="userId" maxlength="20"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="userPwd" maxlength="20"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="userName" maxlength="20"></td>
		</tr>
		<tr>	
			<td>전화번호</td>
			<td><input type="text" name="phoneNo" maxlength="20"></td>
		</tr>
		<tr>	
			<td>주소</td>
			<td><input type="text" name="address" maxlength="50"></td>
		</tr>
		<tr>	
			<td>이메일</td>
			<td><input type="text" name="email" maxlength="20"></td>
		</tr>
		<tr align="center">
			<td colspan="4"><input type="submit" value="회원가입"></td>
		</tr>
	</table>
	</form>
</body>
</html>