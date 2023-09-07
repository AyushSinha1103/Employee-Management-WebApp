

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet(
		urlPatterns = { "/Login" }, 
		initParams = { 
				@WebInitParam(name = "user", value = "admin"), 
				@WebInitParam(name = "pass", value = "1234")
		})
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletConfig cg = getServletConfig();
		String user = cg.getInitParameter("user");
		String pass = cg.getInitParameter("pass");
		String uname = request.getParameter("USERNAME");
		String pswd = request.getParameter("PASSWORD");
		if(uname.equals(user) && pswd.equals(pass)) {
			HttpSession session = request.getSession();
			session.setAttribute("username", user);
			response.sendRedirect("Dashboard.jsp");
		}
		else {
			response.sendRedirect("login.jsp");
		}
		
	}

}
