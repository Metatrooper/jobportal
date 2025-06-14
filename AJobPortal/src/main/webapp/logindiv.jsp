<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6 register_div_design">
			<h2>Login here</h2>
			<br>
			<Form method="post" action="login">
				<input type="text" name="email1" placeholder="Enter email"
					class="register_textbox_design" /><br> <br> <input
					type="password" name="pass1" placeholder="Enter password"
					class="register_textbox_design" /><br> <br> <input
					type="checkbox" name="rememberme1" value="rememberme" />Remember
				me <br> <br> <input type="submit" value="Login"
					class="btn btn-primary" /><br> <br>
			</Form>
		</div>
		<div class="col-md-3"></div>
	</div>
</body>
</html>