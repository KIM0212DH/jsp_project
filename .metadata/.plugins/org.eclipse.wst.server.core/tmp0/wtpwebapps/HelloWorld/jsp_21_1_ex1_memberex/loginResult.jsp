<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>로그인 되었습니다.</h2>
	<%!
	String loginId;
	%>
	<%
	loginId = (String)session.getAttribute("memberId");
	%>
	<a href="modify.jsp"><%=loginId%>의 정보 수정 하러 가기</a>
</body>
</html>