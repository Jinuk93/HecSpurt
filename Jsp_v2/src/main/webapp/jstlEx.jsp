<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="cookie.BookBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="name" value="amy" />
<c:out value="${name}" /><br/>
<c:remove var="name" /> <c:out value="${name}"/> <br/>

<%
	BookBean book1 = new BookBean("명탐정 홈즈", "코난 도일", "모름");
	request.setAttribute("bookOne", book1);
%>

<c:set var="title" value="${bookOne.title}" /> 
<c:out value="${title}" />
<c:set var="author" value="<%= book1.getAuthor() %>" /> 
<c:out value="${author}" /><br/>
<c:set var="name">Wilde</c:set>
<c:out value="${name}" /><br/>
<hr/>
<%
	BookBean book2 = new BookBean("도리안 그레이의 초상", "오스카 와일드", "모름");
	request.setAttribute("bookTwo", book2);
%>
<c:set var="title" value="${bookTwo.title}" />
<c:out value="${title }" />
<c:set var="author" value="<%= book2.getAuthor() %>" />
<c:out value="${author }" />
<hr/>
<% BookBean book = new BookBean(); %>
<c:set target="<%= book %>" property="title" value="코스모스"/>
<%= book.getTitle() %> <br/>
<c:set var="b" value="<%= book %>" />
<c:set target="${b}" property="author" value="세이건" />
${b.author}
<br/>
<hr/>

<%
	String str = request.getParameter("msg");
%>
<c.catch var="e">
<%
	if(str.equals("add")){
		out.print(str);
	}
%>
</c.catch>
<c:out value="${e}"/>
</body>
</html>