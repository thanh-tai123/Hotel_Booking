<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login </title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<style>
    .box {
        margin: 0px;
        height: 800px;
        background-color: rgb(173, 223, 223);
    }
    .wellcom{
        padding: 5px;
        display:flex;
        align-items: center;
        text-align: center;
        position: relative;
        left: 200px;
    }
</style>
<body>
<div class="container row">
    <div class="container col-6 box d-flex justify-content-center align-items-center" style="height: 100vh;">
        <div class="card p-5 shadow-2">
            <h2 class="text-center mb-4">Sign In</h2>
            <form action="/user/login" method="post">
                <div class="mb-3">
                    <label for="email" class="form-label">UserName</label>
                    <input type="text" class="form-control"  name="email" aria-describedby="emailHelp" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">PassWord</label>
                    <input type="password" class="form-control" name="password"  id="password" required>
                </div>
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="remember-me">
                        <label class="form-check-label" for="remember-me">
                            Remember Me?
                        </label>
                    </div>
                    <a href="/forgot-password" class="text-primary">Forgot Password?</a>
                </div>
                <div class="d-grid">
                    <input type="submit" class="btn btn-primary" value="Login">
                </div>
                <div class="text-center mt-3">
                    Or Log in by:
                    <div class="d-flex justify-content-center mt-3">
                        <a href="#" class="btn btn-outline-primary mx-2">
                            <i class="fa-brands fa-facebook"></i>
                        </a>
                        <a href="#" class="btn btn-outline-danger mx-2">
                            <i class="fa-brands fa-google-plus-g"></i>
                        </a>
                    </div>
                </div>
                <div class="text-center mt-3">
                    You don't have account? <a href="/user/dangky" class="text-primary">Register</a>
                </div>
                <a href="/regenerate-otp">Verify</a>
            </form>
        </div>
    </div>
    <div class=" wellcom  col-6 text-center">
        <h1 >Wellcome to Booking</h1>
    </div>
</body>

</html>