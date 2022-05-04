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
	<br> Operation : ${5>3}
	<br> Implicit Object : ${header["host"]}
	<!--Literal : Literals
		Operation : true
		Implicit Object : localhost:8081
 	 -->
 	 
 	 <%request.setAttribute("name", "conan"); %>
 	 속성 "name" : <%=request.getAttribute("name") %><br>
 	 속성 "name" : ${name} <br>
 	 request의 name: ${requestScope.name} <br>
 	 사용자의 요청 패러미터 : name : ${param.name}
 	 
 	 <%
 	 String[] myList = {"conan", "rose", "ran"};
 	 List list = Arrays.asList(myList);
 	 out.println("두번쨰 요소 : " + list.get(1) +"<br>"); %>
 	 
 	 <%request.setAttribute("list", list); %>
 	 두번쨰 요소 : ${list[1]}
 	 
 	 <%
 	 Map<String,String> board = new
 	 HashMap<String, String>();
 	 board.put("title", "명탐정 코난");
 	 request.setAttribute("board", board);
 	 %>
 	 ${board.title}
</body>
</html>