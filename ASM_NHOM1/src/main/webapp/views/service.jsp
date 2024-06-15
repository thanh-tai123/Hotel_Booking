<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Service Page</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="nav_header.jsp"/>
<div class="container my-5">
    <h2>Service Paye</h2>
    <form action="submitService" method="POST">
        <div class="form-group">
            <label for="idUser">User ID</label>
            <input type="text" class="form-control" id="idUser" name="idUser" required>
        </div>
        <div class="form-group form-check">
            <input type="checkbox" class="form-check-input" id="wakeup" name="wakeup">
            <label class="form-check-label" for="wakeup">Wakeup</label>
        </div>
        <div class="form-group form-check">
            <input type="checkbox" class="form-check-input" id="roomservice" name="roomservice">
            <label class="form-check-label" for="roomservice">Room Service</label>
        </div>
        <div class="form-group form-check">
            <input type="checkbox" class="form-check-input" id="airport" name="airport">
            <label class="form-check-label" for="airport">Air port</label>
        </div>
        <div class="form-group form-check">
            <input type="checkbox" class="form-check-input" id="laundry" name="laundry">
            <label class="form-check-label" for="laundry">Laundry</label>
        </div>
        <button type="submit" class="btn btn-primary">Send</button>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>