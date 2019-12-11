<%@page import="java.util.List"%>
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
<%
System.out.print(session.getAttribute("userid"));
	if (session.getAttribute("userid") == null) {
		String redirectURL = "index.jsp";
		response.sendRedirect(redirectURL);
	}
%>
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
				<li class="nav-item active"><a href="home.jsp" class="nav-link">Home</a></li>
				<li class="nav-item"><a href="eventssearch.jsp" class="nav-link">Search Event</a></li>
				<li class="nav-item"><a href="cart.jsp" class="nav-link">Cart</a></li>
				<li class="nav-item"><a href="bookings.jsp" class="nav-link">My Bookings</a></li>
				<li class="nav-item"><a href="review.jsp" class="nav-link">Review</a></li>
				<li class="nav-item"><a href="LogoutServlet" class="nav-link">Logout</a></li>
			</ul>
		</div>
	</div>
	</nav>
	<!-- END nav -->

	<div class="container"
		style="padding-top: 150px; background-image: url('images/bg_1.jpg'); background-repeat: repeat-y; min-height: 100%">
		<div class="row">
			<div class="col-sm-4">
				<div class="list-group">
					<a href="#"
						class="list-group-item list-group-item-action disabled active"
						style="font-size: 20px"> Get Events by City </a>
					<%
					if(session.getAttribute("cities") != null){
						List<String> cities = (List<String>) session.getAttribute("cities");
						for (String city : cities) {
					%>
					<a href="Events?city=<%=city%>"
						class="list-group-item list-group-item-action"><%=city%></a>
					<%
						}
					}
					%>
				</div>
			</div>
			<div class="col-sm-8">
				<div class="row">
					<div class="col-sm-6 mb-3">
						<div class="row no-gutters bg-white">
							<div class="col-md-4">
								<img src="images/hockey.png" class="card-img" alt="...">
							</div>
							<div class="col-md-8">
								<div class="card-body">
									<h5 class="card-title">Hockey</h5>
									<a href="Events?sport=Hockey" class="btn btn-primary">View Events</a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-6 mb-3">
						<div class="row no-gutters bg-white">
							<div class="col-md-4">
								<img src="images/baseball.jpg" class="card-img" alt="...">
							</div>
							<div class="col-md-8">
								<div class="card-body">
									<h5 class="card-title">Baseball</h5>
									<a href="Events?sport=Baseball" class="btn btn-primary">View Events</a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-6 mb-3">
						<div class="row no-gutters bg-white">
							<div class="col-md-4">
								<img src="images/Basketball.jpeg" class="card-img" alt="...">
							</div>
							<div class="col-md-8">
								<div class="card-body">
									<h5 class="card-title">BasketBall</h5>
									<a href="Events?sport=Basketball" class="btn btn-primary">View Events</a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-6 mb-3">
						<div class="row no-gutters bg-white">
							<div class="col-md-4">
								<img src="images/soccer.jpg" class="card-img" alt="...">
							</div>
							<div class="col-md-8">
								<div class="card-body">
									<h5 class="card-title">Soccer</h5>
									<a href="Events?sport=Soccer" class="btn btn-primary">View Events</a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-6 mb-3">
						<div class="row no-gutters bg-white">
							<div class="col-md-4">
								<img src="images/football.jpg" class="card-img" alt="...">
							</div>
							<div class="col-md-8">
								<div class="card-body">
									<h5 class="card-title">FootBall</h5>
									<a href="Events?sport=Football" class="btn btn-primary">View Events</a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-6 mb-3">
						<div class="row no-gutters bg-white">
							<div class="col-md-4">
								<img src="images/volleyball.jpg" class="card-img" alt="...">
							</div>
							<div class="col-md-8">
								<div class="card-body">
									<h5 class="card-title">VolleyBall</h5>
									<a href="Events?sport=Volleyball" class="btn btn-primary">View Events</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 	</div> -->
</body>
</html>

