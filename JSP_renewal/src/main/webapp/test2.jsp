<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
</head>
<body>
<%
  String saveId = request.getParameter("saveId");
  String userId = request.getParameter("userId");
  String userPwd = request.getParameter("userPwd");

  Cookie cookie = new Cookie("saveId", userId);

  if (saveId != null) {
    cookie.setMaxAge(60 * 60 * 24 * 365);
    response.addCookie(cookie);
  } else {
    cookie.setMaxAge(0);
    response.addCookie(cookie);
  }
%>

<% if (userId.equals(application.getInitParameter("adminId")) && userPwd.equals(application.getInitParameter("adminPwd"))) { %>
  로그인에 성공했음 <br>
<a href="test1.jsp">로그인 폼으로</a>
<% } else { %>
  로그인 실패
<%
    out.print("<script>alert('비밀번호 불일치'); history.back();</script>");
}%>
</body>
</html>