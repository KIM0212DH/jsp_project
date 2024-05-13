<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<link rel="stylesheet" type="text/css" href="../innerStyle.css">

</head>
<body class="modify-body">
	<nav class="nav">
		<a href="adminAdminInfo.jsp">내 정보 조회</a> 
		<a href="adminMyModify.jsp">내 정보 수정</a> 
		<a href="adminUserInfo.jsp">회원 정보 조회</a>
		<a href="adminUserModify.jsp">회원 정보 수정</a> 
        <a href="adminQuit.jsp">회원 탈퇴</a> 
		<a href="../logout.jsp">로그아웃</a>
	</nav>

	<%!String loginId;
	String loginPw;%>
	<%
	loginId = (String) session.getAttribute("memberId");
	loginPw = (String) session.getAttribute("memberPw");
	%>
	<h2><%=loginId%>의 정보를 수정합니다.
	</h2>

	<form action="adminMyModifyOk.jsp" method="post">
		<label for="password">기존 비밀번호:</label> 
		<input type="password"
			id="password" name="password" placeholder="기존 비밀번호 입력"><br>
		<label for="newpassword">새로운 비밀번호:</label> 
		<input type="password"
			id="newpassword" name="newpassword" placeholder="새로운 비밀번호 입력"><br>
		<label for="newpasswordcheck">새로운 비밀번호 확인:</label> 
		<input
			type="password" id="newpasswordcheck" name="newpasswordcheck"
			placeholder="새로운 비밀번호 입력"><br> 
		<label for="newphonenum">새로운
			전화번호:</label> 
		<input type="text" id="newphonenum" name="newphonenum"
			placeholder="새로운 전화번호 입력"><br> 
		<label for="newemail">새로운
			이메일:</label> 
		<input type="text" id="newemail" name="newemail"
			placeholder="새로운 이메일 입력"><br> 
		<input type="submit"
			value="수정">
	</form>
</body>
</html>
