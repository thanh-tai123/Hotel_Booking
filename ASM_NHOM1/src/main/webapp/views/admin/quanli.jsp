<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manager</title>
    <link
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
            rel="stylesheet">
</head>
<body>
<jsp:include page="/views/nav_header.jsp"/>
${ mess}
<div class="container my-5">
    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item" role="presentation"><a
                class="nav-link active" id="home-tab" data-toggle="tab" href="#home"
                role="tab" aria-controls="home" aria-selected="true">Insert Room</a></li>
        <li class="nav-item" role="presentation"><a class="nav-link"
                                                    id="profile-tab" data-toggle="tab" href="#profile" role="tab"
                                                    aria-controls="profile" aria-selected="false">Summary</a></li>
        <li class="nav-item" role="presentation"><a class="nav-link"
                                                    id="contact-tab" data-toggle="tab" href="#contact" role="tab"
                                                    aria-controls="contact" aria-selected="false">Service</a></li>
        <li class="nav-item" role="presentation">
            <a class="nav-link" id="user-tab" data-toggle="tab" href="#user" role="tab" aria-controls="user"
               aria-selected="false">User</a>
        </li>

    </ul>
    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="home" role="tabpanel"
             aria-labelledby="home-tab">
            <h3>Home Content</h3>
            <form:form action="/admin" modelAttribute="r" method="post"
                       enctype="multipart/form-data">
                <div class="form-group col-md-6">
                    <form:label path="title">Room Number:</form:label>
                    <form:input path="title" type="text" class="form-control"
                                id="title" required="required"/>
                </div>
                <div class="form-row">
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
                        <form:label path="category.id">Location:</form:label>
                        <form:select path="category.id" class="form-control">

                            <c:forEach var="category" items="${categories}">
                                <form:option value="${category.id}">${category.name}</form:option>
                            </c:forEach>
                        </form:select>
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
                    <div class="form-group col-md-6">
                        <form:label path="price">Price:</form:label>
                        <form:input path="price" type="text" class="form-control"
                                    id="price" required="required"/>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <form:label path="descriptionRooms">Description:</form:label>
                        <form:textarea path="descriptionRooms" class="form-control"
                                       id="description" required="required"/>
                    </div>
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
                        <form:label path="adress">Adress:</form:label>
                        <form:textarea path="adress" class="form-control"
                                       id="adress" required="required"/>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary"
                        formaction="/room/create">Submit
                </button>
            </form:form>
        </div>
        <div class="tab-pane fade" id="user" role="tabpanel" aria-labelledby="user-tab">
            <h3>User Information</h3>
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Phone</th>

                    <th scope="col">Email</th>

                </tr>
                </thead>
                <tbody class="table-group-divider">
                <c:forEach items="${users}" var="user">
                    <tr>
                        <td>${user.nameUsers}</td>
                        <td>${user.phoneNumber}</td>

                        <td>${user.email}</td>

                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="tab-pane fade" id="profile" role="tabpanel"
             aria-labelledby="profile-tab">
            <!-- <h3>Customer</h3>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Phone</th>
                        <th scope="col">CCCD</th>
                        <th scope="col">Room Number</th>
                        <th scope="col">Day</th>
                        <th scope="col">Price</th>
                    </tr>
                </thead>
                <tbody class="table-group-divider">
                    Dynamic content goes here
                </tbody>
            </table> -->
            <h2>Room Summary</h2>
            <table class="table table-bordered table-striped">
                <thead class="thead-dark">
                <tr>
                    <th>Location</th>
                    <th>Sum</th>
                    <th>Count</th>
                    <th>Room Booked</th>
                    <th>Room Emtpy</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${items}">
                    <tr>
                        <td>${item.groupName.name}</td>
                        <td>${item.sum}</td>
                        <td>${item.count}</td>
                        <td>${item.countStatusRoomTrue}</td>
                        <td>${item.countStatusRoomFalse}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

        </div>
        <div class="tab-pane fade" id="contact" role="tabpanel"
             aria-labelledby="contact-tab">
            <h3>Service</h3>
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">Airport</th>
                    <th scope="col">Laundry</th>
                    <th scope="col">Room Service</th>
                    <th scope="col">Wakeup Service</th>
                    <th scope="col">User ID</th>
                </tr>
                </thead>
                <tbody class="table-group-divider">
                <!-- Dynamic content goes here -->
                </tbody>
            </table>
        </div>
    </div>

</div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
        src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
        src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>