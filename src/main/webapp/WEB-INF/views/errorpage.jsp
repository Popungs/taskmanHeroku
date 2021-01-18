<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
	h1,h2,div {
		color:red;
		text-align:center;
	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>ERROR PAGE</title>
</head>
<h1 style="color:red" >ERROR PAGE</h1>
<body>
<h2 style ="color:red">ERROR!</h2>

<div class="container">
This means you did something without proper session.
<br/>
Please go back to login.
<br/>
<a type ="button" class="btn btn-danger" href ="/login">Go back to login</a>
</div>


</body>
</html>