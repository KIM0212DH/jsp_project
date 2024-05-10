<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout</title>
</head>
<body>

	<%!
	String inputId;
	String inputPw;
	%>
	<%
	inputId = request.getParameter("id");
	inputPw = request.getParameter("password");

	Cookie[] cookies = request.getCookies();
	for (int i = 0; i < cookies.length; i++) {
		if (cookies[i].getName().equals(inputId) && cookies[i].getValue().equals(inputPw)) {
			out.println(cookies[i].getName());
			cookies[i].setMaxAge(0);
			response.addCookie(cookies[i]);
			out.println("계정이 로그아웃 되었습니다. <br><br>");
			break;
		}
	}
	%>
	<button type="button" onclick="location.href='login.jsp'">처음으로</button>
</body>
</html>