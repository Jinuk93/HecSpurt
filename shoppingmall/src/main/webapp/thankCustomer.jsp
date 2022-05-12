<%@page import="java.net.URLDecoder"%>
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
	request.setCharacterEncoding("UTF-8");
	String shippingCartId = "";
	String ShoppingName = "";
	
	//---중략
	Cookie[] cookies = request.getCookies();
	if(cookies != null) {
		for (Cookie cookie : cookies) {
			String name = cookie.getName();
			if(name.equals("shippingCartId"))
				shippingCartId = URLDecoder.decode(cookie.getValue(), "UTF-8");
			else if ( name.equals("shippingDate"))
				shippingDate = URLDecoder.decode(cookie.getValue(), "UTF-8");
		}
	}
	%>
</body>
</html>