<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	int total = out.getBufferSize();
	out.print("첫번째 텍스트");
	out.clearBuffer(); //버퍼의 내용 지움
	out.print("출력 버퍼 크기 : " + total);
	out.print("<br>사용되지 않은 버퍼 크기 : " + out.getRemaining());
	out.flush(); //버퍼의 내용 강제 전송
	out.print("<br>flush 후 버퍼의 크기 : " + out.getRemaining());
	%>
	<hr>
	<h3>out.print()메소드</h3>
	<%
	out.print(10);
	out.print(true);
	out.print("aaa");
	out.print('가');
	out.print(new java.io.File("/"));
	out.print("버퍼의 크기" + out.getRemaining());
	%>
	<!-- 페이지 지시자를 이용하여 버퍼 크기 변경 후 다시 실행 -->
</body>
</html>