<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<style>
	h3, div {
		text-align:center;
	}
	p {
		color:red;
	}
</style>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Register user</title>
</head>
<body>
<h3>Please enter user information to register</h3>

<div class ="container">
<form method = "post">

<c:if  test="${not empty error}">
  <p> Error: ${error} </p>
</c:if>



Name : <input type = "text" name ="uname" required>
<br/>
Password: <input type = "password" name ="pass" required>

<br/>

<button class = "btn btn-success" type ="submit">Register</button>
<a type ="button" class="btn btn-success" href ="/login">Click here to login</a>



</form>
</div>


</body>
</html>