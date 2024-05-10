package kr.co.jsplec.ex;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class jsp_8_2_ex1_contextparamex
 */


@WebServlet("/jsp_8_2_ex1_contextparamex")
public class jsp_8_2_ex1_contextparamex extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public jsp_8_2_ex1_contextparamex() {
        super();
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
		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String dbName = getServletContext().getInitParameter("dbId");
		String dbPassword = getServletContext().getInitParameter("dbPwd");
		String sid = getServletContext().getInitParameter("dbSid");
		
		
		 PrintWriter out = response.getWriter();
		    out.println("<html>");
		    out.println("<head>");
		    out.println("<title>Initialization Parameters</title>");
		    out.println("</head>");
		    out.println("<body>");
		    out.println("<h1>Initialization Parameters</h1>");
		    out.println("<p>DB Name: " + dbName + "</p>");
		    out.println("<p>DB Password: " + dbPassword + "</p>");
		    out.println("<p>Path: " + sid + "</p>");
		    out.println("</body>");
		    out.println("</html>");
		}

}
