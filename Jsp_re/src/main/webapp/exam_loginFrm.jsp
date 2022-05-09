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
	 String id;
	 if(session.getAttribute("userId")!=null){
	  id = "세션값 있음";
	 }else{
	  id = "세션값 없음";
	 }
	%>
	<h1>로그인</h1>
	<form action="examloginProc.jsp" method="post">
	아 이 디 : <input type="text" name="userId"><br>
	비밀 번호: <input type="password" name="userPwd">
	<br><br>
	<input type="submit" value="로그인">
	<input type="button" value="로그아웃" onclick="location.href='exam_logoutProc.jsp'">
	<input type="button" value="회원가입" onclick="location.href='exam_joinFrm'"><br>
	</form>
	<!-- < % =id %> 세션값 있는지 없는지 확인 -->
</body>
</html>