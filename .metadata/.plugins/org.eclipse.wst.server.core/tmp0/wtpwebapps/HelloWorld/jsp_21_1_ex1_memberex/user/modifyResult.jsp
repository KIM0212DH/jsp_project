<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 완료</title>
<link rel="stylesheet" type="text/css" href="../innerStyle.css">

</head>
<body class="main-body">
	<nav class="nav">
		<a href="userUserInfo.jsp">내 정보 조회</a>
		<a href="userMyModify.jsp">내 정보 수정</a>
		<a href="userQuit.jsp">회원 탈퇴</a>
		<a href="../logout.jsp">로그아웃</a>
	</nav>

<%!
    String loginId;
    String loginPw;
%>
<%
    loginId = (String) session.getAttribute("memberId");
    loginPw = (String) session.getAttribute("memberPw");
%>

<h2><%=loginId %>의 정보가 수정되었습니다.</h2>

   
</body>
</html>
