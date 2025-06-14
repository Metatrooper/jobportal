package backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Register extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();
		
		String name2=req.getParameter("name1");
		String email2=req.getParameter("email1");
		String pass2=req.getParameter("pass1");
		String gender2=req.getParameter("gender1");
		String [] field2=req.getParameterValues("field1");
		String city2=req.getParameter("city1");
		
//		String fields2="";
//		if (field2 !=null) {
//			for(String s:field2) {
//				fields2=s+","+fields2;
//			}
//		}
//		else {fields2="none";}
		String fields2 = (field2 != null) ? String.join(",", field2) : "None";
				
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","root");
			PreparedStatement ps=con.prepareStatement("insert into register(name,email,password,gender,field,city) values (?,?,?,?,?,?)");
			ps.setString(1, name2);
			ps.setString(2, email2);
			ps.setString(3, pass2);
			ps.setString(4, gender2);
			ps.setString(5, fields2);
			ps.setString(6, city2);
			int i1=ps.executeUpdate();
			System.out.println("Register Insert: " + i1);
			
			PreparedStatement ps2=con.prepareStatement("insert into about_user(email,about,skills)values(?,?,?)");
			ps2.setString(1, email2);
			ps2.setString(2, "");
			ps2.setString(3, "");
			int i2=ps2.executeUpdate();
			System.out.println("About_user Insert: " + i2);
			
			if(i1>0 && i2>0) {
				HttpSession session=req.getSession();
				session.setAttribute("session_name", name2);
				session.setAttribute("session_email", email2);
                session.setAttribute("session_gender", gender2);
                session.setAttribute("session_city", city2);
                session.setAttribute("session_fields", field2);
                
                session.setAttribute("session_title", "");
                session.setAttribute("session_skills", "");
				resp.sendRedirect("profile.jsp");
			}
			else
			{
				out.println("failed");
			}
		}catch(Exception e)
		{
			   e.printStackTrace();  // for server logs
			   out.println("<h3 style='color:red;'>Exception: " + e.getMessage() + "</h3>");
		}
	}
}
