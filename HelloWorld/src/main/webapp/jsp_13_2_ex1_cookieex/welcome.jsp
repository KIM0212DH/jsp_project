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
	String inputPw = request.getParameter("password");

	Cookie cookie = new Cookie(inputId, inputPw);
	cookie.setMaxAge(60 * 60);
	response.addCookie(cookie);
	%>

	<h2>로그인 성공하였습니다.</h2>
	<%
	out.println("cookie name: " + cookie.getName() + "<br>" + "cookie value: " + cookie.getValue() + "<br><br>");
	%>

	<button type="button"
		onclick="location.href='logout.jsp?id=<%=cookie.getName()%>&password=<%=cookie.getValue()%>'">로그아웃</button>
</body>
</html>