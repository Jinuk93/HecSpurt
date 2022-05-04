<%@page import="java.util.*"%>
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
	String[] myList = {"conan", "rose", "ran" };
	List list = Arrays.asList(myList);
	out.println("두번째 요소 :" + list.get(1) + "<br/>");
%>
<%
	request.setAttribute("list", list);
%>
두번째 요소 : ${list[1]}
<%
	Map<String, String> board = new HashMap<String, String>();
	board.put("title", "명탐정코난");
	request.setAttribute("board", board);
%>
<br/>
${board.title}
</body>
</html>