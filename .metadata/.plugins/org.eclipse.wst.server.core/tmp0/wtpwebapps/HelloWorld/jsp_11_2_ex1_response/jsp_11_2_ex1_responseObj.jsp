<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!String age;
	int iAge;%>

	<%
	request.setCharacterEncoding("UTF-8");

	age = request.getParameter("age");
	iAge = Integer.parseInt(age);

	if (iAge >= 20)
		response.sendRedirect("pass.jsp?age=" + iAge);
	else
		response.sendRedirect("notpass.jsp?age=" + iAge);
	%>

</body>
</html>