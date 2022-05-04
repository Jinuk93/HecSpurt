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
	request.setCharacterEncoding("UTF-8");
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	//String check = userCheck(userId, userPwd);
	//아이디와 비밀번호 비교 확인
	if( userId.equals("admin") && userPwd.equals("admin")) {
		response.sendRedirect("Session_main.jsp");
	/* if( userId == request.getParameter("userId") && userPwd == request.getParameter("userPwd") ) {
		response.sendRedirect("Session_main.jsp"); */
	}else {
		response.sendRedirect("loginFail.jsp");
	}
	%>
</body>
</html>