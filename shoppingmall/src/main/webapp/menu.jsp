<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
	<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
	<nav class="navbar navbar-expand navbar-dark bg-dark">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="index.jsp">Home</a>
			</div>
			<div>
				<ul class="navbar-nav mr-auto">
					<c:choose>
						<c:when test="${empty sessionId}">
							<li class="nav-item"><a class="nav-link" href="${contextPath}/members/loginFrm.jsp">로그인</a></li>
							<li class="nav-item"><a class="nav-link" href="${contextPath}/members/loginFrm.jsp">회원가입</a></li>
						</c:when>
						<c:otherwise>
							<li style="padding-top:7px; color: white">[${sessionId}님]></li>
							<li class="nav-item"><a class="nav-link" href="${contexPath}/members/logout.jsp">로그아웃</a></li>
							<li class="nav-item"><a class="nav-link" href="${contexPath}/members/update.jsp">회원 수정</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			
			</div>
			<div>
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="navl-link" href="${contextPath}/productList.jsp">상품목록</a></li>
					<li class="nav-item"><a class="navl-link" href="${contextPath}/addProduct.jsp">상품추가</a></li>
					<li class="nav-item"><a class="navl-link" href="${contextPath}/addProduct.jsp">상품삭제</a></li>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>