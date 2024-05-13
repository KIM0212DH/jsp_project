<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="outerStyle.css">

</head>
<body>
	<div class="join-div">
        <h2>회원가입이 완료되었습니다.</p>
        <button id="joinButton">로그인하러 가기</button>
    </div>
    <script>
        var button = document.getElementById("joinButton");
        button.onclick = function() {
            window.location.href = "login.html";
        };
    </script>
</body>
</html>