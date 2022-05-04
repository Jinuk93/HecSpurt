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
	<h1>Session 예제</h1>
	<%request.setCharacterEncoding("utf-8"); 
	String userId = (String)session.getAttribute("userId");
	String season = request.getParameter("season");
	String fruit = request.getParameter("fruit");
	%>
	<!--  로그인 폼에서 입력한 사용자 정보 출력 -->
	아 이 디 : <%=request.getParameter("userId") %> <br>
	비밀 번호 : <%=request.getParameter("userPwd") %>
	
	<%=userId %>님이 좋아하는 계절과 과일은 <%=season %>과 <%=fruit %>입니다. <br>
	세션 ID : <%=session.getId() %> <br>
	세션 유지시간 : <%=session.getMaxInactiveInterval() %> 초 <br> 
</body>
</html>