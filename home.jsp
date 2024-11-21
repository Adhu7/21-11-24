
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="org.mindrot.jbcrypt.BCrypt"%>
<%@ page import="dao.UserDao"%>
<%@ page import="bean.UserBean"%>


<%
String email = (String) session.getAttribute("email");

//out.print(email);

if (email == null) {
	response.sendRedirect("log.jsp");

}
%>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Artevo</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
	<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	
<style>
#artCarousel {
	height: 600px;
}

#artCarousel .carousel-inner {
	height: 100%;
}

#artCarousel .carousel-item {
	height: 100%;
}

#artCarousel .carousel-item img {
	object-fit: cover;
	height: 100%;
	width: 100%;
}

.hero-section {
	background-image: url('art-hero.jpg');
	background-size: cover;
	background-position: center;
	color: white;
	height: 60vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

.hero-section h1 {
	font-size: 4rem;
	font-weight: bold;
}

.hero-section p {
	font-size: 1.25rem;
	text-align: center;
}

footer {
	background-color: #f8f9fa;
	padding: 1rem 0;
	text-align: center;
}
</style>
</head>
<body>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<h3>Artevo</h3>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item">
						<form class="d-flex" action="searchResults.jsp" method="get">
							<input class="form-control me-2" type="search"
								placeholder="Search Artworks" name="query" aria-label="Search">
							<button class="btn btn-outline-primary" type="submit">Search</button>
						</form>
					</li>
					<li class="nav-item"><a class="nav-link active"
						href="home.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link"
						href="shoppingCart.jsp">Shopping Cart</a></li>
					<li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" 
                        role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        User
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                        <li><a class="dropdown-item" href="userProfile.jsp">Profile</a></li>
                        <li><a class="dropdown-item" href="orders.jsp">Orders</a></li>
                    </ul>
                </li>
					<li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Carousel Section -->
	<div id="artCarousel" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="images/caro1.jpg" class="d-block w-100" alt="Art Image 1">
			</div>
			<div class="carousel-item">
				<img src="images/caro6.jpg" class="d-block w-100" alt="Art Image 2">
			</div>
			<div class="carousel-item">
				<img src="images/index1.jpeg" class="d-block w-100"
					alt="Art Image 3">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#artCarousel" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#artCarousel" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
		</button>
	</div>

	<!-- Featured Artworks Section -->
<%@ include file="arts.jsp" %>


	<!-- Footer -->
	<footer>
		<p>&copy; 2024 Artevo. All Rights Reserved.</p>
		<p>
			<a href="#" class="text-decoration-none">Terms &
				Conditions</a> | <a href="#" class="text-decoration-none">Privacy
				Policy</a>
		</p>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
