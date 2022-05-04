<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(request.getMethod().equals("POST")) { %>
<%
	request.setCharacterEncoding("UTF-8");
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");

	//유효성 처리
	if(userId.isEmpty() || userPwd.isEmpty()) {
		RequestDispatcher rd = request.getRequestDispatcher("loginForm.jsp");
		rd.forward(request, response);
	}
	//로그인 처리 
	if(session.isNew() ||session.getAttribute("userId") == null) {
		session.setAttribute("userId", userId); // userId란 이름으로 userId 등록
			out.print("로그인 완료");
		}else {
			out.print("이미 로그인이 되어있습니다");
		}
	%>
	<br>
	아이디 : <%=userId%> / 비밀번호 : <%=userPwd%>
	<%
		} else if ( request.getMethod().equals("GET")) {
			if(session != null || session.getAttribute("userId") != null) { //세션이 담겨있을 때
				session.invalidate(); //세션을 무효화시키는 메서드 (로그아웃 메서드)
				out.print("로그아웃 작업이 완료되었습니다");
			}
		}
%>
</body>
</html>