<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.beans.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
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
	Connection conn;
	Statement statement;
	ResultSet resultSet;

	String dbUrl = "jdbc:oracle:thin:@(description= (retry_count=20)(retry_delay=3)(address=(protocol=tcps)(port=1522)(host=adb.ap-seoul-1.oraclecloud.com))(connect_data=(service_name=g56e711c2a2b221_dinkdb_medium.adb.oraclecloud.com))(security=(ssl_server_dn_match=yes)))";
	String dbUser = "DA2401";
	String dbPassword = "Data2401";

	String query = "select * from TB_USER";
	%>
	<%
	conn = null;
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		PreparedStatement pstmt = conn.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {
			out.println("-----------------------------<br>");
			out.println("번호: " + rs.getString(1) + "<br>");
			out.println("아이디: " + rs.getString(2) + "<br>");
			out.println("이름: " + rs.getString(3) + "<br>");
			out.println("비밀번호: " + rs.getString(4) + "<br>");
			out.println("휴대폰: " + rs.getString(6) + "<br>");
			out.println("이메일: " + rs.getString(7) + "<br><br>");
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
	%>
</body>
</html>