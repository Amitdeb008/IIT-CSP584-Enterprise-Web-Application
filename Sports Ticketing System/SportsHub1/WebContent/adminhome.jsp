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
		System.out.print(session.getAttribute("adminid"));
	if (session.getAttribute("adminid") == null) {
		String redirectURL = "adminlogin.jsp";
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
				<li class="nav-item active"><a href="adminhome.jsp"
					class="nav-link">Home</a></li>
				<li class="nav-item"><a href="createevent.jsp" class="nav-link">New Event</a></li>
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
			<table class="table table-sm table-bordered">
				<thead>
					<tr>
						<th scope="col">EventId</th>
						<th scope="col">EventName</th>
						<th scope="col">Sport</th>
						<th scope="col">EventDate</th>
						<th scope="col">Place</th>
						<th scope="col">City</th>
						<th scope="col">State</th>
						<th scope="col">ZIP</th>
						<th scope="col">Action</th>
					</tr>
				</thead>
				<tbody>

					<%
						if (session.getAttribute("events") != null) {

							List<Event> events = (List<Event>) session.getAttribute("events");
							for (Event event : events) {
					%>
					<tr>
						<td><%=event.getEventId()%></td>
						<td><%=event.getEventName()%></td>
						<td><%=event.getSportName()%></td>
						<td><%=event.getEventDate()%></td>
						<td><%=event.getEventPlace()%></td>
						<td><%=event.getEventCity()%></td>
						<td><%=event.getEventState()%></td>
						<td><%=event.getEventZip()%></td>
						<td><a href="updateevent.jsp?event=<%=event.getEventId()%>" class="btn btn-primary">Update</td>
					</tr>
					<%
						}
						}
					%>
				</tbody>
			</table>
		</div>
	</div>
	<!-- 	</div> -->
</body>
</html>

