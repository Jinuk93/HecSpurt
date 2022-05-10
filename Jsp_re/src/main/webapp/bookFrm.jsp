<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="BookReg" method="post">
		책 아이디 : <input type="text" name="bookId" ><br/>
		책 제 목 : <input type="text" name="bookName" ><br/>
		출 판 사 : <input type="text" name="publisher" ><br/>
		가    격 : <input type="text" name="price" ><br/>
		<input type="submit" value="전송">
	</form>
</body>
</html>