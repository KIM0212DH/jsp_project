<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	response.setStatus(200);
	%>
	<br><br>
	<%
	out.println("exception.getMessage() : ");
	%>
	<%=exception.getMessage()%>
	<br><br>
	<%
	out.println("exception.toString() : ");
	%>
	<%=exception.toString()%>
	<br><br>
	<%
	exception.printStackTrace(response.getWriter());
	%>
</body>
</html>