<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%@ include file="./menu.jsp"%>

    <%!String greeting = "상품 목록";
        String tagline = "내 이름은 코난, 탐정이죠";%>

    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3"><%=greeting %></h1>
        </div>
    </div>

    <div class="container">
        <div class="row" align="center">
            <c:set var="list" value="${pl}"/>
                <c:forEach var="item" items="${list}">
                    <div class="col-md-4">
                        <h3>${item.proName}</h3>
                        <p>${item.description}</p>
                        <p>${item.unitPrice}원</p>
                        <p>
                            <a href="/shoppingmall/ProductDetail?proId=${item.proId}"
                                    class="btn btn-secondary"
                                    role="button">
                                상세정보 &raquo;
                            </a>
                        </p>
                    </div>
                </c:forEach>
        </div>

<%--        <div class="text">--%>
<%--            <h3><%=tagline%></h3>--%>
<%--        </div>--%>
    </div>



    <%@ include file="./footer.jsp"%>
</body>
</html>