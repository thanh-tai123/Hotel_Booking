<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Regenerate OTP</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f5f5f5;
        }
        .form-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-container .form-control {
            border-radius: 0;
            margin-bottom: 20px;
        }
        .form-container .btn {
            width: 100%;
        }
    </style>
</head>
<body>
  <div class="form-container">
        <h2>Regenerate OTP</h2>
        <form action="/regenerate-otp" method="post">
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="text" id="email" name="email" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary">Regenerate OTP</button>
        </form>
    </div>
</body>
</html>