<%@page import="java.util.Enumeration"%>
<%@page import="jakarta.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>welcome</title>
</head>
<body>

	<%
	String inputId = request.getParameter("id");

	/* 	session.invalidate(); */
	Enumeration<String> enumeration = session.getAttributeNames();
	while (enumeration.hasMoreElements()) {
		String name = enumeration.nextElement().toString();
		String value = session.getAttribute(name).toString();
		if (value.equals(inputId)) {
			out.println(value + "님 안녕하세요.");
		}
	}
	%>

	<h2>로그인 성공하였습니다.</h2>


	<button type="button"
		onclick="location.href='logout.jsp?session1=<%="memberId"%>&session2=<%="memberPw"%>'">로그아웃</button>
</body>
</html>