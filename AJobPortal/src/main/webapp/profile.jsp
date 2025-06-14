<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String name = (String) session.getAttribute("session_name");
	String gender = (String) session.getAttribute("session_gender");
	String city = (String) session.getAttribute("session_city");
	String field = (String) session.getAttribute("session_field");
	if(field==null || field.equals(""))
		field="-- Not availabel --";
	String title = (String) session.getAttribute("session_title");
	String skills = (String) session.getAttribute("session_skills");
	if (name == null || name.equals("")) {
		response.sendRedirect("login.jsp");
	}
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome <%=name%></title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
</head>
<body>
	<jsp:include page="profileHeader.jsp"></jsp:include>
	<jsp:include page="menubar.jsp"></jsp:include>
	
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8"> 
		<!------------------------------- Profile portion start ------------------------------------------------->
			<div class="row" style="border:1px solid grey;box-shadow:0px 0px 2px grey">
				<div class="col-md-2">
					<img src="images/Logo.png" height=100px />
				</div>
				<div class="col-md-10">
					<h3 style="color:blue;"><%=name.toUpperCase()%><span style="color:green;font-size:16px;float:right"><a href="edit-profile-about.jsp" class="bi bi-pencil"></a></span></h3>
					<%=title %><br><br>
					<span class="profile_details_title">Skills:</span><%=skills %><br>
					<span class="profile_details_title">Gender:</span><%=gender%><br>
					<span class="profile_details_title">City:</span><%=city%><br>
					<span class="profile_details_title">Fields:</span><%=field%><br>
				</div>
			</div><br><br>
			<!------------------------------- Profile portion ends ,Education details started ------------------------------------------------->
			<div class="row" style="border:1px solid grey;box-shadow:0px 0px 2px grey">
				<div class="col-md-12">
					<h4>Education Details<span style="color:green;font-weight:bolder;float:right"><a href="add-profile-education.jsp" class="bi bi-plus"></a></span></h4>
					<%
					String school="",degree="",year="",grade="",id="";
					try{
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","root");
					PreparedStatement ps=con.prepareStatement("select * from education where email=?");
					ps.setString(1, (String)session.getAttribute("session_email"));
					ResultSet rs=ps.executeQuery();
					while(rs.next()){
						id=rs.getString(1);
						school=rs.getString(3);
						degree=rs.getString(4);
						year=rs.getString(5);
						grade=rs.getString(6);
						%>
					<div class="row" style="background-color: #f0f0f5;">
					<div class="col-md-2">
					<img src="images/school.png" height=60px/>
					</div>
					<div class="col-md-10">
					<!-- url-rewritting session tracking mechanism where here we embedding id of each education detail record -->
					<span style="color:green;font-size:16px;float:right"><a href="edit-profile-education.jsp?id=<%=id%>" class="bi bi-pencil"></a></span>
					<span class="bi bi-building"> </span><b><%=school %></b><br>
					<span class="bi bi-trophy"> </span><%=grade %>%<br>
					<span class="bi bi-file-earmark"> </span><%=degree %><span style="color:grey;">(<%=year %>)</span><br>
					</div><br>
					</div>	
						<%
					}
					}catch(Exception e)
					{e.printStackTrace();}
					%>
				</div>
			</div><br><br>
			<!------------------------------- education details end,Experience portion start ------------------------------------------------->
			<div class="row" style="border:1px solid grey;box-shadow:0px 0px 2px grey">
				<div class="col-md-12">
					<h4>Experience Details<span style="color:green;font-weight:bolder;float:right"><a href="add-profile-experience.jsp" class="bi bi-plus"></a></span></h4>
					<%
					String company1="",location1="",year1="",jobtitle1="",id1="";
					try{
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","root");
					PreparedStatement ps=con.prepareStatement("select * from experience where email=?");
					ps.setString(1, (String)session.getAttribute("session_email"));
					ResultSet rs=ps.executeQuery();
					while(rs.next()){
						id1=rs.getString(1);
						company1=rs.getString(3);
						location1=rs.getString(4);
						year1=rs.getString(5);
						jobtitle1=rs.getString(6);
						%>
					<div class="row" style="background-color: #f0f0f5;">
					<div class="col-md-2">
					<img src="images/company.png" height=60px/>
					</div>
					<div class="col-md-10">
					<!-- url-rewritting session tracking mechanism where here we embedding id of each education detail record -->
					<span style="color:green;font-size:16px;float:right"><a href="edit-profile-experience.jsp?id=<%=id1%>" class="bi bi-pencil"></a></span>
					<span class="bi bi-building"> </span><b><%=company1 %></b><br>
					<span class="bi bi-shop"> </span><%=location1 %><br>
					<span class="bi bi-file-person"> </span><%=jobtitle1 %><span style="color:grey;">(<%=year1 %>)</span><br>
					</div><br>
					</div>	
						<%
					}
					}catch(Exception e)
					{e.printStackTrace();}
					%>
				</div>
			</div><br><br>
			<!------------------------------- Experience portion end,follow button start ------------------------------------------------->
			<div class="row" style="background-color: #f0f0f5;">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<input type="submit" value="Follow" class="btn-default" />
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>