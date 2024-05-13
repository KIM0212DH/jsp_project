package kr.co.jsplec.ex.jsp_weekend;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class UserDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	// 데이터베이스 연결 메소드
	private Connection getConnection() throws NamingException, SQLException {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle");
		return ds.getConnection();
	}

	// 데이터베이스 연결 해제 메소드
	private void closeConnection(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void insertUser(UserDTO newUserDTO) {

		try {
			conn = getConnection();

			String insertUser = "insert into TB_USER(no_user, id_user, nm_user, nm_passwd, no_mobile, nm_email, st_status, cd_user_type)"
					+ " values('PD'||LPAD(seq_tb_user.nextval, 5,'0'), ?,?,?,?,?,'ST01','10')";
			try {
				pstmt = conn.prepareStatement(insertUser);
				pstmt.setString(1, newUserDTO.getIdUser());
				pstmt.setString(2, newUserDTO.getNmUser());
				pstmt.setString(3, newUserDTO.getNmPaswd());
				pstmt.setString(4, newUserDTO.getNoMobile());
				pstmt.setString(5, newUserDTO.getNmEmail());
				int rows = pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(conn, pstmt, rs);
		}
	}

	public boolean checkIdValid(UserDTO newUserDTO) {
		boolean ret = true;

		if (newUserDTO.getNmUser().length() >= 5 && newUserDTO.getNmUser().length() <= 15) {
			for (int i = 0; i < newUserDTO.getNmUser().length(); ++i) {
				char c = newUserDTO.getNmUser().charAt(i);
				if ((c < 'a' || c > 'z') && (c < 'A' || c > 'Z') && (c < '0' || c > '9')) {
					System.out.println("허용된 숫자나 영어가 아닙니다.");
					ret = false;
				}
			}
		} else {
			System.out.println("허용된 길이의 id가 아닙니다.");
			ret = false;
		}

		try {
			conn = getConnection();

			String selectUserSql = "select id_user from tb_user where id_user = ?";

			try {
				pstmt = conn.prepareStatement(selectUserSql);
				pstmt.setString(1, newUserDTO.getIdUser());
				rs = pstmt.executeQuery();
				if (rs.next()) {
					ret = false;
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(conn, pstmt, rs);
		}
		return ret;
	}

	public boolean checkValidPassword(UserDTO newUserDTO) {
		boolean ret = true;
		if (newUserDTO.getNmPaswd().length() <= 15) {
			int upperCnt = 0;
			int lowerCnt = 0;
			int numCnt = 0;

			for (int i = 0; i < newUserDTO.getNmPaswd().length(); ++i) {
				char c = newUserDTO.getNmPaswd().charAt(i);
				if (c >= 'a' && c <= 'z') {
					++lowerCnt;
				}

				if (c >= 'A' && c <= 'Z') {
					++upperCnt;
				}

				if (c >= '0' && c <= '9') {
					++numCnt;
				}
			}

			if (upperCnt != 0 && lowerCnt != 0 && numCnt != 0) {
				ret = true;
			} else {
				System.out.println("영어 대소문자, 숫자 입력이 필요합니다.");
				ret = false;
			}
		} else {
			System.out.println("허용된 길이의 password가 아닙니다.");
			ret = false;
		}
		return ret;
	}

	public String loginUser(UserDTO loginUser) {
		String loginType = "";
		try {
			conn = getConnection();
			String selectUser = "select id_user, nm_passwd, cd_user_type, st_status from tb_user "
					+ " where id_user=? and nm_passwd=?";
			try {
				pstmt = conn.prepareStatement(selectUser);
				pstmt.setString(1, loginUser.getIdUser());
				pstmt.setString(2, loginUser.getNmPaswd());
				rs = pstmt.executeQuery();
				while (rs.next()) {
					loginType = rs.getString(3);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(conn, pstmt, rs);
		}
		return loginType;
	}
	
	public UserDTO getUserInfo(String userId, String userPw) {
		UserDTO ret = new UserDTO();
		try {
			conn = getConnection();
			String selectUser = "select id_user, nm_passwd, cd_user_type, st_status, no_user, no_mobile, nm_email from tb_user "
					+ " where id_user=? and nm_passwd=?";
			try {
				pstmt = conn.prepareStatement(selectUser);
				pstmt.setString(1, userId);
				pstmt.setString(2, userPw);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					ret.setIdUser(rs.getString(1));
					ret.setNmPaswd(rs.getString(2));
					ret.setCdUserType(rs.getString(3));
					ret.setStStatus(rs.getString(4));
					ret.setNoUser(rs.getString(5));
					ret.setNoMobile(rs.getString(6));
					ret.setNmEmail(rs.getString(7));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(conn, pstmt, rs);
		}
		return ret;
	}
	
	public void quitAccount(UserDTO loginUser) {
		loginUser.setStStatus("ST02");
		try {
			conn = getConnection();
			String updateUser = "update tb_user set st_status = 'ST02' "
					+ " where id_user=? and nm_passwd=?";
			try {
				pstmt = conn.prepareStatement(updateUser);
				pstmt.setString(1, loginUser.getIdUser());
				pstmt.setString(2, loginUser.getNmPaswd());
				int rows = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(conn, pstmt, rs);
		}
	}
	
	public ArrayList<UserDTO> showUsersInfo(UserDTO loginUser) {
		ArrayList<UserDTO> ret = new ArrayList<UserDTO>();
		if (loginUser.getCdUserType().equals("20")) {
			try {
				conn = getConnection();
				String selectUser = "select no_user, id_user, nm_user, nm_passwd, no_mobile, nm_email, st_status, cd_user_type from tb_user order by 1";
				try {
					pstmt = conn.prepareStatement(selectUser);
					rs = pstmt.executeQuery();
					while (rs.next()) {
						UserDTO user = new UserDTO();
						user.setNoUser(rs.getString(1));
						user.setIdUser(rs.getString(2));
						user.setNmUser(rs.getString(3));
						user.setNmPaswd(rs.getString(4));
						user.setNoMobile(rs.getString(5));
						user.setNmEmail(rs.getString(6));
						user.setStStatus(rs.getString(7));
						user.setCdUserType(rs.getString(8));
						ret.add(user);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeConnection(conn, pstmt, rs);
			}
			return ret;
		}
		else {
			System.out.println("권한이 없습니다.");
			return null;
		}
	}

	public void modifyMyInfo(UserDTO loginUser, String inputNewPassword, String inputNewPhoneNumber, String inputNewEmail) {
		try {
			conn = getConnection();
			String modifySql = "update tb_user set nm_passwd=?, no_mobile=?, nm_email=? where id_user=? and nm_passwd=?";

			try {
				pstmt = conn.prepareStatement(modifySql);
				pstmt.setString(1, inputNewPassword);
				pstmt.setString(2, inputNewPhoneNumber);
				pstmt.setString(3, inputNewEmail);		
				pstmt.setString(4, loginUser.getIdUser());
				pstmt.setString(5, loginUser.getNmPaswd());
				int rows = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(conn, pstmt, rs);
		}
	}
	
	public void adminModifyUserInfo(String changeNo, String changeAuth, String changeStatus) {
		try {
			conn = getConnection();
			String modifySql = "update tb_user set st_status=?, cd_user_type=? where no_user=?";

			try {
				pstmt = conn.prepareStatement(modifySql);
				pstmt.setString(1, changeStatus);
				pstmt.setString(2, changeAuth);
				pstmt.setString(3, changeNo);		
				int rows = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(conn, pstmt, rs);
		}
	}
	
	

	public void doWork() {
		try {
			conn = getConnection();
			// Example SQL query: replace with your actual query
			String sql = "SELECT * FROM tb_user";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			String targetId = "";
			String targetPW = "";
			String targetType = "";
			String targetNo = "";
			String targetNM = "";
			while (rs.next()) {
				targetId = rs.getString(1);
				targetPW = rs.getString(2);
				targetType = rs.getString(3);
				targetNo = rs.getString(4);
				targetNM = rs.getString(5);
				System.out.println(targetId);
			}
			// Process the ResultSet here

		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		} finally {
			closeConnection(conn, pstmt, rs);
		}
	}

}
