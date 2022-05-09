<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>forward action 및 sendRedirect()</h1>
	<hr>
	지금 보이는 화면은 page_control_end.jsp에서 출력한 결과입니다
	<hr>
	
	이   름 : <%=request.getParameter("name") %>
	전화번호 : <%=request.getParameter("tel") %>
	<!-- 이 문서에서 request 객체를 이용하여 값을 받는다. -->
	<!-- honja_request form에서 request2로 값을 받고, request2의 받은 값을 들고와서 end.jsp에 출력한다 -->
</body>
</html>