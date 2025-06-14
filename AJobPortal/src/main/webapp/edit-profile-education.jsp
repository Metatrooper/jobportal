<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%!String school="",degree="",year="",grade="",description=""; %>
	<%
	String name = (String) session.getAttribute("session_name");
	String gender = (String) session.getAttribute("session_gender");
	String city = (String) session.getAttribute("session_city");
	String field = (String) session.getAttribute("session_field");
	String title = (String) session.getAttribute("session_title");
	String skills = (String) session.getAttribute("session_skills");
	if (skills == null || skills.equals("")) {
		skills="";
	}
	if (title == null || title.equals("")) {
		title = "";
	}

	if (name == null || name.equals("")) {
		response.sendRedirect("login.jsp");
	}
	
	String id=request.getParameter("id");
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","root");
		PreparedStatement ps=con.prepareStatement("select * from education where id=?");
		ps.setString(1, id);
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			school=rs.getString(3);
			degree=rs.getString(4);
			year=rs.getString(5);
			grade=rs.getString(6);
			description=rs.getString(7);
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	%>	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>edit-profile-education</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css" />

</head>
<body>
	<jsp:include page="profileHeader.jsp"></jsp:include>
	<jsp:include page="menubar.jsp"></jsp:include>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="row" style="border:1px solid grey;box-shadow:0px 0px 2px grey">
				<div class="col-md-2">
					<img src="images/Logo.png" height=100px />
				</div>
				<div class="col-md-10">
					<h3>Edit Education Details:</h3><br>
					<form method="post" action="edit_education">
					<input type="hidden" name="id1" value="<%=id%>"/>
					School/College:<br><input type="text" name="school1" value="<%=school%>" class="textfield_design"/><br><br>
					Degree:<br><input type="text"   placeholder="e.g SSC or B.E" name="degree1" value="<%=degree%>" class="textfield_design"/><br><br>
					Year:<br><input type="text" placeholder="e.g 2016-2020" name="year1" value="<%=year%>"class="textfield_design"/><br><br>
					Grade:<br><input type="text" name="grade1" class="textfield_design" value="<%=grade%>" placeholder="e.g 76" /><br><br>
					Description:<br><textarea placeholder="certifications, Achievement,volunteers,etc." name="description1" class="textarea_design"><%=description%></textarea><br><br>
					<input type="submit" value="Update Education" class="btn btn-danger"/>
					</form>
				</div>
			</div>
			
		</div>
		<div class="col-md-2"></div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>