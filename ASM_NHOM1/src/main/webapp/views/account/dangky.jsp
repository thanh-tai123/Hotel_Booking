<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="/views/nav_header.jsp"/>
<
<div class="container my-5">
    <h2>Register</h2>
    <form:form action="/user/dangky" method="post" modelAttribute="item">
        <div class="form-group">
            <label for="name">Name:</label>
            <form:input type="text" class="form-control" id="name" path="nameUsers" required="true"/>
            <form:errors path="nameUsers" cssClass="mgs_errors"></form:errors><br>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <form:password class="form-control" id="password" path="passwordUsers" required="true"/>
            <form:errors path="passwordUsers" cssClass="mgs_errors"></form:errors><br>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <form:input type="email" class="form-control" id="email" path="email" required="true"/>
            <form:errors path="email" cssClass="mgs_errors"></form:errors><br>
        </div>
        <div class="form-group">
            <label for="phone">Phone Number:</label>
            <form:input type="tel" class="form-control" id="phone" path="phoneNumber" pattern="[0-9]{10,15}"
                        required="true"/>
            <form:errors path="phoneNumber" cssClass="mgs_errors"></form:errors><br>
        </div>
        <div class="form-group">
            <label for="address">Adress:</label>
            <form:textarea class="form-control" id="address" path="adress" rows="3" required="true"></form:textarea>
            <form:errors path="adress" cssClass="mgs_errors"></form:errors><br>
        </div>
        <button type="submit" class="btn btn-primary" formaction="/user/create">Register</button>
    </form:form>
</div>
<body>
<%-- <h2>Register</h2>
   <form action="/register" method="post">
       Name: <input type="text" name="name"><br>
       Email: <input type="text" name="email"><br>
       Password: <input type="password" name="password"><br>
       Adress: <input type="text" name="adress"><br>
       Phone: <input type="text" name="phoneNumber"><br>
       <input type="submit" value="Register">
   </form> --%>
</body>
</html>