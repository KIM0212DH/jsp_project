<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginOk</title>
</head>
<body>
	<%!
	String inputId;
	String inputPw;

	String correctId = "admin";
	String correctPw = "1234";
	%>
	<%
	inputId = request.getParameter("id");
	inputPw = request.getParameter("password");

	if (inputId.equals(correctId) && inputPw.equals(correctPw)) {
		response.sendRedirect("welcome.jsp?id=" + inputId + "&password=" + inputPw);
	} else {
		response.sendRedirect("login.jsp");
	}
	%>
</body>
</html>