<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="menu.jsp"%>
	 <%!String greeting = "상품 상세정보";
        String tagline = "내 이름은 코난, 탐정이죠";%>
        
        <div class="jumbotron">
       	 <div class="container">
            <h1 class="display-3"><%=greeting %></h1>
        </div>
    </div>
    
    
      <div class="container">
        <div class="row">
            <div class="col-md-5">
                <img src="<%=request.getContextPath() + "/upload"%>/${product.fileName}" alt="해당 이미지 없음" width="80%">
            </div>

            <div class="col-md-6">
                <h3>${product.proName}</h3>
                <p>${product.description}</p>
                <p>${product.unitPrice}원</p>
                <p>
                    <b>상품 코드 : </b><span class="badge badge-danger">${product.proId}</span>
                </p>
                <p>
                    <form name="addForm" action="/AddCart?proId=${product.proId}" method="post">
                        <a href="#" onclick="addToCart();" class="btn btn-info">상품 주문 &raquo;</a>
                        <a href="/addCart" class="btn btn-warning">장바구니 &raquo;</a>
           			    <a href="/shoppingmall/SelectAll" class="btn btn-secondary">상품 목록 &raquo;</a>
       				</form>
        </p>
    </div>
</div>
<script type="text/javascript">
	function addToChart() {
	if(confirm("상품을 장바구니에 추가하시겠습니까?") {
		document.addForm.submit();
		}else { document.addForm.reset();	}
	}
</script>
</body>
	<jsp:include page="/footer.jsp"/>
</html>