<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>     
<!DOCTYPE html>
<html>
<head>
<style>
	h1,h2,div {
		text-align :center;
	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Displaying task details</title>
</head>
<body>

<h1>Displaying task details</h1>
<h2>Enter the fields if you want to edit task</h2>
<div class ="container"> 
<form:form method ="post" modelAttribute ="task">
	

	<td>Current Task ID (number) : ${task.id} </td>
	<td> <form:hidden path="id"/> </td>
	<br/>
	<td>Current Task Name : </td>
	<td>${task.taskName } </td>
	<br/>
	<td>new task name: </td>
	<td><form:input path="taskName" type ="text" required="required"/></td>
	<br/>



	
		
	<td>Current Task email : </td>
	<td>${task.email}</td>
	<br/>
	<td>new email : </td>
	<td><form:input path="email"  type ="email" required="required" /></td>
	<br/>
	
	<td>Current Task severity : </td>
	<td>${task.severe } </td>
	<br/>
	<td>new severity : </td>
	<td><form:label path="severe"></form:label></td>
	<select name = "severe" required="required"  >
	<option value ="high">High</option>
	<option value ="Medium">Medium</option>
	<option value ="Low">Low</option>
	</select>
	<br/>
	
	<td>Current Task start date : </td>
	<td> ${task.startDate} </td>
	<br/>
	<td><form:label path ="startDate"> StartDate </form:label>
	<input type ="date" id ="startDate"   name="startDate" required="required" >
	<br/>
	
	<td>Current Task end Date : </td>
	<td> ${task.endDate} </td>
	<br/>
	<td><form:label path ="endDate"> endDate </form:label>
	<input type ="date" id ="endDate"   name="endDate" required="required"  >
	<br/>
	<td>Current Task Description : </td>
	<td>${task.description } </td>
	<br/>
	<td>new task description : <td>
	<br/>
	<td><form:label path="description" /></td>
	<textarea name ="description" rows="4"cols="50" required="required" ></textarea>
	<br/>
		
	
	
	<td><input type ="submit" class="btn btn-warning"  type="submit" formaction="edit" value="Click here to Edit"></td>
 	
	


<%-- 	<td>${tasks.description} </td>
				<td>${tasks.email} </td>
				<td>${tasks.severe} </td>
				<td>${tasks.startDate} </td>
				<td>${tasks.endDate}</td> --%>

</form:form>
</div>

</body>
</html>