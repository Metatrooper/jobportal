<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String name = (String) session.getAttribute("session_name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome <%=name%></title>
</head>
<body>
	<div class="row header_bg">
		<div class="col-md-4 ">
			<img src="images/Logo.png" height=50px /> <span class="Logo_font">Job
				Portal</span>
		</div>
		<div class="col-md-6">
		<span style="color:yellow;">Welcome: <a href="profile.jsp" class="hyperlink_design"><%=name%></a>
			</span>
		</div>
		<div class="col-md-2">
			<a href="logout" class="hyperlink_design">Logout</a>
		</div>
	</div>
</body>
</html>