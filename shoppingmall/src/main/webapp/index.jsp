<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/menu.jsp"/>
	<%!
	String greeting = "Welcome to SettleBankMall"; 
	String tagline = "세틀뱅크몰에 오신것을 환영합니다";
	%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><%=greeting %></h1>
		</div>
	</div>
	<main role="main">
		<div class="container">
			<div class="text">
				<h3><%=tagline %></h3>
			</div>
		</div>
	</main>
</body>
	<jsp:include page="/footer.jsp"/>
</html>