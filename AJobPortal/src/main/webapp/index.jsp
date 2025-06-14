<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Job portal website</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css" />

</head>
<body>
	<div class="container-fluid">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menubar.jsp"></jsp:include>
		<!-- =============Banner starts ==================  -->
		<div class="row" style="border: solid 2px black">
			<img src="images/banner.png" style="width: 100%;" />
		</div>
		<!-- =================Banner ends ================  -->
		<!-- ============Search job div starts ============  -->
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8 job_Search_div">
				<h2>Find a Job at India's no.1 Job search website!</h2>
				<input type="text" placeholder="Enter Technology"
					class="textfield_design" /> <input type="text"
					placeholder="Enter Location" class="textfield_design" /> <input
					type="submit" value="search" class="btn btn-primary" />
			</div>
			<div class="col-md-2"></div>
		</div>
		<!-- ============Search job div ends ============  -->
		<div class=row>
			<div class="col-md-3">
				<ul>
					<li><a href="">Nielsen</a></li>
					<li><a href="">Infosys</a></li>
					<li><a href="">TCS</a></li>
					<li><a href="">JP Morgan</a></li>
					<li><a href="">Accenture</a></li>
				</ul>
			</div>
			<div class="col-md-6" style="background-color:#f0f5f5;margin-top:5px">
				<div class="row ">
					<div class="col-md-12 display_job_div">
						<b>JAVA Software developer</b><br> <span>Company:Nielsen</span><br>
						<span>2-6 years</span><br> <span>debugging and
							creating code fix for highly critical regulator and non
							regulatory production environment.</span><br> <a href="">see
							more details</a><br>
					</div>
					<div class="col-md-12 display_job_div">
						<b>JAVA Software developer</b><br> <span>Company:Nielsen</span><br>
						<span>2-6 years</span><br> <span>debugging and
							creating code fix for highly critical regulator and non
							regulatory production environment.</span><br> <a href="">see
							more details</a><br>
					</div>
					<div class="col-md-12 display_job_div">
						<b>JAVA Software developer</b><br> <span>Company:Nielsen</span><br>
						<span>2-6 years</span><br> <span>debugging and
							creating code fix for highly critical regulator and non
							regulatory production environment.</span><br> <a href="">see
							more details</a><br>
					</div>
					<div class="col-md-12 display_job_div">
						<b>JAVA Software developer</b><br> <span>Company:Nielsen</span><br>
						<span>2-6 years</span><br> <span>debugging and
							creating code fix for highly critical regulator and non
							regulatory production environment.</span><br> <a href="">see
							more details</a><br>
					</div>
					<div class="col-md-12 display_job_div">
						<b>JAVA Software developer</b><br> <span>Company:Nielsen</span><br>
						<span>2-6 years</span><br> <span>debugging and
							creating code fix for highly critical regulator and non
							regulatory production environment.</span><br> <a href="">see
							more details</a><br>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<ul>
					<li><a href="">Nielsen</a></li>
					<li><a href="">Infosys</a></li>
					<li><a href="">TCS</a></li>
					<li><a href="">JP Morgan</a></li>
					<li><a href="">Accenture</a></li>
				</ul>
			</div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>