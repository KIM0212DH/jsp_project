<%@page import="kr.co.jsplec.ex.jsp_weekend.UserDAO"%>
<%@page import="kr.co.jsplec.ex.jsp_weekend.UserDTO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
	String loginId;
	String loginPw;

	String inputOldPassword;
	String inputNewPassword;
	String inputNewPasswordCheck;
	String inputNewPhoneNumber;
	String inputNewEmail;
	
	UserDTO loginUser = new UserDTO();
	UserDAO userConnection = new UserDAO();
	%>
	
	
	<%
	loginId = (String)session.getAttribute("memberId");
	loginPw = (String)session.getAttribute("memberPw");
	loginUser = userConnection.getUserInfo(loginId, loginPw);


	inputOldPassword = request.getParameter("password");
	inputNewPassword = request.getParameter("newpassword");
	inputNewPasswordCheck = request.getParameter("newpasswordcheck");
	inputNewPhoneNumber = request.getParameter("newphonenum");
	inputNewEmail = request.getParameter("newemail");
	
	
	if (inputNewPassword.equals(inputNewPasswordCheck) && inputOldPassword.equals(loginPw)){
		userConnection.modifyMyInfo(loginUser, inputNewPassword, inputNewPhoneNumber, inputNewEmail);		
		session.setAttribute("memberPw", inputNewPassword);
		response.sendRedirect("adminAdminInfo.jsp");
	}
	else {
		response.sendRedirect("adminMyModifyOk.jsp");
	}
	
	
	
	
	
	%>
</body>
</html>