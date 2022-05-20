<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1>회원 정보 조회</h1>
    아이디 : ${MemberDTO2.userId}<br/>
    비밀번호 : ${MemberDTO2.userPwd}<br/>
    이름 : ${MemberDTO2.userName}<br/>
    전화번호 : ${MemberDTO2.phoneNo}<br/>
    주소 : ${MemberDTO2.address}<br/>
    이메일 : ${MemberDTO2.email}<br/>
    가입일 : ${MemberDTO2.regDate}
</body>
</html>