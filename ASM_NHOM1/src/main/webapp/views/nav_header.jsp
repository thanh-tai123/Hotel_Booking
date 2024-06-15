<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<Style>
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
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            margin-top: -50px;
        }
        .location-cards .card {
            margin-bottom: 20px;
        }
</Style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/room/index">Booking.com</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <c:choose>
                <c:when test="${not empty username}">
                    <li class="nav-item">
                        <a class="nav-link" href="#">${username}</a>
                    </li>
                 
                    <c:if test="${isAdmin}">
                        <li class="nav-item">
                            <a class="nav-link" href="/admin">Manager</a>
                        </li>
                    </c:if>
                       <li class="nav-item">
                        <a class="nav-link" href="/user/logout">Logout</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="nav-item">
                        <a class="nav-link" href="/user/login">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/user/dangky">Register</a>
                    </li>
                </c:otherwise>
            </c:choose>
            <li class="nav-item">
                <a class="nav-link" href="/service">Service</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Voucher</a>
            </li>
        </ul>
    </div>
</nav>


    <!-- Hero Section -->
    
</body>
</html>