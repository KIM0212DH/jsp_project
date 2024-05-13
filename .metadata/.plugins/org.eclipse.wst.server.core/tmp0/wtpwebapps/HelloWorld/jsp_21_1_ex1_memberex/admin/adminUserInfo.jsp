<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.jsplec.ex.jsp_weekend.UserDAO"%>
<%@page import="kr.co.jsplec.ex.jsp_weekend.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 조회</title>
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


    <h2>회원 정보 조회</h2>

    <table>
        <tr>
            <th>No</th>
            <th>ID</th>
            <th>Name</th>
            <th>Password</th>
            <th>Mobile</th>
            <th>Email</th>
            <th>Status</th>
            <th>User Type</th>
        </tr>
        <%
        String userId;
        String userPw;
        UserDTO loginUser = new UserDTO();
        UserDAO userConnection = new UserDAO();

        userId = (String) session.getAttribute("memberId");
        userPw = (String) session.getAttribute("memberPw");
        loginUser = userConnection.getUserInfo(userId, userPw);
        ArrayList<UserDTO> userList = userConnection.showUsersInfo(loginUser);
        if (userList != null) {
            for (UserDTO user : userList) {
                %>
                <tr>
                    <td><%= user.getNoUser() %></td>
                    <td><%= user.getIdUser() %></td>
                    <td><%= user.getNmUser() %></td>
                    <td><%= user.getNmPaswd() %></td>
                    <td><%= user.getNoMobile() %></td>
                    <td><%= user.getNmEmail() %></td>
                    <td><%= user.getStStatus() %></td>
                    <td><%= user.getCdUserType() %></td>
                </tr>
                <%
            }
        } else {
            out.println("<tr><td colspan='8'>권한이 없습니다.</td></tr>");
        }
        %>
    </table>
</body>
</html>
