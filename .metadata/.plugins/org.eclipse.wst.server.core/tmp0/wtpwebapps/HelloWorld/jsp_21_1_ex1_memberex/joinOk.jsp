<%@page import="kr.co.jsplec.ex.jsp_weekend.UserDTO"%>
<%@page import="kr.co.jsplec.ex.jsp_weekend.UserDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
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

	<%!UserDTO newUserDTO = new UserDTO();
	UserDAO userConnection = new UserDAO();

	String inputId;
	String inputPassword;
	String inputPasswordCheck;
	String inputName;
	String inputPhoneNum;
	String inputEmail;%>
	<%
	inputId = request.getParameter("id");
	inputPassword = request.getParameter("password");
	inputPasswordCheck = request.getParameter("passwordcheck");
	inputName = request.getParameter("name");
	inputPhoneNum = request.getParameter("phonenum");
	inputEmail = request.getParameter("email");

	newUserDTO.setIdUser(inputId);
	newUserDTO.setNmPaswd(inputPassword);
	newUserDTO.setNmUser(inputName);
	newUserDTO.setNoMobile(inputPhoneNum);
	newUserDTO.setNmEmail(inputEmail);

	if (inputPassword != null && inputId != null && inputName != null && inputPhoneNum != null && inputEmail != null
			&& inputPassword.equals(inputPasswordCheck)) {
		if (userConnection.checkIdValid(newUserDTO) && userConnection.checkValidPassword(newUserDTO)) {
			userConnection.insertUser(newUserDTO);
			response.sendRedirect("joinResult.jsp");

		} else {
			response.sendRedirect("join.html");
		}
	} else {

		response.sendRedirect("join.html");
	}
	%>



</body>
</html>