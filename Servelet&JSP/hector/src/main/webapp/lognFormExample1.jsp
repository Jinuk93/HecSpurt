<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>if-else Example</h2>
	<form action="./loginProcExample1.jsp" method="post">
		이  름  : <input type = "text" name="name"><br>
		좋아하는 색깔 : 
		<select name="likecolor">
		    <option value="red" selected>붉은색</option>
		    <option value="green">초록색</option>
		    <option value="blue">파란색</option>
		</select><br>
		<input type="submit" value="보내기">
	</form>
</body>
</html>