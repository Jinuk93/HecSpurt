<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- <%
	if(session.isNew() || session.getAttribute("userId")== null){
		String msg = (String) request.getAttribute("error");	
	}
%> --%>
관리자 아이디 : <%= application.getInitParameter("adminId") %>
관리자 비밀번호: <%= application.getInitParameter("adminPwd") %>

<%
	String result = null;
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		out.println("현재 설정된 쿠키의 수 :" + cookies.length);
		out.println("<br/> =======");
		for(int i=0; i < cookies.length; i++){
			out.println("쿠키 속성 이름 [" + i +"] :" + cookies[i].getName() + "<br/>");
			out.println("쿠키 속성 값 [" + i +"] :" + cookies[i].getValue() + "<br/>");
			if(cookies[i].getValue().equals("admin")){ result = cookies[i].getValue(); }
			out.println("======= <br/>");
			
		}
	}
%>
<form action="./loginProc.jsp" method="post">
dz

id :<input type='text' name='userId' value="<%= result!=null ? result : ""%>">
<input type="checkbox" name="remember" <%=result!=null?"checked":""%>>
<label for="remember">아이디기억</label>
<br>
PW : <input type="password" name="userPwd">
<input type="submit" value="로그인">
</form>
<%-- <% } else { %>
<a href="loginProc.jsp">로그아웃</a>
<% } %> --%>
</body>
</html>