<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>Sports Hub</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Oswald:200,300,400,500,600,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">

<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">

<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/ionicons.min.css">

<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">


<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">
<style type="text/css">
html, body {
	height: 100%;
}
</style>
</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index.html"><i
				class="flaticon-helmet"></i><span>Sports Hub</span></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a href="index.jsp"
						class="nav-link">Home</a></li>
					<li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
					<li class="nav-item"><a href="login.jsp" class="nav-link">Login</a></li>

					<!--  <li class="nav-item"><a href="games.html" class="nav-link">Games</a></li>
	          <li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>
	          <li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li> -->
					<!-- 					<li class="nav-item cta"><a href="#" class="nav-link">Buy -->
					<!-- 							Ticket</a></li> -->

				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->

	<div class="hero-wrap js-fullheight"
		style="background-image: url('images/bg_1.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-center justify-content-start"
				data-scrollax-parent="true">
				<div class="row m-auto" style="padding-top: 200px">
					<form class="m-auto" id="loginform" method="post"
						action="AdminHome"
						style="background-color: #ddd; padding: 20px; color: #000;">
						<div class=" mb-4 mt-2 text-center">
							<h3>Login</h3>
							<p style="color: red"><%response.getHeader("status"); %> </p>
						</div>
						<div class="form-label-group text-center">
							<div class="form-group row">
								<label class="col-sm-3" for="domain">Email: </label>
								<div class="col-sm-9">
									<input type="text" id="emailId" name="emailId">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-3" for="domain">Password: </label>
								<div class="col-sm-9">
									<input type="password" name="password" id="password">
								</div>
							</div>
							<div class="form-group row">
								<input type="submit" class="btn btn-block btn-md btn-info"
									value="Login" />
							</div>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

