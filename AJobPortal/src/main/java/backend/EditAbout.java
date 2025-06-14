package backend;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class EditAbout extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		String email2=(String)session.getAttribute("session_email");
		String name2=req.getParameter("name1");
		String city2=req.getParameter("city1");
		String gender2=req.getParameter("gender1");
		String title2=req.getParameter("title1");
		String skills2=req.getParameter("skills1");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","root");
			PreparedStatement ps1=con.prepareStatement("update register set name=?,city=?,gender=? where email=?");
			ps1.setString(1, name2);
			ps1.setString(2, city2);
			ps1.setString(3, gender2);
			ps1.setString(4, email2);
			int i1=ps1.executeUpdate();
			
			PreparedStatement ps2=con.prepareStatement("update about_user set skills=?,about=? where email=?");
			ps2.setString(1, skills2);
			ps2.setString(2, title2);
			ps2.setString(3, email2);
			int i2=ps2.executeUpdate();
			
			if(i1>0 && i2>0) {
				session.setAttribute("session_name", name2);
				session.setAttribute("session_email", email2);
				session.setAttribute("session_gender", gender2);
				session.setAttribute("session_city", city2);
				session.setAttribute("session_skills", skills2);
				session.setAttribute("session_title", title2);
				resp.sendRedirect("profile.jsp");
			}
			else {
				RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
				rd1.include(req, resp);
				RequestDispatcher rd2=req.getRequestDispatcher("edit-profile-about.jsp");
				rd2.include(req, resp);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}
}
