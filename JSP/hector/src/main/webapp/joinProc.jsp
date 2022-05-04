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
	<%
	Members member = new Members();
	%>
		<table border="1">
		<tr>
			<td>아이디</td>
			<td><%=member.getUserId()%></td>
			<td>비밀번호</td>
			<td><%=member.getUserPwd() %></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=member.getName() %></td>
			<td>이메일</td>
			<td><%=member.getEmail() %></td>
		</tr>
	</table>
</body>
</html>