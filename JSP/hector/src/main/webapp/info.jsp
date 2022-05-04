<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>제품번호</td>
			<td>P111</td>
		</tr>
		<tr>
			<td>가격</td>
			<td>10,000원</td>
		</tr>
	</table>
	<jsp:include page="infoSub.jsp" flush="false">
		<jsp:param value="B" name="type"/>
	</jsp:include>
</body>
</html>