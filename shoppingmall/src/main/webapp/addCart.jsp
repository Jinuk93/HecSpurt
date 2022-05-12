<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, javax.sql.*, javax.naming.*, dao.*, controller.*, com.shopping.vo.products.*, java.util.ArrayList" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String proId=request.getParameter("proId");
		ProductsDAO dao = ProductsDAO.getInstance();
		Products selectedItem = dao.selectProduct(proId);
		ArrayList<Products> cartList=(ArrayList<Products>)session.getAttribute("cartList");
		if(cartList == null){
			cartList=new ArrayList<Products>();
			session.setAttribute("cartList",cartList);
		}
		int cnt=0;
		Products orderItem=new Products();
		for(int i=0;i<cartList.size();i++){
			orderItem = cartList.get(i);
			if(orderItem.getProId().equals(proId)){
				cnt++;
				int orderedQuantity = orderItem.getQuantity()+1;
				orderItem.setQuantity(orderedQuantity);
			}
		}
		if(cnt==0){
			selectedItem.setQuantity(1);
			cartList.add(selectedItem);
		}
	%>
	<jsp:forward page="productDetail.jsp"/>
</body>
</body>
</html>