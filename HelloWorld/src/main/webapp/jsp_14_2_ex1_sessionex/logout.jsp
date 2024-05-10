<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout</title>
</head>
<body>

	<%!String session1;
	String session2;%>
	<%
	session1 = request.getParameter("session1");
	session2 = request.getParameter("session2");

	session.removeAttribute(session1);
	session.removeAttribute(session2);
	out.println("로그아웃 되었습니다.");
	%>
	<br><br>
	
	<%
	Enumeration enumeration = session.getAttributeNames();
	while(enumeration.hasMoreElements()){
		out.println("잔여 세션 정보");
		String name = enumeration.nextElement().toString();
		String value = session.getAttribute(name).toString();
		out.println("session name: " + name + ", ");
		out.println("session value: " + value + "<br>");
	}
	%>
	<button type="button" onclick="location.href='login.jsp'">처음으로</button>
</body>
</html>