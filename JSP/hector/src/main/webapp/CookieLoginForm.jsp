<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
#로그인폼

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
</head>
<body>
<%
  String userId = null;
  Cookie[] cookies = request.getCookies();
  for (Cookie cookie : cookies) {
    if (cookie.getName().equals("saveId")) {
        userId = cookie.getValue();
    }
  }
%>
  관리자 로그인<br>
  <form action="LoginProc.jsp" method="post">
    ID: <input type="text" name="userId" value="<%=userId!=null?userId:""%>"> <input type="checkbox" name="saveId" value="true" <%=userId!=null?"checked":""%>> 아이디 기억<br>
    PW: <input type="password" name="userPwd"> <input type="submit" value="전송">

  </form>
</body>
</html>
</body>
</html>