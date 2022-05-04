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
		<tr colspan="2">
			<td>
				<jsp:include page="./include/top.jsp">
					<jsp:param name="home" value="home"/>
					<jsp:param name="champ" value="champ"/>
					<jsp:param name="tech" value="tech"/>
				</jsp:include>
			</td>
		</tr>
		<tr>
			<td>
				<jsp:include page="./include/menu.jsp">
					<jsp:param name="reference" value="reference"/>
					<jsp:param name="item" value="item"/>
					<jsp:param name="board" value="board"/>
				</jsp:include>
			</td>
		</tr>
		<tr>
			<jsp:include page="./include/home.jsp">
				<jsp:param name="home" value="home"/>
				<jsp:param name="home" value="home"/>
			</jsp:include>
		</tr>
		<tr colspan="2">
			<td>
				<jsp:include page="./include/bottom.jsp">
					<jsp:param name="company" value="company"/>
					<jsp:param name="way" value="way"/>
				</jsp:include>
			</td>
		</tr>
	</table>
</body>
</html>