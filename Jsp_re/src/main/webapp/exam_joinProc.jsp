<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*" %>
<%@page import="Member.MemberDAO"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	//한글처리
	request.setCharacterEncoding("utf-8");
	//패키지 Member 파일이름 MemberDTO
	//멤버변수 userId, userPwd, userName, phoneNo, address, email, reg_date
	
	//액션태그 useBean 이동 객체 생성 Member
	//액션태그 setProperty 폼=> 자바빈저장
	%>
	
	<jsp:useBean id="member" class="Member.MemberDTO"/>
	<jsp:setProperty property="*" name="member" />
	
	아 이 디:<jsp:getProperty property="userId" name="member"/><br>
	패스워드:<jsp:getProperty property="userPwd" name="member"/><br>
	이   름:<jsp:getProperty property="userName" name="member"/><br>
	전화번호:<jsp:getProperty property="phoneNo" name="member"/><br>
	주   소:<jsp:getProperty property="address" name="member"/><br>
	이 메 일:<jsp:getProperty property="email" name="member"/><br>
	
	<%
	member.setRegDate(new Timestamp(System.currentTimeMillis()));
	out.println("날짜: "+member.getRegDate());
	
	//디비작업 패키지 Member 파일이름 MemberDTO
	//객체생성 dbPro
	MemberDAO dbpro = new MemberDAO();
	//메서드 joinMember(member) DTO안에 joinMember있다
	
	dbpro.joinMember(member);
	//이동 회원가입성공 loginForm.jsp
	%>
		
	<script type="text/javascript">
		 alert("회원가입 성공!");
		 location.href="exam_joinResult.jsp";
	 </script>
</body>
</html>