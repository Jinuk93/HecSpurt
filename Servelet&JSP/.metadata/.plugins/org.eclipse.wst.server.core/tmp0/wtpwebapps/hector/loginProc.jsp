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
String userId = request.getParameter("userId");
String userPwd = request.getParameter("usePwd");
if(userId.isEmpty() || userPwd.isEmpty()) {
	RequestDispatcher rd = request.getRequestDispatcher("loginForm.jsp");
	rd.forward(request, response);
	return;
}
%>

<%-- 	<%
	request.setCharacterEncoding("UTF-8");
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("usePwd");
	%>
	아 이 디 : <%=userId%><br>
	비밀 번호 : <%=userPwd%> --%>
</body>
</html>