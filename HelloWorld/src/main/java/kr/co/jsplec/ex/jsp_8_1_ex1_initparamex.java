package kr.co.jsplec.ex;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebInitParam;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet(urlPatterns = {"/jsp_8_1_ex1_initparamex"}, initParams = {@WebInitParam(name="dbId", value="initId"),@WebInitParam(name="dbPwd", value="initPwd"),@WebInitParam(name="dbSid", value="initSid")})
public class jsp_8_1_ex1_initparamex extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public jsp_8_1_ex1_initparamex() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String dbName = getInitParameter("dbId");
		String dbPassword = getInitParameter("dbPwd");
		String sid = getInitParameter("dbSid");
		
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