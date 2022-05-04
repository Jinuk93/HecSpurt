<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>first page</h3>
	<jsp:include page="second.jsp" flush="false">

	
	<%-- <%-- <jsp:forward page="second.jsp"/> --%>
<!-- <p>--첫번쨰 페이지--</p> 
	
	<%String p = request.getParameter("p"); %>
	<jsp:forward page="<%=p%>"/> --%> 
</body>
</html>