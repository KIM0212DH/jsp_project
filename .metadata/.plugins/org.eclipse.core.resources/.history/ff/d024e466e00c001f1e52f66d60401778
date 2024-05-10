<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%!String name, id, password, major, protocol;
	String[] hobby;%>

	<%
	request.setCharacterEncoding("UTF-8");

	name = request.getParameter("name");
	id = request.getParameter("id");
	password = request.getParameter("password");
	major = request.getParameter("major");
	protocol = request.getParameter("protocol");
	hobby = request.getParameterValues("hobby");
	%>

	<%
	out.println("이름: " + name + "<br>");
	out.println("아이디: " + id + "<br>");
	out.println("비밀번호: " + password + "<br>");
	out.println("취미: " + Arrays.toString(hobby) + "<br>");
	out.println("전공: " + major + "<br>");
	out.println("포토코롤: " + protocol + "<br>");
	%>

	<br>
	<%
	out.println("parameterNames<br>-----------------------------\n" + "<br>");
	Enumeration<String> eNames = request.getParameterNames();

	while (eNames.hasMoreElements()) {
		out.println(eNames.nextElement() + "<br>");
	}

	out.println("<br>parameterValues(\"hobby\")<br>-----------------------------\n" + "<br>");

	String[] hobbys = request.getParameterValues("hobby");
	for (String hobby : hobbys) {
		out.println(hobby + "<br>");
	}
	%>


</body>
</html>