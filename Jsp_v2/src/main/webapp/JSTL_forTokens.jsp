<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:forTokens [var="Varname"]
	items="StringOfTokens" delims="delimiters"
	[var="varName"][varStatus="varStatusName"]
	[begin="begin"][end="end"][step="step"]>
			몸체
	</c:forTokens> 
	
<c:forTokens items="소설/역사/인문/정치/미술/종료/여행/과학" delims="/" var="token">
	${token}
</c:forTokens>
</body>
</html>