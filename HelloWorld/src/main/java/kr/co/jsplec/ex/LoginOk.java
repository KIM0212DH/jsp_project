package kr.co.jsplec.ex;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class LoginOk
 */
@WebServlet("/jsp_19_1_ex1_memberex/LoginOk")
public class LoginOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginOk() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn;
		ResultSet resultSet;

		String dbUrl = "jdbc:oracle:thin:@(description= (retry_count=20)(retry_delay=3)(address=(protocol=tcps)(port=1522)(host=adb.ap-seoul-1.oraclecloud.com))(connect_data=(service_name=g56e711c2a2b221_dinkdb_medium.adb.oraclecloud.com))(security=(ssl_server_dn_match=yes)))";
		String dbUser = "DA2401";
		String dbPassword = "Data2401";

		String inputId;
		String inputPassword;
		
		String loginId = "";
		String loginPw = "";
		
		boolean loginSuccess = false;
		
		inputId = request.getParameter("id");
		inputPassword = request.getParameter("password");


		String selectSql = "select id,pw,name,phone1,gender from member where id=\'" + inputId + "\' and " + "pw=\'" + inputPassword +"\'";
		conn = null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			PreparedStatement pstmt = conn.prepareStatement(selectSql);
			ResultSet rs = pstmt.executeQuery();
			loginSuccess = false;
			
			
			while (rs.next() && !loginSuccess) {
				System.out.println("-----------------------------");
				System.out.println("id: " + rs.getString(1));
				System.out.println("pw: " + rs.getString(2));
				System.out.println("name: " + rs.getString(3));
				System.out.println("phone1: " + rs.getString(4));
				System.out.println("gender: " + rs.getString(5));
				loginId = rs.getString(1);
				loginPw = rs.getString(2);
				loginSuccess = true;
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
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		System.out.println("loginSuccess: " + loginSuccess);
		if (loginSuccess) {
			HttpSession session = request.getSession();
			session.setAttribute("memberId", loginId);
			session.setAttribute("memberPw", loginPw);
			session.setMaxInactiveInterval(60 * 60);
	 		response.sendRedirect("loginResult.jsp?id="+inputId);
		}
		else {
	 		response.sendRedirect("login.html");
		}
	}

}
