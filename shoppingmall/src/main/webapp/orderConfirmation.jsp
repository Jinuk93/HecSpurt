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
	Cookie cartId = new Cookie("shippingCartId",
			URLEncoder.encode(request.getParamter("cartId"), "UTF-8"));
	Cookie name = new Cookie("shippingCartId",
			URLEncoder.encode(request.getParamter("name"), "UTF-8"));
	Cookie name = new Cookie("shippingCartId",
			URLEncoder.encode(request.getParamter("name"), "UTF-8"));
	Cookie name = new Cookie("shippingCartId",
			URLEncoder.encode(request.getParamter("name"), "UTF-8"));
	Cookie name = new Cookie("shippingCartId",
			URLEncoder.encode(request.getParamter("name"), "UTF-8"));
	Cookie name = new Cookie("shippingCartId",
			URLEncoder.encode(request.getParamter("name"), "UTF-8"));
	//--
	cartId.setMaxAge(24*60*60); name.setMaxAge(24*60*60);
	shippingDate.setMaxAge(24*60*60);
	//--
	response.addCookie(cartId); response.addCookie(name);
	reponse.addCookie(shippingDate);
	//--
	response.sendRedirect("orderConfirmation.jsp");
	%>
</body>
</html>