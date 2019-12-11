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
<link rel="stylesheet" href="css/jquery-ui.css">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
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
				<li class="nav-item active"><a href="eventssearch.jsp" class="nav-link">Search Event</a></li>
				<li class="nav-item"><a href="cart.jsp" class="nav-link">Cart</a></li>
				<li class="nav-item"><a href="bookings.jsp" class="nav-link">My
						Bookings</a></li>
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

			<div class="form-group row col-sm-10 m-auto">
				<label for="search" class="col-sm-2 col-form-label">Event
					Name : </label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="search">
				</div>
			</div>
			<div class="p-3">
				<br>
				<br>
				<br>
			</div>
			<div class="card col-sm-6 m-auto mt-2 hide" style="display: none"
				id="carddiv">
				<img src="images/hockey.png" class="card-img-top m-auto" id="eventImage"
					alt="Hockey" style="max-height: 150px; max-width: 150px;">
				<div class="card-body">
					<h5 class="card-title" id="eventName"></h5>
					<p class="card-text" style="font-size: 12px;" id="eventDate"></p>
					<p class="card-text" style="font-size: 12px;" id="eventPlace"></p>
					<form class="m-auto" id="loginform" method="post"
						action="TicketsServlet">
						<input type="hidden" name="eventId" id="eventId" value="">
						<input type="submit" class="btn btn-primary" value="Buy Tickets" />
					</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$(function() {
				$("#search").autocomplete({
					source : function(request, response) {
						$.ajax({
							url : "EventSearch",
							type : "GET",
							data : {
								query : request.term
							},
							dataType : "json",
							success : function(data) {
								response(data);
							}
						});
					},
					select : function(event, ui) {
						$.ajax({
							url : "EventSearch",
							type : "GET",
							data : {
								eventname : ui.item.value
							},
							dataType : "json",
							success : function(event) {
								console.log(event);
								if(event.sportName == "Hockey"){
									$("#eventImage").attr("src","images/hockey.png");
								}else if(event.sportName == "Baseball"){
									$("#eventImage").attr("src","images/baseball.jpg");
								}else if(event.sportName == "Volleyball"){
									$("#eventImage").attr("src","images/volleyball.jpg");
								}else if(event.sportName == "Football"){
									$("#eventImage").attr("src","images/football.jpg");
								}else if(event.sportName == "Soccer"){
									$("#eventImage").attr("src","images/soccer.jpg");
								}else if(event.sportName == "Basketball"){
									$("#eventImage").attr("src","images/Basketball.jpeg");
								}
								$("#eventName").text(event.eventName);
								$("#eventDate").text("Date : "+event.eventDate);
								$("#eventPlace").text("Location : "+event.eventPlace+","+event.eventCity+","+event.eventState+","+event.eventZip);
								$("#eventId").val(event.eventId);
								$("#carddiv").show();
							}
						});
						return false;
					}
				});
			});
		});
	</script>
</body>

</html>

