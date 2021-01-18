<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
	h2,div{
		text-align : center;
	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Please add task</title>
</head>
<body>
<h2>Enter the task</h2>

<form method = "post">
<c:if test="${not empty error}">
   Error: ${error}
</c:if>


<div class ="container">
Task Name : <input type = "text" name ="taskName" required >
<br/>

Task Email : <input type = "email" name ="email" required>
<br/>

<label for ="severe" >Task Severity</label>
<select name ="severe" required >
<option value ="high">High</option>
<option value ="Medium">Medium</option>
<option value ="Low">Low</option>
</select>

<br/>

<label for ="startDate"> StartDate</label>
<input type ="date" id ="startDate"   name="startDate" required >

<br/>
 <label for ="endDate</"> EndDate</label>
<input type ="date" id ="endDate"  name ="endDate" required>

<br/>

<label for ="description">Task description</label>
<br/>
<textarea  name="description" rows="4" cols="50" required ></textarea>

<br/>
<button class = "btn btn-success" type ="submit">Register task</button>



</div>
</form>
<br/>
<div class= "container">
	
	<a type="button" class="btn btn-danger"
							href="/displaytask">Go back to display task</a>
</div>




</body>
</html>