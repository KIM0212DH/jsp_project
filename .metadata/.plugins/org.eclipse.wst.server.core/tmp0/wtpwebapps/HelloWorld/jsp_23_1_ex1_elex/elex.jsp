<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="student" class="kr.co.jsplec.ex.Student" scope="session"></jsp:useBean>

	${student.name}
	${student.age}
	
	<%
	String name = request.getParameter("name");
	%>
	${param.name}
	
</body>
</html>