<%@page import="com.dev.sportshub.dao.TicketsDao"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.dev.sportshub.beans.Tickets"%>
<%@page import="com.dev.sportshub.dao.EventsDao"%>
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
	Set<String> ticketIds = null;
	if (session.getAttribute("userid") == null) {
		String redirectURL = "index.jsp";
		response.sendRedirect(redirectURL);
	} else {
		if (session.getAttribute("ticketids") == null) {
			ticketIds = new HashSet<String>();
		} else {
			ticketIds = (HashSet) session.getAttribute("ticketids");
		}
		if (null != request.getParameter("ticket")) {
			ticketIds.add((String) request.getParameter("ticket"));
			session.setAttribute("ticketids", ticketIds);
		}
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
				<li class="nav-item active"><a href="cart.jsp" class="nav-link">Cart</a></li>
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
			<form action="BookingServlet" method="post" class="col-sm-12">
				<div class="col-sm-8 m-auto">
					<div class="row">
						<%
							if (ticketIds != null && ticketIds.size() > 0) {
								%>
						<div class="col-sm-8 mb-3" style="background: #ddd">
							<h2 style="color: #000">Tickets in Cart</h2>
						</div>
								<% 
								List<Tickets> tickets = new TicketsDao().getTicketsByticketIds(ticketIds);
								for (Tickets ticket : tickets) {
						%>
						<div class="col-sm-8 mb-3">
							<div class="row no-gutters bg-white">
								<div class="card-body row">
									<h5 class="card-title col-sm-8"><%=ticket.getSectionName()%></h5>
									<p>
										Row :
										<%=ticket.getRow()%>, Price :
										<%=ticket.getPricePerProduct()%></p>
								</div>
							</div>
						</div>
						<%
							}
						%>
					</div>
					<div class="col-sm-8 mb-3">
						<input type="submit" class="btn btn-primary m-auto"
							value="Checkout">
					</div>
					<%
						} else {
					%>
						<div class="col-sm-8 mb-3" style="background: #ddd">
							<h2 style="color: #000">No Tickets in Cart</h2>
						</div>
					<%
						}
					%>
				</div>
			</form>
		</div>
	</div>
	<!-- 	</div> -->
</body>
</html>

