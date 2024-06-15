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
    <form:form class="mt-5 container" action="/admin" modelAttribute="r" method="post"
               enctype="multipart/form-data">
        <h2 class="text-center">Add Room</h2>
    <div class="form-row mt-4">
     <div class="form-group col-md-6">
            <form:label path="category.id">Category:</form:label>
            <form:select path="category.id" class="form-control">
                <c:forEach var="category" items="${categories}">
                    <form:option value="${category.id}">${category.name}</form:option>
                </c:forEach>
            </form:select>
        </div>
    
        <div class="form-group col-md-6">
            <form:label path="bedType">Bed Type:</form:label>
            <form:select path="bedType" class="form-control">
                <form:option value="Single Bed">Single Bed</form:option>
                <form:option value="Double Bed">Double Bed</form:option>
                <form:option value="Queen Bed">Queen Bed</form:option>
                <form:option value="King Bed">King Bed</form:option>
                <!-- Add more bed types as needed -->
            </form:select>
        </div>
       
      
          <div class="form-group col-md-6">
            <form:label path="title">Name Hotel:</form:label>
            <form:input path="title" type="text" class="form-control"
                        id="title" required="required"/>
        </div>
           <div class="form-group col-md-6">
            <form:label path="price">Price:</form:label>
            <form:input path="price" type="text" class="form-control"
                        id="price" required="required"/>
        </div>
    </div>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form:label path="roomType">Room Type:</form:label>
            <form:select path="roomType" class="form-control">
                <form:option value="Single">Single</form:option>
                <form:option value="Superior Room">Superior Room</form:option>
                <form:option value="Standard Room">Standard Room</form:option>
                <form:option value="Triple">Triple</form:option>
                <form:option value="Quad">Quad</form:option>
                <form:option value="Queen">Queen</form:option>
                <!-- Add more room types as needed -->
            </form:select>
        </div>
        <div class="form-group col-md-6">
            <form:label path="roomNumber">Room Number:</form:label>
            <form:input path="roomNumber" type="text" class="form-control"
                        id="roomnumber" required="required"/>
        </div>
      
    </div>
    <div class="form-row">
       
        <div class="form-group col-md-6">
            <form:label path="img">Img:</form:label>
            <input name="photo" type="file"><br>
            <img alt="" src="/photo/${r.img}" width="400px">
        </div>
       
    </div>
    <div class="form-row">
       <%--  <div class="form-group col-md-6">
            <form:label path="idRooms">IdRoom:</form:label>
            <form:textarea path="idRooms" class="form-control"
                           id="description" required="required"/>
        </div> --%>
         <div class="form-group col-md-6">
            <form:label path="descriptionRooms">Description:</form:label>
            <form:textarea path="descriptionRooms" class="form-control"
                           id="description" required="required"/>
        </div>
        <div class="form-group col-md-6">
            <form:label path="adress">Adress:</form:label>
            <form:textarea path="adress" class="form-control"
                           id="adress" required="required"/>
        </div>
    </div>
    <button type="submit" class="btn btn-primary"
            formaction="/room/create">Submit
    </button>
    </form:form>


    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>