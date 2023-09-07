

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/delemp")
public class delemp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Connection con = null;
    
    public Connection getConnect(){
        try{
        	Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/java","root","ayush");
        }
        catch(Exception e){

            System.out.println(e);
        }
        return con;
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String eid = request.getParameter("eid");
		PrintWriter out = response.getWriter();
		if(eid.isEmpty())
			response.sendRedirect("Dashboard.html");
		else {
			try
	        {	
	        	con = getConnect();
	            Statement st = con.createStatement();
	            String query = "delete from employee where empid = '"+eid+"'";
	            int i = st.executeUpdate(query);
	            if(i == 1) {
	            	response.sendRedirect("success.jsp");
	            }
	            else {
	            	response.sendRedirect("failed.jsp");
	            }
	            
	            con.close();
	        }
	        catch(Exception e){
	        	response.sendRedirect("failed.jsp");
	       
	        }
		}
	}

}
