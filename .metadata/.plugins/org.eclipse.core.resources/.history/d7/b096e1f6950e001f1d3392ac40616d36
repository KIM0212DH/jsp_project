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

	<%!
	Connection conn;
	ResultSet resultSet;

	String dbUrl = "jdbc:oracle:thin:@(description= (retry_count=20)(retry_delay=3)(address=(protocol=tcps)(port=1522)(host=adb.ap-seoul-1.oraclecloud.com))(connect_data=(service_name=g56e711c2a2b221_dinkdb_medium.adb.oraclecloud.com))(security=(ssl_server_dn_match=yes)))";
	String dbUser = "DA2401";
	String dbPassword = "Data2401";
	
	
	String loginId;
	String loginPw;
	%>
	<%
	loginId = (String) session.getAttribute("memberId");
	loginPw = (String) session.getAttribute("memberPw");
	%>

	<h2><%=loginId %>의 정보가 수정되었습니다.</h2>
	
	<%
	

	String selectSql = "select id,pw,name,phone1,gender from member where id=\'" + loginId + "\' and " + "pw=\'" + loginPw +"\'";
	conn = null;
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		PreparedStatement pstmt = conn.prepareStatement(selectSql);
		ResultSet rs = pstmt.executeQuery();
		
		
		while (rs.next()) {
			out.println("수정 결과<br>");
			out.println("-----------------------------<br>");
			out.println("id: " + rs.getString(1) + "<br>");
			out.println("pw: " + rs.getString(2) + "<br>");
			out.println("name: " + rs.getString(3) + "<br>");
			out.println("phone1: " + rs.getString(4) + "<br>");
			out.println("gender: " + rs.getString(5) + "<br>");
			
		}
				
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
	
	
	
	%>
	<br><br>
<a href="modify.jsp">수정</a>
<a href="logout.jsp">로그아웃</a>	
</body>
</html>