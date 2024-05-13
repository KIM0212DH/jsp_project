<%@page import="kr.co.jsplec.ex.jsp_weekend.UserDAO"%>
<%@page import="kr.co.jsplec.ex.jsp_weekend.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../innerStyle.css">

</head>
<body class="main-body">
	<nav class="nav">
		<a href="adminAdminInfo.jsp">내 정보 조회</a> 
		<a href="adminMyModify.jsp">내 정보 수정</a> 
		<a href="adminUserInfo.jsp">회원 정보 조회</a>
		<a href="adminUserModify.jsp">회원 정보 수정</a> 
        <a href="adminQuit.jsp">회원 탈퇴</a> 
		<a href="../logout.jsp">로그아웃</a>
	</nav>

	
	<h2>회원의 정보가 수정 되었습니다.</h2>
	<%!
	UserDTO loginUser = new UserDTO();
	UserDAO userConnection = new UserDAO();
	
	String loginId;
	String loginPw;
	
	String changeNo;
	String changeAuth;
	String changeStatus;
	%>
	
	<%
	loginId = (String)session.getAttribute("memberId");
	loginPw = (String)session.getAttribute("memberPw");
	
	changeNo = request.getParameter("nouser");
	changeAuth = request.getParameter("auth");
	changeStatus = request.getParameter("status");
	userConnection.adminModifyUserInfo(changeNo, changeAuth, changeStatus);
	
	%>

</body>
</html>