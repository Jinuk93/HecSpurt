<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- ParamEx.jsp / forwardRequeset.jsp / b.jsp -->
	<h3>Forward Tag Example</h3>
	<form method="POST" action="forwardRequeset.jsp">
	혈액형별 성격 테스트
	<p>당신의 혈액형은?</p>
	<input type="radio" name="bloodType" value="a">A형<br>
	<input type="radio" name="bloodType" value="b">B형<br>
	<input type="radio" name="bloodType" value="o">O형<br>
	<input type="radio" name="bloodType" value="ab">AB형<br>
	<input type="submit" value="보내기">
	</form>
</body>
</html>