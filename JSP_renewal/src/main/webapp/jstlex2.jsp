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
<c:set var="num" value="${11}"/>
점수 : <c:out value="${num }" />은
<c:if test="${num > 60 }"> 합격입니다</c:if>
<c:choose>
	<c:when test="${num>=90 }">A학점입니다.</c:when>
	<c:when test="${num>=80 }">B학점입니다.</c:when>
	<c:when test="${num>=70 }">C학점입니다.</c:when>
	<c:when test="${num>=60 }">D학점입니다.</c:when>
	<c:otherwise>
		F학점입니다.
	</c:otherwise>
</c:choose>

</body>
</html>