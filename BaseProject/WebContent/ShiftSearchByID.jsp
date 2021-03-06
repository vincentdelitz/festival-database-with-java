<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>Festival Database</title>
      <!-- Bootstrap -->
      <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@include file="./header.jsp" %>
<div class="container-fluid">
		<div class="row">
			<div class="col-md-10">

<% if (request.getAttribute("error3") != null) { %>
		<h3>There is no employee named <%=request.getParameter("firstname")%> <%=request.getParameter("lastname")%> with the following Person ID: <%=request.getParameter("personID")%></h3>
		<br>
		<h4>Try again</h4>
		<br>
    <% } else { %>
		<h3>There are more employees with your name <%=request.getParameter("firstname")%> <%=request.getParameter("lastname")%> !</h3>
		<br>
		<h4>Please also enter your employee ID</h4>
		<br>
	<% } %>
<div class="row">
	<div class="col-md-4">
	<form method="post" action="./ShiftServlet2">
		<div class="form-group">
			<label for="firstname">First Name:</label>
			<input class="form-control" type="text" name="firstname" id="firstname" value=<%=session.getAttribute("firstname")%> />
		</div>	
		<div class="form-group">
			<label for="lastname">Last Name:</label>
			<input class="form-control" type="text" name="lastname" id="lastname" value=<%=session.getAttribute("lastname")%> />
		</div>
		<div class="form-group">
			<label for="personID">Person ID</label>
			<input class="form-control" type="number" name="personID" id="personID" default="1" />
		</div>
		<button type="submit" class="btn btn-primary">Get Shifts</button>
	</form>
	</div>
	</div>
		</div>
	</div>
</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
	
</body>
</html>