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



    <div class="quit-div">
        <h2>회원 탈퇴 하시겠습니까?</p>
        <button id="quitButton">탈퇴</button>
    </div>
    <script>
        var button = document.getElementById("quitButton");
        button.onclick = function() {
            window.location.href = "userQuitOk.jsp";
        };
    </script>

</body>
</html>