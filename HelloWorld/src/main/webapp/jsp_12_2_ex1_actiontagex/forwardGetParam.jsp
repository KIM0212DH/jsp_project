<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
	String id, password;		
	%>
	
	<%
	id = request.getParameter("id");
	password = request.getParameter("password");
	%>
	
	<h1>forwardGetParam.jsp 입니다.</h1>
	<div>아이디 : <%=id%> 입니다.</div>
	<div>비밀번호 : <%=password%> 입니다.</div>
	
</body>
</html>