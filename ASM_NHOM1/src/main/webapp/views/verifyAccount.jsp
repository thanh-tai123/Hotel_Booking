<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Verify Account</title>
</head>
<body>
 <h2>Verify Account</h2>
    <form action="/verify-account" method="post">
        Email: <input type="text" name="email"><br>
        OTP: <input type="text" name="otp"><br>
        <input type="submit" value="Verify">
    </form>
</body>
</html>