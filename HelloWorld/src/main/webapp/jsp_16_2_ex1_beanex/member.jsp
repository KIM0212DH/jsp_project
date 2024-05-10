<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="memberProc.jsp" method="post">
        <label for="id">ID:</label>
        <input type="text" id="id" name="id" placeholder="아이디 입력"><br><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" placeholder="비밀번호 입력"><br><br>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" placeholder="이름 입력"><br><br>
        <label for="email">Email:</label>
        <input type="text" id="email" name="email" placeholder="이메일 입력"><br><br>
        <input type="submit" value="Submit">
    </form>

</body>
</html>