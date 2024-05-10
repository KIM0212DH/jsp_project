package kr.co.jsplec.ex;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class jsp_7_1_ex1_formex
 */
@WebServlet("/jsp_7_1_ex1_formex")
public class jsp_7_1_ex1_formex extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public jsp_7_1_ex1_formex() {
        super();
        // TODO Auto-generated constructor stub
    }

//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html; charset=UTF-8");
	    request.setCharacterEncoding("UTF-8");

		String correctId = "abcde";
		String correctPW = "12345";
		
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        
        PrintWriter out = response.getWriter();
        
        
        if(id.equals(correctId) && password.equals(correctPW)) {
        	out.println("<html>");
            out.println("<head>");
            out.println("<title>Form Submission Result</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>로그인 성공</h1>");
            out.println("<p>ID: " + id + "</p>");
            out.println("<p>Password: " + password + "</p>");
            out.println("</body>");
            out.println("</html>");        
            }
        else {
        	out.println("<html>");
            out.println("<head>");
            out.println("<title>Form Submission Result</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>로그인 실패</h1>");
            out.println("<p>ID: " + id + "</p>");
            out.println("<p>Password: " + password + "</p>");
            out.println("</body>");
            out.println("</html>");        
            }
        
       
    }

}
