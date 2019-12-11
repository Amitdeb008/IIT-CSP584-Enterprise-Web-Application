<%@page import="com.dev.sportshub.beans.Event"%>
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
	System.out.print(session.getId());
	if (session.getAttribute("userid") == null) {
		String redirectURL = "index.jsp";
		//response.sendRedirect(redirectURL);
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
				<li class="nav-item"><a href="home.jsp" class="nav-link">Home</a></li>
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

	<!-- 	<div class="hero-wrap js-fullheight" -->
	<!-- 		style="background-image: url('images/bg_1.jpg');background-repeat: repeat-x;" -->
	<!-- 		data-stellar-background-ratio="0.5"> -->
	<div class="container"
		style="padding-top: 150px; background-image: url('images/bg_1.jpg'); background-repeat: repeat-y;">
		<div class="row">
			<%
				List<Event> events = (List<Event>) session.getAttribute("events");
				for (Event event : events) {
			%>
			<div class="col-sm-3" style="padding-bottom: 30px;">
				<div class="card">
					<%
					if(event.getSportName().equalsIgnoreCase("Hockey")){
					%>
					<img src="images/hockey.png" class="card-img-top m-auto" alt="Hockey" style="max-height: 150px;max-width: 150px;">
					<%
					}else if(event.getSportName().equalsIgnoreCase("Baseball")){
					%>
					<img src="images/baseball.jpg" class="card-img-top m-auto" alt="Base Ball" style="max-height: 150px;max-width: 150px;">
					<%
					}else if(event.getSportName().equalsIgnoreCase("Volleyball")){
					%>
					<img src="images/volleyball.jpg" class="card-img-top m-auto" alt="Volley Ball" style="max-height: 150px;max-width: 150px;">
					<%
					}else if(event.getSportName().equalsIgnoreCase("Football")){
					%>
					<img src="images/football.jpg" class="card-img-top m-auto" alt="Volley Ball" style="max-height: 150px;max-width: 150px;">
					<%
					}else if(event.getSportName().equalsIgnoreCase("Soccer")){
					%>
					<img src="images/soccer.jpg" class="card-img-top m-auto" alt="Volley Ball" style="max-height: 150px;max-width: 150px;">
					<%
					}else if(event.getSportName().equalsIgnoreCase("Basketball")){
					%>
					<img src="images/Basketball.jpeg" class="card-img-top m-auto" alt="Basket Ball" style="max-height: 150px;max-width: 150px;">
					<%
					}
					%>
					<div class="card-body">
						<h5 class="card-title"><%= event.getEventName() %></h5>
						<p class="card-text" style="font-size: 12px;"><strong>Date</strong> : <%= event.getEventDate() %></p>
						<p class="card-text" style="font-size: 12px;"><strong>
							Location :
						</strong>
							<%= event.getEventPlace() %>, <%= event.getEventCity() %>, <%= event.getEventState() %>, <%= event.getEventZip() %></p>
							<form class="m-auto" id="loginform" method="post" action="TicketsServlet" >
							<input type="hidden" name="eventId" id="eventId" value="<%= event.getEventId() %>">
								<input type="submit" class="btn btn-primary"
								value="Buy Tickets" />
							</form>
					</div>
				</div>
			</div>
			<%
				}
			%>

		</div>
	</div>
	<!-- 	</div> -->
</body>
</html>

