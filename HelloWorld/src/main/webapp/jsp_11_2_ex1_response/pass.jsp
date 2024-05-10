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
	String age = request.getParameter("age");
	out.println("당신의 나이는 " + age + "세로 성인입니다.");

	%>
	<br>
	<a href="/HelloWorld/jsp_11_2_ex1_response/jsp_11_2_ex1_responseForm.jsp">처음으로</a>
</body>
</html>