<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login In Page</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="/views/nav_header.jsp"/>
<%-- <div class="container my-5">
        <h2>Đăng Nhập</h2>
        <form:form action="/user/login" method="post" modelAttribute="u">
            <div class="form-group">
                <label for="name">Tên:</label>
                <form:input type="text" class="form-control" id="name" path="nameUsers" required="true"/>
                <form:errors path="nameUsers" cssClass="mgs_errors"></form:errors><br>
            </div>
            <div class="form-group">
                <label for="password">Mật Khẩu:</label>
                <form:password class="form-control" id="password" path="passwordUsers" required="true"/>
                <form:errors path="passwordUsers" cssClass="mgs_errors"></form:errors><br>
            </div>
           ${error }
            <button type="submit" class="btn btn-primary" >Đăng Nhập</button>
        </form:form>
    </div> --%>
    ${error }
	 <h2>Login</h2>
    <form action="/user/login" method="post">
        Email: <input type="text" name="email"><br>
        Password: <input type="password" name="password"><br>
        <input type="submit" value="Login">
    </form>
    
    <a href="/user/dangky">Dang Ky</a>
    <a href="/forgot-password">Quen mat khau</a>
    <a href="/regenerate-otp">Kich hoat</a>
</body>
</html>