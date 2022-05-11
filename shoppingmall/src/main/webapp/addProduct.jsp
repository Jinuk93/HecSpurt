<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,
				 com.oreilly.servlet.multipart.DefaultFileRenamePolicy,
				java.util.*,
				java.io.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%@ include file="./menu.jsp"%>

    <%!String greeting = "상품 등록";
        String tagline = "내 이름은 코난, 탐정이죠";%>


    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3"><%=greeting %></h1>
        </div>
    </div>

    <div class="container">
        <form action="/shoppingmall/ProductAdd" name="newProduct" class="form-horizontal" method="post"
                    enctype="multipart/form-data">
            <div class="form-group row">
                <lable class="col-sm-2">
                    상품 코드
                </lable>
                <div class="col-sm-3">
                    <input type="text" id="proId" name="proId" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <lable class="col-sm-2">
                    상품명
                </lable>
                <div class="col-sm-3">
                    <input type="text" id="proName" name="proName" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <lable class="col-sm-2">
                    상품 가격
                </lable>
                <div class="col-sm-3">
                    <input type="text" id="unitPrice" name="unitPrice" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <lable class="col-sm-2">
                    상품 설명
                </lable>
                <div class="col-sm-3">
                    <input type="text" id="description" name="description" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <lable class="col-sm-2">
                    제조사
                </lable>
                <div class="col-sm-3">
                    <input type="text" id="manufacturer" name="manufacturer" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <lable class="col-sm-2">
                    카테고리
                </lable>
                <div class="col-sm-3">
                    <input type="text" id="category" name="category" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <lable class="col-sm-2">
                    상품 수량
                </lable>
                <div class="col-sm-3">
                    <input type="text" id="noOfStock" name="noOfStock" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <lable class="col-sm-2">
                    이미지
                </lable>
                <div class="col-sm-3">
                    <input type="file" id="fileName" name="fileName" class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="submit" class="btn btn-primary" value="등록">
                </div>
            </div>
        </form>
    </div>
<%@ include file="./footer.jsp"%>
</html>
</html>