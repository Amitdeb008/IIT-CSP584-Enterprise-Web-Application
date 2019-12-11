<!DOCTYPE html>
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

<%
		System.out.print(session.getAttribute("adminid"));
	if (session.getAttribute("adminid") == null) {
		String redirectURL = "adminlogin.jsp";
		response.sendRedirect(redirectURL);
	}
%>
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
				<li class="nav-item "><a href="adminhome.jsp"
					class="nav-link">Home</a></li>
				<li class="nav-item active"><a href="createevent.jsp" class="nav-link">New Event</a></li>
				<li class="nav-item"><a href="LogoutServlet" class="nav-link">Logout</a></li>
			</ul>
		</div>
		</div>
	</nav>
	<!-- END nav -->

<!-- 	<div class="hero-wrap js-fullheight" -->
<!-- 		style="background-image: url('images/bg_1.jpg');" -->
<!-- 		data-stellar-background-ratio="0.5"> -->
<!-- 		<div class="container"> -->
<!-- 			<div -->
<!-- 				class="row no-gutters slider-text js-fullheight align-items-center justify-content-start" -->
<!-- 				data-scrollax-parent="true"> -->
	<div class="container"
		style="padding-top: 150px; background-image: url('images/bg_1.jpg'); background-repeat: repeat-y;">
		<div class="row">
				<div class="row m-auto col-sm-6" style="">
				<form class="m-auto col-sm-12" id="loginform" method="post" action="Events" style="background-color: #ddd;padding: 20px;color: #000;">
					<div class=" mb-4 mt-2 text-center">
						<h3>Create Event</h3>
						<p style="color: red"></p>
					</div>
					<div class="form-label-group text-center">
						<div class="form-group row">
							<label class="col-sm-3 col-form-label" for="domain">Event Id: </label>
							<div class="col-sm-9">
								<input class="form-control" type="text" id="eventId" name="eventId">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label" for="domain">Event Name: </label>
							<div class="col-sm-9">
								<input class="form-control" type="text" id="eventName" name="eventName">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label" for="domain">Sport Name: </label>
							<div class="col-sm-9">
								<input class="form-control" type="text" id="sportName" name="sportName">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label" for="domain">Group Name: </label>
							<div class="col-sm-9">
								<input class="form-control" type="text" id="groupName" name="groupName">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label" for="domain">Event Date: </label>
							<div class="col-sm-9">
								<input class="form-control" type="text" id="eventDate" name="eventDate">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label" for="domain">Event Place: </label>
							<div class="col-sm-9">
								<input class="form-control" type="text" id="eventPlace" name="eventPlace">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label" for="domain">Event City: </label>
							<div class="col-sm-9">
								<input class="form-control" type="text" id="eventCity" name="eventCity">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label" for="domain">Event State: </label>
							<div class="col-sm-9">
								<input class="form-control" type="text" id="eventState" name="eventState">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label" for="domain">ZIP: </label>
							<div class="col-sm-9">
								<input class="form-control" type="text" id="eventZip" name="eventZip">
							</div>
						</div>
						<div class="form-group row">
							<input type="submit" class="btn btn-block btn-md btn-info"
								value="Save Event" />
						</div>
					</div>
				</form>
				</div>
			</div>
<!-- 		</div> -->
	</div>
</body>
</html>

