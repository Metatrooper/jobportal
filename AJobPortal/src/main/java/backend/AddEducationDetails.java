package backend;

import java.io.IOException;
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

public class AddEducationDetails extends HttpServlet {
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	HttpSession session=req.getSession();
	String email2=(String)session.getAttribute("session_email");
	String school2=req.getParameter("school1");
	String degree2=req.getParameter("degree1");
	String year2=req.getParameter("year1");
	String grade2=req.getParameter("grade1");
	String description2=req.getParameter("description1");
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","root");
		PreparedStatement ps1=con.prepareStatement("insert into education (email,school,degree,year,grade,description)values(?,?,?,?,?,?)");
		ps1.setString(1, email2);
		ps1.setString(2, school2);
		ps1.setString(3, degree2);
		ps1.setString(4, year2);
		ps1.setString(5, grade2);
		ps1.setString(6, description2);
		int i1=ps1.executeUpdate();
		
		if(i1>0) {
			resp.sendRedirect("profile.jsp");
		}
		else {
			RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
			rd1.include(req, resp);
			RequestDispatcher rd2=req.getRequestDispatcher("add-profile-education.jsp");
			rd2.include(req, resp);
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
}
}
