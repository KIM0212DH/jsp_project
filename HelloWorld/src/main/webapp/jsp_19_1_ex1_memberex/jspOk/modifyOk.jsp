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

	Connection conn;
	ResultSet resultSet;

	String dbUrl = "jdbc:oracle:thin:@(description= (retry_count=20)(retry_delay=3)(address=(protocol=tcps)(port=1522)(host=adb.ap-seoul-1.oraclecloud.com))(connect_data=(service_name=g56e711c2a2b221_dinkdb_medium.adb.oraclecloud.com))(security=(ssl_server_dn_match=yes)))";
	String dbUser = "DA2401";
	String dbPassword = "Data2401";
	
	String loginId;
	String loginPw;

	String inputOldPassword;
	String inputNewPassword;
	String inputNewPasswordCheck;
	String inputNewPhonenumber;
	%>
	
	
	<%
	loginId = (String)session.getAttribute("memberId");
	loginPw = (String)session.getAttribute("memberPw");

	inputOldPassword = request.getParameter("password");
	inputNewPassword = request.getParameter("newpassword");
	inputNewPasswordCheck = request.getParameter("newpasswordcheck");
	inputNewPhonenumber = request.getParameter("newphonenum");
	
	
	
	if (inputNewPassword.equals(inputNewPasswordCheck) && inputOldPassword.equals(loginPw)){
		
		String updateSql = "update member set pw=" +"\'"+inputNewPassword+"\', phone1=\'"+inputNewPhonenumber+ "\'" +" where id=\'" + loginId +"\'";
		conn = null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			PreparedStatement pstmt = conn.prepareStatement(updateSql);

			int rows = pstmt.executeUpdate();
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} catch (ClassNotFoundException e) {
			System.out.println("Oracle JDBC 드라이버를 찾을 수 없습니다.");
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				conn.close();
			}
		}
		
		response.sendRedirect("modifyResult.jsp");
		session.setAttribute("memberPw", inputNewPassword);
	}
	else {
		response.sendRedirect("modify.jsp");
	}
	
	
	
	
	
	%>
</body>
</html>