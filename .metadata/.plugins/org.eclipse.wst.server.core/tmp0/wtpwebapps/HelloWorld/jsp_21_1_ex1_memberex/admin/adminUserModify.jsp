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


    <form action="adminUserModifyOk.jsp" method="post" class="form-modify">
        <label for="nouser">수정하고자 하는 계정의 번호</label>
        <input type="text" id="nouser" name="nouser" placeholder="ex) PD00001"><br><br>

        계정 권한
        <input type="radio" name="auth" value="20"> 관리자
        <input type="radio" name="auth" value="10"> 일반 사용자<br><br>

        계정 상태
        <input type="radio" name="status" value="ST01"> 정상
        <input type="radio" name="status" value="ST02"> 해지<br><br>

        <input type="submit" value="수정">
    </form>
</body>
</html>
