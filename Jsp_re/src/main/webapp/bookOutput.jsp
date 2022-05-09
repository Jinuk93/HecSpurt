<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="cookie.BookBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%= ((BookBean) request.getAttribute("book")).getTitle() %>
<br/>

책 제목 : ${book.title}<br/>
책 저자 : ${book.author}<br/>
출판사 : ${book.publisher}<br/>
</body>
</html>