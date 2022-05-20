<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${list[0].getUserId()}
${list[0].getUserPwd()}
${list[0].getUserName()}
${list[0].getPhoneNo()}
<table border="1">
   <c:forEach var="item" items="${list}">
      <tr>
         <td>${item.getUserId()}</td>
      </tr>
   </c:forEach>

</table>
</body>
</html>