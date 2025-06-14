package backend;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;

public class ValidationFilter implements Filter {

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		String name2 = req.getParameter("name1");
		String email2 = req.getParameter("email1");
		String pass2 = req.getParameter("pass1");
		String gender2 = req.getParameter("gender1");
		String[] field2 = req.getParameterValues("field1");
		String city2 = req.getParameter("city1");

		Validation validation = new Validation(); // this will compile regex pattern as per property of constructor

		if (!validation.nameValidate(name2)) {
			RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
			rd.include(req, resp);
		} else if (!validation.emailValidate(email2)) {
			RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
			rd.include(req, resp);
		} else if (!validation.passwordValidate(pass2)) {
			RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
			rd.include(req, resp);
		} else if (gender2 == null || gender2.equals("")) {
			RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
			rd.include(req, resp);
		} else if (field2 == null || field2.equals("")) {
			RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
			rd.include(req, resp);
		} else if (city2.equals("Select city:")) {
			RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
			rd.include(req, resp);
		} else {
			chain.doFilter(req, resp); // this will redirect to next process/page
		}
	}

}
