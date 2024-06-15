<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
 <style>
   
  </style>
</head>
<body>

<div class="container my-5">
  <div class="row row-cols-1 row-cols-md-3 g-4">
    <c:forEach var="item" items="${items}">
      <div class="col">
        <div class="card h-100">
            <a href="/room/detail?idPro=${item.idRooms }"><img src="/photo/${item.img}" class="card-img-top" alt="${item.title}"></a>
          <div class="card-body">
            <h5 class="card-title">${item.title}</h5>
            <p class="card-text">Room ID: ${item.idRooms}</p>
            <p class="card-text">Price: ${item.price}</p>
            <a href="/category/edit/${item.idRooms}" class="btn btn-primary">Edit</a>
          </div>
        </div>
      </div>
    </c:forEach>
  </div>
</div>


</body>
</html>