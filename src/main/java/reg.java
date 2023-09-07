
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

@WebServlet("/reg")
public class reg extends HttpServlet 
{
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
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	 {
			// TODO Auto-generated method stub
		 	PrintWriter out = response.getWriter();
		    String usn = request.getParameter("id");
			String name = request.getParameter("nm");
			int salary = Integer.parseInt(request.getParameter("sal"));
			String dob= request.getParameter("dob");
			String address= request.getParameter("add");
			String desg= request.getParameter("desg");
			String pn = request.getParameter("pn");
			String gend = request.getParameter("gen");
			String sid = request.getParameter("sid");
			
			try
			        {
						con = getConnect();
			            Statement st = con.createStatement();
			            String query;
			            if(!sid.isEmpty())
			            	query = "insert into employee values('"+usn+"','"+name+"','"+salary+"','"+dob+"','"+address+"','"+desg+"','"+pn+"','"+gend+"','"+sid+"')";
			            else
			            	query = "insert into employee values('"+usn+"','"+name+"','"+salary+"','"+dob+"','"+address+"','"+desg+"','"+pn+"','"+gend+"',null)";
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

