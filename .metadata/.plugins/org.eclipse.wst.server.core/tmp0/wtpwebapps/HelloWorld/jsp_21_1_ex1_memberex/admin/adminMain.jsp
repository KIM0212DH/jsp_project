<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Panel</title>
    <link rel="stylesheet" type="text/css" href="../innerStyle.css">
    

</head>
<body class="main-body">
    <nav class="nav">
        <a href="adminAdminInfo.jsp">내 정보 조회</a>
        <a href="adminMyModify.jsp">내 정보 수정</a>
        <a href="adminUserInfo.jsp">회원 정보 조회</a>
        <a href="adminUserModify.jsp">회원 정보 수정</a>
        <a href="../quit.jsp">회원 탈퇴</a>
        <a href="../logout.jsp">로그아웃</a>
    </nav>
    <%
        String loginId = (String) session.getAttribute("memberId");
    %>
    <h2>
        로그인되었습니다. 환영합니다, <%=loginId%>님.
    </h2>
</body>
</html>
