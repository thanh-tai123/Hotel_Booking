<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>Bill Invoice</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="nav_header.jsp" />

<a href="/room/index">Back to Home</a>
       <div class="container my-5">
    <h2>Bill Invoice</h2>
   <form action="/submitBill" method="post" id="billForm">
    <input type="hidden" name="idRooms" value="${idRooms}">
   
    <div class="row">
        <div class="col-md-6">
           <%--  <div class="form-group">
                <label for="nameUser">Name</label>
                <input type="text" class="form-control" id="nameUser" name="nameUser" value="${username}" readonly>
            </div> --%>
           
             <div class="form-group">
                <label for="roomNumber">Room Number</label>
                <input type="text" class="form-control" id="roomNumber" name="roomNumber" value="${roomNumber}" readonly>
            </div>
          
            <div class="form-group">
                <label for="title">Title</label>
                <input type="text" class="form-control" id="title" name="title" value="${title}" readonly>
            </div>
            
             <div class="form-group">
                <label for="roomType">Room Type</label>
                <input type="text" class="form-control" id="roomType" name="roomType" value="${roomType}" readonly>
            </div>
             <div class="form-group">
                <label for="bedType">Bed Type</label>
                <input type="text" class="form-control" id="bedType" name="bedType" value="${bedType}" readonly>
            </div>
            <div class="form-group">
                <label for="adress">Address</label>
                <input type="text" class="form-control" id="adress" name="adress" value="${adress}" readonly>
            </div>
             <div class="form-group">
                <label for="note">Note</label>
                <textarea class="form-control" id="note" name="note"></textarea>
            </div>
        </div>
        <div class="col-md-6">
             
           
            <div class="form-group">
                <label for="price">Price</label>
                <input type="number" class="form-control" id="price" name="price" value="${pricePerDay}" readonly>
            </div>
            <div class="form-group">
                <label for="dayNumber">Number of Days</label>
                <input type="number" class="form-control" id="dayNumber" name="dayNumber" value="${numberOfDays}" readonly>
            </div>
            <div class="form-group">
                <label for="checkin">Check-in Date</label>
                <input type="date" class="form-control" id="checkin" name="checkin" value="${checkin}" readonly>
            </div>
            <div class="form-group">
                <label for="checkout">Check-out Date</label>
                <input type="date" class="form-control" id="checkout" name="checkout" value="${checkout}" readonly>
            </div>
           
            <div class="form-group">
                <label for="totalAmount">Total Amount</label>
                <input type="number" class="form-control" id="totalAmount" name="totalAmount" value="${Totalamount}" readonly>
            </div>
            <div class="form-group">
                <label>Payment Method</label><br>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="paymentMethod" id="creditCard" value="Credit Card">
                    <label class="form-check-label" for="creditCard">Credit Card</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="paymentMethod" id="tienmat" value="Tien Mat">
                    <label class="form-check-label" for="tienmat">Cash</label>
                </div>
            </div>
        </div>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
</form>
   
    
</div>
       
       <script>
document.getElementById('billForm').addEventListener('submit', function(event) {
    var paymentMethods = document.getElementsByName('paymentMethod');
    var selectedPaymentMethod = Array.from(paymentMethods).find(radio => radio.checked);
    if (!selectedPaymentMethod) {
        alert('Please select a payment method.');
        event.preventDefault();
    }
});
</script>
</body>
</html>