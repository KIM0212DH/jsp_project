<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="student" class="kr.co.jsplec.ex.Student" scope="page"></jsp:useBean>
	<jsp:setProperty name="student" property="name" value="홍길동" />
	<jsp:setProperty name="student" property="age" value="29" />
	<jsp:setProperty name="student" property="grade" value="99"/>
	<jsp:setProperty name="student" property="studentNum" value="1"/>
	
	이름: <jsp:getProperty name="student" property="name"/><br>
	나이: <jsp:getProperty name="student" property="age"/><br>
	번호: <jsp:getProperty name="student" property="studentNum"/><br>
	성적: <jsp:getProperty name="student" property="grade"/><br>

	
	
</body>
</html>