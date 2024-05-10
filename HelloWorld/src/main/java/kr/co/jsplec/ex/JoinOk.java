package kr.co.jsplec.ex;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class JoinOk
 */
@WebServlet("/jsp_19_1_ex1_memberex/JoinOk")
public class JoinOk extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public JoinOk() {
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

		String inputId;
		String inputPassword;
		String inputPasswordCheck;
		String inputName;
		String inputPhoneNum;
		String inputGender;

		inputId = request.getParameter("id");
		inputPassword = request.getParameter("password");
		inputPasswordCheck = request.getParameter("passwordcheck");
		inputName = request.getParameter("name");
		inputPhoneNum = request.getParameter("phonenum");
		inputGender = request.getParameter("gender");

		if (inputPassword != null && inputId != null && inputName != null && inputPhoneNum != null
				&& inputGender != null && inputPassword.equals(inputPasswordCheck)) {

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
					try {
						conn.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			response.sendRedirect("joinResult.jsp");
		} else {
			response.sendRedirect("join.html");
		}

	}

}
