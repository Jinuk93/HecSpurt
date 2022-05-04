<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.global.beans.BookBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<c:set var="name" value="army"><c:out value="${name}"><br>
<c:remove var="name"/> <c:out value="${name}"><br>
<body>
<%
BookBean book1 = new BookBean("명탐정 홈즈", "코난 도일", "모름");
request.setAttribute("bookOne", book1);
%>
</body>
</html>