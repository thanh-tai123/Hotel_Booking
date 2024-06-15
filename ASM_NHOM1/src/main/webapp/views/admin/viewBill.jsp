<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container-fluid">
    <jsp:include page="nav-ad-header.jsp"/>

    <h3 class="text-center mt-5">Report Information</h3>
        <table class="table">
            <thead>
            <tr>
                <th scope="col">ID Bill</th>
                <th scope="col">Name</th>
                <th scope="col">Phone</th>
                <th scope="col">Room Number</th>
                <th scope="col">Room Type</th>
                <th scope="col">Check-in</th>
                <th scope="col">Check-out</th>
                <th scope="col">Total Amount</th>
            </tr>
            </thead>
            <tbody class="table-group-divider">
            <c:forEach items="${reportbill}" var="report">
                <tr>
                    <td>${report.idBill}</td>
                    <td>${report.nameUsers}</td>
                    <td>${report.phoneNumber}</td>
                    <td>${report.roomNumber}</td>
                    <td>${report.roomType}</td>
                    <td>${report.checkIn}</td>
                    <td>${report.checkOut}</td>
                    <td>${report.totalAmount}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>