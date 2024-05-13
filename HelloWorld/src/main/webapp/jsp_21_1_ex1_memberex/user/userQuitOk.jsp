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
<body class="modify-body">

	<%!String userId;
	String userPw;
	UserDTO loginUser = new UserDTO();
	UserDAO userConnection = new UserDAO();%>

	<%
	userId = (String) session.getAttribute("memberId");
	userPw = (String) session.getAttribute("memberPw");
	loginUser = userConnection.getUserInfo(userId, userPw);
	userConnection.quitAccount(loginUser);
	session.removeAttribute("memberId");
	session.removeAttribute("memberPw");
	%>


	<div class="quit-div">
		<h2>회원 탈퇴 되었습니다.</h2>
		<button type="button" onclick="location.href='../login.html'"
			id="quitButton">처음으로</button>
	</div>

</body>
</html>