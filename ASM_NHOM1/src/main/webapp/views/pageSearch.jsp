<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Page Search</title>
 <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
   <style>
        .hero {
            background: #f8f9fa;
            padding: 50px 0;
            text-align: center;
        }
        .search-box {
            max-width: 600px;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .form-inline .form-group {
            flex: 1;
        }
        .form-inline .form-group:not(:last-child) {
            margin-right: 10px;
        }
        .btn-primary {
            flex-shrink: 0;
        }
    </style>
</head>
<body>
<div class="hero">
    <div class="search-box container">
        <form action="/room/search" method="post" class="form-inline mb-4">
            <div class="form-group mb-2">
                <label for="min" class="sr-only">Min Price</label>
                <input type="number" class="form-control" id="min" name="min" value="${param.min}" placeholder="Min Price">
            </div>
            <div class="form-group mb-2">
                <label for="max" class="sr-only">Max Price</label>
                <input type="number" class="form-control" id="max" name="max" value="${param.max}" placeholder="Max Price">
            </div>
            <button type="submit" class="btn btn-primary mb-2">Search</button>
        </form>
    </div>
</div>
	  <%-- <select name="room" class="form-control">
        <option value="">Select Category</option>
        <c:forEach var="title" items="${roomTitles}">
            <option value="${title}" ${title == param.room ? 'selected' : ''}>${title}</option>
        </c:forEach>
    </select> --%>
</body>
</html>