<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail Page</title>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style>
.card-text {
  font-size: 16px;
  line-height: 1.5;
  color: #333;
  margin-bottom: 10px;
}

.card-title {
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 15px;
}

.btn-primary {
  background-color: #007bff;
  border-color: #007bff;
  color: #fff;
  padding: 10px 20px;
  font-size: 16px;
  border-radius: 5px;
  text-decoration: none;
}
.btn-primary:hover {
  background-color: #0069d9;
  border-color: #0062cc;
}
</style>
</head>
<body>
	<jsp:include page="nav_header.jsp"/>
  <div class="container my-5">
    <div class="card">
        <div class="row no-gutters">
            <div class="col-md-4">
                <img src="/photo/${item.img}" class="card-img" alt="${item.title}">
            </div>
            <div class="col-md-8">
                <div class="card-body">
                    <form action="/bill" method="get">
                        <input type="hidden" name="idRooms" value="${item.idRooms}">
                        <input type="hidden" name="roomNumber" value="${item.roomNumber}">
                        <p class="card-text">Room Number: ${item.roomNumber}</p>
                        <h5 class="card-title">${item.title}</h5>
                        <input type="hidden" name="title" value="${item.title}">
                        <p class="card-text">
                            <input type="hidden" name="amount" value="${item.price}"/>
                            Price: ${item.price}
                        </p>
                        <p class="card-text">Adress: ${item.adress}</p>
                        <input type="hidden" name="adress" value="${item.adress}">
                        <p class="card-text">Room Type: ${item.roomType}</p>
                        <input type="hidden" name="roomType" value="${item.roomType}">
                        <p class="card-text">Bed Type: ${item.bedType}</p>
                        <input type="hidden" name="bedType" value="${item.bedType}">
                        <p class="card-text">Description: ${item.descriptionRooms}</p>
                        Check in: <input type="date" name="checkin" required><br>
                        Check out: <input type="date" name="checkout" required><br>
                        <button type="submit">Booking</button>
                    </form>
                    ${error};
                </div>
            </div>
        </div>
    </div>
</div>
  

</body>
</html>