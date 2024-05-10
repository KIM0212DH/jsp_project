<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="member" class="kr.co.jsplec.ex.MemberBean" scope="session"></jsp:useBean>

	id: <jsp:getProperty property="id" name="member"/><br>
	password: <jsp:getProperty property="password" name="member"/><br>
	name: <jsp:getProperty property="name" name="member"/><br>
	email: <jsp:getProperty property="email" name="member"/><br>
	
</body>
</html>