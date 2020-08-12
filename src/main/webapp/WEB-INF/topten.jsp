<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Top ten</title>
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
				<p>Top Ten Songs: </p>
    		    <a href="/dashboard">Dashboard</a>
    		    
		</div>

	
	
	
		<table class="table" >
		  <tbody>
		  <c:forEach items="${topTen}" var="song">
		    <tr>
		      <td><c:out value="${song.rating}"/> - <c:out value="${song.title}"/> - <c:out value="${song.artist}"/></td>
		    </tr>
		   </c:forEach> 
		  </tbody>
		</table>
	
	</div>
</body>
</html>