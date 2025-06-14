package backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Login extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();

		String email2 = req.getParameter("email1");
		String pass2 = req.getParameter("pass1");
		String rememberme2 = req.getParameter("rememberme1");
		String name2="",gender2="",field2="",city2="";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", "root");
			PreparedStatement ps = con.prepareStatement("select * from register where email=? and password=?");
			ps.setString(1, email2);
			ps.setString(2, pass2);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				name2=rs.getString("name");
				gender2=rs.getString("gender");
				field2=rs.getString("field");
				city2=rs.getString("city");
				
				HttpSession session=req.getSession();
				session.setAttribute("session_name", name2);
				session.setAttribute("session_email", email2);
				session.setAttribute("session_gender", gender2);
				session.setAttribute("session_field", field2);
				session.setAttribute("session_city", city2);
				
				String title2="",skills2="";
				PreparedStatement ps2=con.prepareStatement("Select * from about_user where email=?");
				ps2.setString(1, email2);
				ResultSet rs2=ps2.executeQuery();
				while(rs2.next()) {
					title2=rs2.getString("about");
					skills2=rs2.getString("skills");
				}
				session.setAttribute("session_title", title2);
				session.setAttribute("session_skills", skills2);
				resp.sendRedirect("profile.jsp");
				
			} else {
				RequestDispatcher rd1 = req.getRequestDispatcher("header.jsp");
				rd1.include(req, resp);
				RequestDispatcher rd2 = req.getRequestDispatcher("menubar.jsp");
				rd2.include(req, resp);
				RequestDispatcher rd4 = req.getRequestDispatcher("loginerror.jsp");
				rd4.include(req, resp);
				RequestDispatcher rd3 = req.getRequestDispatcher("logindiv.jsp");
				rd3.include(req, resp);
				RequestDispatcher rd5 = req.getRequestDispatcher("footer.jsp");
				rd5.include(req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
