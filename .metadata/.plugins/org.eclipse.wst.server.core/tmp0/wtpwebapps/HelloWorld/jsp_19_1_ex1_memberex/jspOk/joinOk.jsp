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
	<%!Connection conn;
	ResultSet resultSet;

	String dbUrl = "jdbc:oracle:thin:@(description= (retry_count=20)(retry_delay=3)(address=(protocol=tcps)(port=1522)(host=adb.ap-seoul-1.oraclecloud.com))(connect_data=(service_name=g56e711c2a2b221_dinkdb_medium.adb.oraclecloud.com))(security=(ssl_server_dn_match=yes)))";
	String dbUser = "DA2401";
	String dbPassword = "Data2401";

	String inputId;
	String inputPassword;
	String inputPasswordCheck;
	String inputName;
	String inputPhoneNum;
	String inputGender;%>
	<%
	inputId = request.getParameter("id");
	inputPassword = request.getParameter("password");
	inputPasswordCheck = request.getParameter("passwordcheck");
	inputName = request.getParameter("name");
	inputPhoneNum = request.getParameter("phonenum");
	inputGender = request.getParameter("gender");

	if (inputPassword != null && inputId != null && inputName != null && inputPhoneNum != null && inputGender != null
			&& inputPassword.equals(inputPasswordCheck)) {

		String insertSql = "insert into member(id, pw, name, phone1, gender) " + "values(?,?,?,?,?)";
		conn = null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			PreparedStatement pstmt = conn.prepareStatement(insertSql);
			pstmt.setString(1, inputId);
			pstmt.setString(2, inputPassword);
			pstmt.setString(3, inputName);
			pstmt.setString(4, inputPhoneNum);
			pstmt.setString(5, inputGender);
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
		response.sendRedirect("joinResult.jsp");
	} else {
		response.sendRedirect("join.html");
	}
	%>




</body>
</html>