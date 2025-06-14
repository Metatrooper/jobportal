<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register-EasyJobs</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css" />

<script>
function validation()
{
	var name2=document.regform.name1.value;
	var email2=document.regform.email1.value;
	var pass2=document.regform.pass1.value;
	var gender2=document.regform.gender1.value;
	
	var city2=document.regform.city1.value;
	
	var namepattern=/^[A-Za-z ]{3,30}$/;
	var email_pattern = /^([a-zA-Z0-9])(([a-zA-Z0-9])*([\._\+-])*([a-zA-Z0-9]))*@(([a-zA-Z0-9\-])+(\.))+([a-zA-Z]{2,4})+$/;
    var password_pattern = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
    
	if(name2===""){
		alert("name cannot be empty");
		return false;
	}
	else if(!name2.match(namepattern)){
		alert("name is not in correct format");
		return false;
	}
	else if(email2===""){
		alert("email cannot be empty");
		return false;}
	else if(!email2.match(email_pattern)){
		alert("email is not in correct format");
		return false;
	}
	else if(pass2===""){
		alert("password cannot be empty");
		return false;}
	else if(!pass2.match(password_pattern)){
		alert("password is not in correct format");
		return false;
	}
	else if(gender2===""){
		alert("gender cannot be empty");
		return false;}
	
	else if(city2==="Select city:"){
		alert("Please select city");
		return false;}
	else{
		
		return true;
		
	}
}
</script>
</head>
<body>
	<div class="conatiner-fluid">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menubar.jsp"></jsp:include>
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6 register_div_design">
				<h2>Register here</h2>
				<br>
				<form method="post" name="regform" onsubmit="return validation();" action="reg">
					<input type="text" name="name1" placeholder="Enter name"
						class="register_textbox_design" /><br> <br> <input
						type="text" name="email1" placeholder="Enter email"
						class="register_textbox_design" /><br> <br> <input
						type="password" name="pass1" placeholder="Enter password"
						class="register_textbox_design" /><br> <br> <b>Select
						Gender :</b><input type="radio" name="gender1" value="Male" />Male<input
						type="radio" name="gender1" value="Female" />Female<br> <br> <b>Select
						Fields :</b> <input type="checkbox" name="field1"
						value="Information Technology" />Information Technology<br>
					<input type="checkbox" name="field1" value="Marketing" />Marketing
					<input type="checkbox" name="field1" value="Finance" />Finance<br>
					<br> <select name="city1" class="register_textbox_design">
						<option>Select city:</option>
						<option value="Mumbai">Mumbai</option>
						<option value="Pune">Pune</option>
						<option value="Banglore">Banglore</option>
						<option value="Gurgaon">Gurgaon</option>
					</select><br> <br> <input type="submit" value="Register"
						class="btn btn-primary" /><br> <br>
				</form>
			</div>
			<div class="col-md-3"></div>

			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>