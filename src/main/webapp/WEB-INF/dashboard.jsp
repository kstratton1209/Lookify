<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Dashboard</title>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    
</head>
<style>

    .wrapper{
      width:700px;
      margin-left: 20px;
      padding: 20px;
      justify-content: space-between;
    }
    
    .header {
    display:flex;
    justify-content: space-between;
  	align-items: center;
	text-align: center;
    }
    
    .table {
    margin: 50px 20px 20px 20px;}

</style>
<body>
	<div class="wrapper">
		<div class="header">
				<a href="/add">Add new song</a>
				<a href="/topTen">Top songs</a>
				 <form:form action="/search" method="post" modelAttribute="lookify" class="form-inline my-2 my-lg-0">
              
      				<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="q">
      				<button class="btn btn-outline-success my-2 my-sm-0 btn-sm" type="submit">Search</button>
    		    </form:form> 
		</div>

	
	
	
		<table class="table" >
		  <thead>
		    <tr>
		      <th scope="col">Title</th>
		      <th scope="col">Rating</th>
		      <th scope="col">Action</th>
		    </tr>
		  </thead>
		  <tbody>
		  <c:forEach items="${all}" var="song">
		    <tr>
		      <td><a href="${song.id}/details" <c:out value="${song.title}"/>><c:out value="${song.title}"/></a></td>
			  <td><c:out value="${song.rating}"/></td>
			  <td> <a href="${song.id}/delete">Delete</a> <a href="${song.id}/edit">Edit</a> </td>
		    </tr>
		   </c:forEach> 
		  </tbody>
		</table>
	
	</div>
</body>
</html>