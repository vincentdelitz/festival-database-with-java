<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <jsp:useBean id="bean" scope="request" class="de.tum.in.dbpra.model.bean.ProductListBean"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>Insert a new product</title>
      <!-- Bootstrap -->
      <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-default">
         <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
               <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
               <span class="sr-only">Toggle navigation</span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               </button>
               <a class="navbar-brand" href="#">Festival</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
               <ul class="nav navbar-nav">
                  <li class="dropdown">
                     <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Organiser <span class="caret"></span></a>
                     <ul class="dropdown-menu">
                        <li><a href="#">Sequence Diagram 1</a></li>
                        <li><a href="#">Sequence Diagram 2</a></li>
			<li><a href="./insertProduct">Insert new product</a></li>
                     </ul>
                  </li>
                  <li class="dropdown">
                     <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Visitor <span class="caret"></span></a>
                     <ul class="dropdown-menu">
                        <li><a href="#">Activity Diagram</a></li>
                        <li><a href="./stage">Search personal stages</a></li>
                     </ul>
                  </li>
                  <li class="dropdown">
                     <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Homework Example <span class="caret"></span></a>
                     <ul class="dropdown-menu">
                        <li><a href="./order">Exercise 7.2</a></li>
                        <li><a href="./part">Exercise 7.3</a></li>
                     </ul>
                  </li>
               </ul>
            </div>
            <!-- /.navbar-collapse -->
         </div>
         <!-- /.container-fluid -->
      </nav>

<h3>Which Product do you like to offer in your shop?</h3>
</br>
<% if (request.getAttribute("error") != null) { %>
	<h1>Nothing found!</h1>
	<%= request.getAttribute("error") %>

	<% }  %>
        <div class="box">
		<table  class="table table-striped">
			<tr>
				<th>Name</th>
				<th>ProductID</th>
				<th>Type</th>
				<th>Price</th>
			</tr>
			<%
				for (int i = 0; i < bean.getList().size(); i++) {
			%>
			<tr>
				<td><a href="./InsertProductServlet2?productID=<%=bean.getChild(i).getProductID()%>"><%=bean.getChild(i).getName()%></a></td>
				<td><%=bean.getChild(i).getProductID()%></td>
				<td><%=bean.getChild(i).getType()%></td>
				<td><%=bean.getChild(i).getPrice()%></td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
</div>
<h5>The Product you want to offer is not in the list?</h5>
<a href="./InsertProductServlet3">Insert new Product into the database!</a>

        	

      <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
      <!-- Include all compiled plugins (below), or include individual files as needed -->
      <script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
