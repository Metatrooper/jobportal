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
</head>
<body>
	<jsp:include page="profileHeader.jsp"></jsp:include>
	<jsp:include page="menubar.jsp"></jsp:include>
	<%
	String name = (String) session.getAttribute("session_name");
	String gender = (String) session.getAttribute("session_gender");
	String city = (String) session.getAttribute("session_city");
	String field = (String) session.getAttribute("session_field");
	if (name == null || name.equals("")) {
		response.sendRedirect("login.jsp");
	}
	%>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="row">
				<div class="col-md-2">
					<img src="images/Logo.png" height=100px />
				</div>
				<div class="col-md-8">
					<h3 style="color: blue;"><%=name.toUpperCase()%></h3>
					<table>
					<tr>
					<td><span class="profile_details_title">Gender:</span></td>
					<td><input type="text" value="<%=gender%>" class="textfield_design" /><br></td>
					</tr>
					<tr>
					<td><span class="profile_details_title">City:</span></td>
					<td><input type="text" value="<%=city%>" class="textfield_design"/><br></td>
					</tr>
					<tr>
					<td><span class="profile_details_title">Fields:</span></td>
					<td><input type="text" value="<%=field%>"class="textfield_design" /><br></td>
					</tr>
					<tr>
					<td></td>
					<td><input type="submit" class="btn btn-danger"/></td>
					</tr>
					</table>
				</div>
				<div class="col-md-2"></div>
			</div>
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-10">
					<h5>
						Education Details(<span style="color: #4ddbff; font-size: 12px;"><a
							href="edit-details.jsp">edit details</a></span>)
					</h5>
					<table>
					<tr>
					<td>School:</td>
					<td><input type="text" value="" class="textfield_design"/><br></td>
					</tr>
					<tr>
					<td>Passing year:</td>
					<td><input type="text" value="" class="textfield_design"/><br></td>
					</tr> 
					<tr>
					<td>College:</td>
					<td><input type="text" value="" class="textfield_design"/><br> </td>
					</tr>
					<tr>
					<td>Passing year:</td>
					<td><input type="text" value="" class="textfield_design"/><br> </td>
					</tr>
					<tr>
					<td>Experience:</td>
					<td><input type="text" value="" class="textfield_design"/><br></td>
					</tr>
					<tr>
					<td></td>
					<td><input type="submit" class="btn btn-danger"/></td>
					</tr>
					</table>
				
				</div>
				<div class="col-md-2"></div>
			</div>
			<div class="row" style="background-color: #f0f0f5;">
				<div class="col-md-2"></div>
				<div class="col-md-8">
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>