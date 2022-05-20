<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Member.MemberDAO"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	//userId userPwd 가져오기
	String id = request.getParameter("userId");
	String passwd = request.getParameter("userPwd");
	//디비작업 객체 생성 dbPro
	//int check=메서드 userCheck(userId,userPwd) 1,0,-1인지
	MemberDAO dbpro = new MemberDAO();
	
	int check = dbpro.userCheck(userId,userPwd);
		//check==1 세션생성"id" 이동 main.jsp
		//check==0 비밀번호틀림 뒤로이동
		//check==-1 아이디없음 뒤로이동
	if(check==1){
	 session.setAttribute("userId", userId);
	 %>
	 <script type="text/javascript">
	 alert("세션값 생성");
	 location.href="main.jsp";
	 </script>
	 
	 <%
	}else if(check==0){
	 %>
	 <script type="text/javascript">
	 alert("비밀번호 틀림");
	 history.back();
	 </script>
	 
	 <%
	}else{
	 %><script type="text/javascript">
	 alert("아이디 없음");
	 history.back();
	 </script>
	 <%
	}
	%>
</body>
</html>