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

	<%
	int[] iArr = { 10, 20, 30 };
	out.println(Arrays.toString(iArr));
	%>

	<h1>jsp_10_2_ex1_directiveex.jsp 페이지 입니다.</h1>
	<br>
	<%@ include file="include01.jsp"%><br>
	<h1>다시 jsp_10_2_ex1_directiveex.jsp 페이지 입니다.</h1>

	<!-- 주석입니다. -->
	주석입니다.
	<br>
	<br>


	<%
	out.println("서버: " + request.getServerName() + "<br>");
	out.println("포트번호: " + request.getServerPort() + "<br>");
	out.println("요청방식: " + request.getMethod() + "<br>");
	out.println("프로토콜: " + request.getProtocol() + "<br>");
	out.println("URL: " + request.getRequestURL() + "<br>");
	out.println("URI: " + request.getRequestURI() + "<br>");
	out.println("세션: " + request.getSession() + "<br>");
	out.println("Context Path: " + request.getContextPath() + "<br>");
	out.println("Query String: " + request.getQueryString() + "<br>");
	%>

</body>
</html>