<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="uploadProc.jsp" method="post" enctype="multipart/form-data">
		파일정보 : <input type="text" name="fileInfo"><p>
		<input type="file" name="file"><br>
		<input type="submit" value="파일 업로드">
	</form>
</body>
</html>