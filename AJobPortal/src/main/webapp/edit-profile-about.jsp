<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile-EasyJobs</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script>
function changeGender(){
	document.getElementById("chngGenderTf").value=document.getElementById("chngGender").value
}

function changeCity(){
	document.getElementById("chngCityTf").value=document.getElementById("chngCity").value
}

</script>
</head>
<body>
	<jsp:include page="profileHeader.jsp"></jsp:include>
	<jsp:include page="menubar.jsp"></jsp:include>
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
	%>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="row" style="border:1px solid grey;box-shadow:0px 0px 2px grey">
				<div class="col-md-2">
					<img src="images/Logo.png" height=100px />
				</div>
				<div class="col-md-10">
					<h3>Personal Details:</h3><br>
					<form method="post" action="edit-about">
					<b><%=name %></b>(<%=session.getAttribute("session_email") %>)<br><br>
					<input type="text" value="<%=name %>" name="name1" class="textfield_design" placeholder="enter name"/><br><br>
					<input type="text" value="<%=city %>"  name="city1" class="textfield_design" placeholder="enter city" id="chngCityTf" readonly/>
					<select id="chngCity" onchange="changeCity()" >
					<option disabled>Select city</option>
					<option>Mumbai</option>
					<option>Pune</option>
					<option>Banglore</option>
					<option>Gurgaon</option>
					</select><br><br>
					<input type="text" value="<%=gender %>"name="gender1" class="textfield_design" placeholder="select gender" id="chngGenderTf" readonly/>
					<select id="chngGender" onchange="changeGender()" >
					<option disabled>Select gender</option>
					<option>Male</option>
					<option>Female</option>
					</select><br><br>
					<input type="text" value="<%=title %>" name="title1" class="textfield_design" placeholder="profile title" /><br><br>
					<textarea placeholder="skills" name="skills1" class="textarea_design"><%=skills %></textarea><br><br>
					<input type="submit" value="Update" class="btn btn-danger"/>
					</form>
				</div>
			</div>
			
		</div>
		<div class="col-md-2"></div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>