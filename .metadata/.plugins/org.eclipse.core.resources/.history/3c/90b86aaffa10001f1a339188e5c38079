<%@page import="kr.co.jsplec.ex.jsp_weekend.UserDAO"%>
<%@page import="kr.co.jsplec.ex.jsp_weekend.UserDTO"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
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
	UserDTO loginUserDTO = new UserDTO();
	UserDAO userConnection = new UserDAO();

	String inputId;
	String inputPassword;


	String loginType;
	%>

	<%
	
	inputId = request.getParameter("id");
	inputPassword = request.getParameter("password");
	
	loginUserDTO.setIdUser(inputId);
	loginUserDTO.setNmPaswd(inputPassword);
	
	
	loginType = userConnection.loginUser(loginUserDTO);
	loginUserDTO = userConnection.getUserInfo(inputId, inputPassword);
	if (!loginType.isEmpty() && loginUserDTO.getStStatus().equals("ST01")) {
		session.setAttribute("memberId", loginUserDTO.getIdUser());
		session.setAttribute("memberPw", loginUserDTO.getNmPaswd());
		session.setMaxInactiveInterval(60 * 60);
		if (loginType.equals("20"))
			response.sendRedirect("admin/adminMain.jsp");
		else
			response.sendRedirect("user/userMain.jsp");
	} else {
		response.sendRedirect("login.html");
	}
	%>
</body>
</html>