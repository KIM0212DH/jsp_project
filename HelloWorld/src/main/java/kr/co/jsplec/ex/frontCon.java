package kr.co.jsplec.ex;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.co.jsplec.ex.command_ex.MemberDTO;
import kr.co.jsplec.ex.command_ex.MembersAllService;
import kr.co.jsplec.ex.command_ex.Service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

/**
 * Servlet implementation class frontCon
 */
@WebServlet("*.do")
public class frontCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public frontCon() {
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
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		action(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		action(request, response);
	}

	protected void action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		String contextPath = "/HelloWorld/jsp_25_3_ex1_commex";
		String command = uri.substring(contextPath.length());

		System.out.println("uri : " + uri);
		System.out.println("conPath : " + contextPath);
		System.out.println("command : " + command);
		System.out.println("-----------------------------------------------------------");

		if (command.equals("/membersAll.do")) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter pw = response.getWriter();
			pw.println("<html><head><title>전체회원정보</title></head><body>");

			Service svc = new MembersAllService();
			ArrayList<MemberDTO> alMDto = svc.execute(request, response);

			for (int i = 0; i < alMDto.size(); i++) {
				MemberDTO mDto = alMDto.get(i);

				String no = mDto.getNoUser();
				String id = mDto.getIdUser();
				String name = mDto.getNmUser();
				String pwd = mDto.getNmPaswd();
				String mobile = mDto.getNoMobile();
				String eMail = mDto.getNmEmail();
				String status = mDto.getStStatus();
				String type = mDto.getCdUserType();

				pw.println(no + "," + id + "," + name + "," + pwd + "," + mobile + "," + eMail + "," + status + ","
						+ type + "<br/>");
			}
			pw.println("</body></html>");
		}

	}
}
