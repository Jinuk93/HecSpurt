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
Products2 selectedItem = null;
ArrayList<Products2> carList = (ArrayList<Products2>)
session.getAttribute("carList");
if(carList == null) { //세션에 카트리스트가 없으면, 카트 리스트는 선택된 모든 아이템 저장
	carList = new ArrayList<Products2>();
	session.setAttribute("carList", carList);// 새로 생성
}
int cnt = 0;
Products2 orderItem = new Products2(); //주문 상품
for(int i =0; i<carList.size(); i++) {
	orderdItem = carList.get(i); //세션에 추가된 상품을 주문 상품에 추가
	if(orderedItem.getProID().equals(proID)) {
		cnt++;
		int orderedQuantity = orderdItem.getQuantity() + 1; //주문 수량 증가
		orderdItem.setQuantity(orderedQuantity);
	}
}
if(cnt ==0) { //카트에 추가된 적이 없으면
	selectedItem.setQuantity(1); //최초 주문수량을 1로 설정
	carList.add(selectedItem); //카트리스트에 추가
}
//해당 상품의 상세 페이지로
%>
</body>
</html>