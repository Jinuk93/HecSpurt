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
request.setCharacterEncoding("utf-8");
String userId = request.getParameter("userId");
String userPwd = request.getParameter("userPwd");

Cookie cookie = new Cookie("test", "form");

cookie.setMaxAge(60*1);
cookie.setValue(userId);
/* cookie.setValue(userPwd); */

response.addCookie(cookie);

if (userId.equals("admin") && userPwd.equals("1234")){
	out.println("로그인에 성공했음<br/>" + "<a href='loginFrm.jsp'>로그인 form으로</a>");
%>

<% 
	}else{
		out.println("<script>alert('비밀번호 불일치'); history.back();</script>");
	}
%>


</body>
</html>