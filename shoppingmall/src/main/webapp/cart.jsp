<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="padding-top: 50px">
	<table class="table table-hover">
		<tr><th>상품</th><th>가격</th><th>수량</th><th>소계</th><th>비고</th></tr>
	<%
	int sum=0;
	ArrayList<Products> cartList = (ArrayList<Products>)session.equals().getAttribute("cartList");
	if(cartList==null) { cartList = new ArrayList<Products>(); }
	for(int i=0; i<cartList.size(); i++) {
		Products product = cartList.get(i);
		int total = product.getUnitPrice()*product.getQuantity();
		sum += total; //가격
	}  // total : 아이템별 합, sum : 장바구니의 모든 합
	%> 	
	<tr>
		<td><%=product.getProId() %>-<%=product.getProName() %></td>
		<td><%=product.getUnitPrice() %></td>
		<td><%=product.getQuantity() %></td>
		<td><%=total%></td>
		<td><a href="removeCart.jsp?proId=<%=product.getProId() %>"class="badge badge-danger">삭제</a></td>
	</tr>
	<% } %>
		<tr><th></th><th></th><th>총액</th><th><%=sum %></th><th></th></tr>
	</table>
		<a href="productList.jsp" class="btn btn-secondary">&laquo; 쇼핑 계속하기</a>
	</div>
<%-- 	<div class="jumbotron">
		<div class="container">
			<h1 class="dispaly3">장바구니</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left"><a href="deleteCart.jsp?cartId=<%=cartId%>"
					class="btn btn-danger">삭제하기</a></td>
					<td align="rigth"><a href="shippingInfo.jsp?cartId=<%=cartId%>"
					class="btn btn-success">주문하기</a></td>
				</tr>
			</table>
		</div>
	</div>
	 --%>
</body>
</html>