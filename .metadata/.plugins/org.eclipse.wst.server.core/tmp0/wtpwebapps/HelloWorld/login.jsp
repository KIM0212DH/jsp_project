<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Form</title>
</head>
<body>
<h1>post 방식으로 데이터 주고 받기</h1>
    <form action="/HelloWorld/jsp_7_1_ex1_formex" method="post">
        <label for="id">ID:</label>
        <input type="text" id="id" name="id" placeholder="아이디 입력"><br><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" placeholder="비밀번호 입력"><br><br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
