<!DOCTYPE html>
<%@page import="com.dev.sportshub.dao.BookingDao"%>
<%@page import="com.dev.sportshub.beans.Booking"%>
<%@page import="java.util.List"%>
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
	Integer userid = null;
	if (session.getAttribute("userid") == null) {
		String redirectURL = "index.jsp";
		//response.sendRedirect(redirectURL);
	} else {
		userid = (Integer) session.getAttribute("userid");
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
					<li class="nav-item"><a href="cart.jsp"
						class="nav-link">Cart</a></li>
					<li class="nav-item"><a href="bookings.jsp" class="nav-link">My
							Bookings</a></li>
					<li class="nav-item active"><a href="review.jsp" class="nav-link">Review</a></li>
					<li class="nav-item"><a href="LogoutServlet" class="nav-link">Logout</a></li>
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
				<div class="row m-auto col-sm-6" style="padding-top: 200px">
					<form class="m-auto col-sm-12" id="loginform" method="post"
						action="FeedbackServlet"
						style="background-color: #ddd; padding: 20px; color: #000;">
						<div class=" mb-4 mt-2 text-center">
							<h3>Review</h3>
							<%if(response.getHeader("message") != null){ %>
							<p style="color: red"><%= response.getHeader("message") %></p>
							<%} %>
						</div>
						<div class="form-label-group text-center">
							<div class="form-group row">
								<label class="col-sm-3" for="eventid">Event: </label>
								<div class="col-sm-9">
									<select class="form-control" id="event" name="event">
									<%
									 List<Booking> bookings = new BookingDao().getBookingByUser(String.valueOf(userid));
									for(Booking booking: bookings){
 									%>
										<option value="<%=booking.getEventId() %>###<%=booking.getEventName() %>"><%=booking.getEventName() %></option>
										<%} %>
									</select>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-3" for="domain">Message: </label>
								<div class="col-sm-9">
									<input type="hidden" name="userid" id="userid"
										value="<%=userid%>">
									<textarea rows="5" cols="45" name="review" id="review"></textarea>
								</div>
							</div>
							<div class="form-group row">
								<input type="submit" class="btn btn-block btn-md btn-info"
									value="Save Review" />
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

