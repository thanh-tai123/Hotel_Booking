<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
	<style type="text/css">
	.room-card {
    position: relative;
    overflow: hidden;
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

	.card img {
	height: 200px;
	object-fit: cover;
}
	</style>
</head>
<body>

<jsp:include page="nav_header.jsp" />
	<jsp:include page="pageSearch.jsp" />
<div class="container location-cards">
<a href="/room/index">Back to Home</a>
    <h2 class="mb-4">Search Results</h2>
    
    <div class="row">
        <c:forEach var="item" items="${pagex}">
            <div class="col-md-3">
                <div class="card room-card">
                    <a href="/room/detail?idPro=${item.idRooms}">
                        <img src="/photo/${item.img}" class="card-img-top" alt="${item.title}">
                    </a>
                    <div class="card-body">
                        <h5 class="card-title">${item.title}</h5>
                        <p class="price">Price: ${item.price}</p>
                        <a class="btn btn-primary">More Infor</a>
                    </div>
                    <div class="room-status ${item.statusRoom ? 'booked' : 'available'}">
                        ${item.statusRoom ? 'Booked' : 'Empty'}
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>