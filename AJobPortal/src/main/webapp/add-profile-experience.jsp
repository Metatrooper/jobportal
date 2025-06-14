<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String name = (String) session.getAttribute("session_name");
	
	if (name == null || name.equals("")) {
		response.sendRedirect("login.jsp");
	}
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add-profile-education</title>
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
					<h3>Add Experience Details:</h3><br>
					<b><%=name %></b>(<%=session.getAttribute("session_email") %>)<br><br>
					<form method="post" action="add_experience">
					Company:<br><input type="text" name="company1" class="textfield_design"/><br><br>
					Location:<br><input type="text"   placeholder="e.g Mumbai,Pune.." name="location1" class="textfield_design"/><br><br>
					Year:<br><input type="text" placeholder="e.g 2016-2020" name="year1" class="textfield_design"/><br><br>
					Title:<br><input type="text" name="jobtitle1" class="textfield_design" placeholder="e.g Associate ,Team lead,Manager.." /><br><br>
					Description:<br><textarea placeholder="Projects, Achievement,Skills used,etc." name="description1" class="textarea_design"></textarea><br><br>
					<input type="submit" value="Add Experience" class="btn btn-danger"/>
					</form>
				</div>
			</div>
			
		</div>
		<div class="col-md-2"></div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>