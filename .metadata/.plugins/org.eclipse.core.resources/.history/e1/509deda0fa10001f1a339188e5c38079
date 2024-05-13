<%@page import="kr.co.jsplec.ex.jsp_weekend.UserDAO"%>
<%@page import="kr.co.jsplec.ex.jsp_weekend.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Information</title>
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

	<%
// 사용자 정보를 가져오기 위해 DAO와 DTO 객체 생성
UserDAO userConnection = new UserDAO();
UserDTO loginUser = new UserDTO();

// 세션에서 사용자 아이디와 비밀번호 가져오기
String userId = (String) session.getAttribute("memberId");
String userPw = (String) session.getAttribute("memberPw");

// 사용자 정보 가져오기
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
