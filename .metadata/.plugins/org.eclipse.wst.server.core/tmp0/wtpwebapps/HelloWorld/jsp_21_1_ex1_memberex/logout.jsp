<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
<link rel="stylesheet" type="text/css" href="outerStyle.css">

<style>
    
</style>
</head>
<body class="logout-body">
<%
    session.removeAttribute("memberId");
    session.removeAttribute("memberPw");

    Enumeration enumeration = session.getAttributeNames();
    while (enumeration.hasMoreElements()) {
        out.println("잔여 세션 정보");
        String name = enumeration.nextElement().toString();
        String value = session.getAttribute(name).toString();
        out.println("session name: " + name + ", ");
        out.println("session value: " + value + "<br>");
    }
%>
<div class="logout-div">
    <h2>로그아웃 되었습니다.</h2>
    <button type="button" onclick="location.href='login.html'" id="joinButton">처음으로</button>
</div>
</body>
</html>
