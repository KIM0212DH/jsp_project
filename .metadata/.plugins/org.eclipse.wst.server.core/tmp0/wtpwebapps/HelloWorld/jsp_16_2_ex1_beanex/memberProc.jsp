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
	String id;
	String password;
	String name;
	String email;
	%>

	<%
	id = request.getParameter("id");
	password = request.getParameter("password");
	name = request.getParameter("name");
	email = request.getParameter("email");
	%>

	<jsp:useBean id="member" class="kr.co.jsplec.ex.MemberBean" scope="session"></jsp:useBean>
	<jsp:setProperty name="member" property="id" value="<%=id%>"></jsp:setProperty>
	<jsp:setProperty name="member" property="password" value="<%=password%>"></jsp:setProperty>
	<jsp:setProperty name="member" property="name" value="<%=name%>"></jsp:setProperty>
	<jsp:setProperty name="member" property="email" value="<%=email%>"></jsp:setProperty>
	<a href="memberConfirm.jsp">Bean 확인하러 가기</a>

</body>
</html>