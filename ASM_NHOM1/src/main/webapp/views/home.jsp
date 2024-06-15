<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	font-family: Arial, sans-serif;
}

.navbar {
	margin-bottom: 30px;
}

.category-btns .btn {
	margin-right: 10px;
}

.location-cards .card {
	margin-bottom: 20px;
}

.location-cards .card img {
	height: 150px;
	object-fit: cover;
}

.hero {
	background: url('home.jpg') no-repeat center center;
	background-size: cover;
	height: 400px;
	color: white;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	text-align: center;
}

.search-box {
	background: rgba(255, 255, 255, 0.8);
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
	margin-top: -50px;
}

.location-cards .card {
	margin-bottom: 20px;
}

.footer {
	background: #f8f9fa;
	padding: 20px 0;
	text-align: center;
}

.card img {
	height: 200px;
	object-fit: cover;
}

.price {
	color: #FF5733;
	font-weight: bold;
}

.oneway {
	position: absolute;
	top: 10px;
	left: 10px;
	background-color: black;
	color: white;
	padding: 5px 10px;
	font-size: 12px;
	text-transform: uppercase;
}

.card {
	position: relative;
}

.destination-card {
	position: relative;
	color: white;
}

.destination-card img {
	width: 100%;
	height: auto;
	border-radius: 10px;
}

.destination-info {
	position: absolute;
	bottom: 20px;
	left: 20px;
	background: rgba(0, 0, 0, 0.5);
	padding: 10px;
	border-radius: 5px;
}

.destination-info h5 {
	margin: 0;
}

.reason-card {
	background: white;
	border-radius: 10px;
	padding: 20px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.reason-card img {
	width: 50px;
	height: 50px;
}

.reason-card h5 {
	font-size: 1.25rem;
	margin-top: 15px;
}

.reason-card p {
	margin-top: 10px;
}

.footer {
	background-color: #2b3e50;
	color: white;
	padding: 40px 0;
	width: 100%;
}

.footer .footer-logo img {
	max-width: 150px;
}

.footer .social-icons a {
	color: white;
	margin-right: 15px;
}

.footer .footer-section {
	margin-bottom: 30px;
}

.footer .footer-section h6 {
	font-weight: bold;
	margin-bottom: 15px;
}

.footer .footer-section ul {
	list-style: none;
	padding: 0;
}

.footer .footer-section ul li {
	margin-bottom: 10px;
}

.footer .footer-section ul li a {
	color: white;
	text-decoration: none;
}

.footer .footer-section ul li a:hover {
	text-decoration: underline;
}

.footer .payment-partners img {
	max-width: 80px;
	margin: 10px;
}

.footer .app-links img {
	max-width: 130px;
	margin-top: 10px;
}

.room-card {
	position: relative;
	overflow: hidden;
}

.room-status {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	color: white;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 1.5em;
	font-weight: bold;
	opacity: 0;
	transition: opacity 0.3s;
	pointer-events: none; /* Ensure the overlay does not block clicks */
}

.room-card:hover .room-status {
	opacity: 1;
}

.booked {
	background: rgba(255, 0, 0, 0.5);
}

.available {
	background: rgba(0, 255, 0, 0.5);
}
</style>

</head>
<body>
	<jsp:include page="nav_header.jsp" />
	<jsp:include page="pageSearch.jsp" />
	<!-- Location Cards -->
	<div class="container location-cards">
		<h2 class="mb-4">Discovering USA</h2>
		<div class="row">
			<c:forEach var="item" items="${page.content}">
				<div class="col-md-3">
					<div class="card room-card">
						<a href="/room/detail?idPro=${item.idRooms}"> <img
							src="/photo/${item.img}" class="card-img-top" alt="${item.title}">
						</a>
						<div class="card-body">
							<h5 class="card-title">${item.title}</h5>
							<p class="price">Price: ${item.price}</p>
							<a class="btn btn-primary">More Info</a>
						</div>
						<div
							class="room-status ${item.statusRoom ? 'booked' : 'available'}">
							${item.statusRoom ? 'Booked' : 'Empty'}</div>
					</div>
				</div>
			</c:forEach>

		</div>
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<c:if test="${!page.isFirst()}">
					<li class="page-item"><a class="page-link"
						href="/room/index?page=${page.number - 1}">Previous</a></li>
				</c:if>
				<c:if test="${!page.isLast()}">
					<li class="page-item"><a class="page-link"
						href="/room/index?page=${page.number + 1}">Next</a></li>
				</c:if>
			</ul>
		</nav>
	</div>


	<div class="container my-4">
		<h2>Easy and quick trip planning</h2>
		<p>Discover top destinations the way you like in Vietnam</p>
		<div class="category-btns mb-4">
			<button class="btn btn-outline-primary active">Beaches</button>
			<button class="btn btn-outline-primary">Nature</button>
			<button class="btn btn-outline-primary">Cities</button>
			<button class="btn btn-outline-primary">Romantic</button>
			<button class="btn btn-outline-primary">Relaxation</button>
		</div>
		<div class="location-cards">
			<div class="row">
				<c:forEach var="item" items="${items6.content}">
					<div class="col-md-3">
					<div class="card room-card">
						<a href="/room/detail?idPro=${item.idRooms}"> <img
							src="/photo/${item.img}" class="card-img-top" alt="${item.title}">
						</a>
						<div class="card-body">
							<h5 class="card-title">${item.title}</h5>
							<p class="price">Price: ${item.price}</p>
						
						</div>
						<div
							class="room-status ${item.statusRoom ? 'booked' : 'available'}">
							${item.statusRoom ? 'Booked' : 'Empty'}</div>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<div class="container mt-5">
		<h2>Great deals and experiences</h2>
		<p>Discover top destinations the way you like in Vietnam</p>
		<div class="category-btns mb-4">
			<button class="btn btn-outline-primary active">Beaches</button>
			<button class="btn btn-outline-primary">Nature</button>
			<button class="btn btn-outline-primary">Cities</button>
			<button class="btn btn-outline-primary">Romantic</button>
			<button class="btn btn-outline-primary">Relaxation</button>
		</div>
		<div class="row">
			<!-- Card 1 -->
			<c:forEach var="item" items="${items4.content}">
				<div class="col-md-3 mb-4">
					<div class="card">
						<div class="oneway">Oneway</div>
						<a href="/room/detail?idPro=${item.idRooms }"><img
							src="/photo/${item.img}" class="card-img-top" alt="${item.title}"></a>
						<div class="card-body">
							<h6 class="card-title">${item.title}</h6>
							<p class="card-text">November 28, 2024</p>
							<p class="price">${item.price}</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="container mt-5">
			<h3 class="mb-4">Rediscover yourself in Asia and beyond</h3>
			<div class="row">
				<!-- Card 1 -->
				<c:forEach var="item" items="${items4.content}">
					<div class="col-md-3 mb-4">
						<div class="card">
							<div class="oneway">Oneway</div>
							<a href="/room/detail?idPro=${item.idRooms }"><img
								src="/photo/${item.img}" class="card-img-top"
								alt="${item.title}"></a>
							<div class="card-body">
								<h6 class="card-title">${item.title}</h6>
								<p class="card-text">November 28, 2024</p>
								<p class="price">${item.price}</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

		</div>
	</div>
	<div class="container mt-5">
		<h3 class="mb-4 text-center">Reasons to book with Booking?</h3>
		<div class="row">
			<div class="col-md-4 mb-4">
				<div class="reason-card text-center">
					<img src="/photo/travel.png" alt="Icon 1">
					<h5>Cater to all your needs</h5>
					<p>From flights, accommodations, to attractions, you can trust
						our Complete Travel Packages and Travel Guides to deliver.</p>
				</div>
			</div>
			<div class="col-md-4 mb-4">
				<div class="reason-card text-center">
					<img src="/photo/cashless-payment.png" alt="Icon 2">
					<h5>Flexible booking options</h5>
					<p>Unexpected plan changes? No problem! Easily modify or cancel
						your booking.</p>
				</div>
			</div>
			<div class="col-md-4 mb-4">
				<div class="reason-card text-center">
					<img src="/photo/payment-method.png" alt="Icon 3">
					<h5>Safe and convenient payment</h5>
					<p>Enjoy a variety of secure payment methods in your preferred
						currency.</p>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-md-3 footer-section">
					<div class="footer-logo">
						<img src="path/to/logo.png" alt="Traveloka">
					</div>
					<div>
						<img src="path/to/badges1.png" alt="Badge"> <img
							src="path/to/badges2.png" alt="Badge">
					</div>
				</div>
				<div class="col-md-3 footer-section">
					<h6>About Booking</h6>
					<ul>
						<li><a href="#">How to Book</a></li>
						<li><a href="#">Contact Us</a></li>
						<li><a href="#">Help</a></li>
						<li><a href="#">Careers</a></li>
						<li><a href="#">About Us</a></li>
					</ul>
				</div>
				<div class="col-md-3 footer-section">
					<h6>Products</h6>
					<ul>
						<li><a href="#">Hotels</a></li>
						<li><a href="#">Flight Tickets</a></li>
						<li><a href="#">Bus Tickets</a></li>
						<li><a href="#">Airport Transfer</a></li>
						<li><a href="#">Car Rental</a></li>
						<li><a href="#">Xperience</a></li>
						<li><a href="#">Cruises</a></li>
						<li><a href="#">Villas</a></li>
						<li><a href="#">Apartments</a></li>
					</ul>
				</div>
				<div class="col-md-3 footer-section">
					<h6>Others</h6>
					<ul>
						<li><a href="#">Traveloka Affiliate</a></li>
						<li><a href="#">Traveloka Blog</a></li>
						<li><a href="#">Privacy Policy</a></li>
						<li><a href="#">Terms & Conditions</a></li>
						<li><a href="#">Code of Conduct</a></li>
						<li><a href="#">Register Your Property</a></li>
						<li><a href="#">Register Your Travel Business</a></li>
						<li><a href="#">Press Room</a></li>
						<li><a href="#">Vulnerability Disclosure Program</a></li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 footer-section text-center">
					<h6>Follow Us On</h6>
					<div class="social-icons">
						<a href="#"><img src="/photo/facebook.png" alt="Facebook"
							width=30px></a> <a href="#"><img src="/photo/instagram.png"
							alt="Instagram" width=30px></a> <a href="#"><img
							src="/photo/video.png" alt="TikTok" width=30px></a> <a href="#"><img
							src="/photo/youtube.png" alt="YouTube" width=30px></a> <a
							href="#"><img src="/photo/telegram.png" alt="Telegram"
							width=30px></a>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 footer-section text-center">
					<h6>Payment Partners</h6>
					<div class="payment-partners">
						<img src="path/to/partner1.png" alt="Partner"> <img
							src="path/to/partner2.png" alt="Partner">
						<!-- Add more payment partner images as needed -->
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 footer-section text-center">
					<h6>Download the Traveloka App</h6>
					<div class="app-links">
						<img src="path/to/googleplay.png" alt="Google Play"> <img
							src="path/to/appstore.png" alt="App Store">
					</div>
				</div>
			</div>
		</div>
	</footer>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			// Get all room cards
			const roomCards = document.querySelectorAll('.room-card');

			// Loop through each room card
			roomCards.forEach(function(card) {
				// Check if the room is booked
				const isBooked = card.querySelector('.room-status').classList
						.contains('booked');

				// If the room is booked, disable the link
				if (isBooked) {
					const link = card.querySelector('a');
					link.removeAttribute('href');
					link.style.cursor = 'not-allowed';
					link.addEventListener('click', function(event) {
						event.preventDefault(); // Prevent default link behavior
					});
				}
			});
		});
	</script>
</body>
</html>