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
		<a href="userUserInfo.jsp">내 정보 조회</a>
		<a href="userMyModify.jsp">내 정보 수정</a>
		<a href="userQuit.jsp">회원 탈퇴</a>
		<a href="../logout.jsp">로그아웃</a>
	</nav>
	
	
	<%!String userId;
	String userPw;
	UserDTO loginUser = new UserDTO();
	UserDAO userConnection = new UserDAO();%>

	<%
	userId = (String) session.getAttribute("memberId");
	userPw = (String) session.getAttribute("memberPw");
	loginUser = userConnection.getUserInfo(userId, userPw);


	%>
	<h2>User Information</h2>
	<table>
		<tr>
			<th>No</th>
			<th>ID</th>
			<th>Password</th>
			<th>User Type</th>
			<th>Status</th>
			<th>Mobile</th>
			<th>Email</th>
		</tr>
		<tr>
			<td><%=loginUser.getNoUser()%></td>
			<td><%=loginUser.getIdUser()%></td>
			<td><%=loginUser.getNmPaswd()%></td>
			<td><%=loginUser.getCdUserType()%></td>
			<td><%=loginUser.getStStatus()%></td>
			<td><%=loginUser.getNoMobile()%></td>
			<td><%=loginUser.getNmEmail()%></td>
		</tr>
	</table>
</body>
</html>