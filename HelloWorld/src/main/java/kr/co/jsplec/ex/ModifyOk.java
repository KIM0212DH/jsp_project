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
 * Servlet implementation class ModifyOk
 */
@WebServlet("/jsp_19_1_ex1_memberex/ModifyOk")
public class ModifyOk extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ModifyOk() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
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
		
		HttpSession session = request.getSession();
		
		loginId = (String) session.getAttribute("memberId");
		loginPw = (String) session.getAttribute("memberPw");

		inputOldPassword = request.getParameter("password");
		inputNewPassword = request.getParameter("newpassword");
		inputNewPasswordCheck = request.getParameter("newpasswordcheck");
		inputNewPhonenumber = request.getParameter("newphonenum");

		if (inputNewPassword.equals(inputNewPasswordCheck) && inputOldPassword.equals(loginPw)) {

			String updateSql = "update member set pw=" + "\'" + inputNewPassword + "\', phone1=\'" + inputNewPhonenumber
					+ "\'" + " where id=\'" + loginId + "\'";
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
					try {
						conn.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}

			response.sendRedirect("modifyResult.jsp");
			session.setAttribute("memberPw", inputNewPassword);
		} else {
			response.sendRedirect("modify.jsp");
		}

	}

}
