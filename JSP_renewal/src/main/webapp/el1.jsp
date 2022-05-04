<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
Literal : ${"Literals"}
<br/> Operation : ${5 > 3}</br>
<br/> Implicit Object : ${header["host"]}</br>


<% request.setAttribute("name", "conan"); %>
속성 "name" : <%= request.getAttribute("name") %><br/>
속성 "name" : ${name} <br/>
request 의 name : ${requestScope.name}<br/> 
사용자의 요청 패러미터 name : ${param.name}
	

</body>
</html>