<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<style>
	h1 {
		text-align:center;
	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>List of Tasks</title>
</head>
<body>
<h1 style="color:blue" >List of Tasks</h1>
<div class="container">
	<table class ="table table-striped table-hover table-dark">
		<thead >
			<tr>
				<!-- <th>Task Number</th> -->
				<th>Task Name</th>
				<th>Task description</th>
				<th>Task email</th>
				<th>Task severe</th>
				<th>Task startDate</th>
				<th>Task endDate</th>
				<th></th>
				<th></th>
		
			</tr>
		</thead>
		<tbody>
			<c:forEach items ="${tasklist}" var="tasks">
			<tr>
		<%-- 		<td>${tasks.id} </td> --%>
				<td>${tasks.taskName} </td>
				<td>${tasks.description} </td>
				<td>${tasks.email} </td>
				<td>${tasks.severe} </td>
				<td>${tasks.startDate} </td>
				<td>${tasks.endDate}</td>
				<td><a type ="button" class="btn btn-warning" href ="/edittask?id=${tasks.id}">Update Task</a></td>
				<td><a type ="button" class="btn btn-danger" href ="/deletetask?id=${tasks.id}">Delete Task</a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>	


<div class ="container">
<a type="button" class="btn btn-success"
							href="/addtask">Add a new task</a>
<a type="button" class="btn btn-danger"
							href="/signout">Sign out</a>
</div>
<%-- <ul>
	<c:forEach items ="${tasklist}" var="tasks">
	
	 <li>Task Number : ${tasks.id} </li>
	 <li>Task Name : ${tasks.taskName} </li>
	 <li>Task description  : ${tasks.description} </li>
	 <li>Task email  : ${tasks.email} </li>
	 <li>Task severe  : ${tasks.severe} </li>
	 <li>Task startDate  : ${tasks.startDate} </li>
	 <li>Task endDate : ${tasks.endDate} </li>
	 <br/>
	</c:forEach>

</ul> --%>


</body>
</html>