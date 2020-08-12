<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
   

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Edit song</title>
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
      font-family: sans-serif;
    }

</style>
<body>
<div class="wrapper">


	<form:form action="/${lookify.id}/update" method="post" modelAttribute="lookify">
	    <input type="hidden" name="_method" value="put">
	    <p>
	        <form:label path="title">Title</form:label>
	        <form:errors path="title"/>
	        <form:input path="title"/>
	    </p>
	    <p>
	        <form:label path="artist">Artist</form:label>
	        <form:errors path="artist"/>
	        <form:textarea path="artist"/>
	    </p>
	    <p>
	        <form:label path="rating">Rating</form:label>
	        <form:errors path="rating"/>
	        <form:input path="rating"/>
	    </p>    
	    <input type="submit" value="Update" class="btn btn-primary"/>
	</form:form>
	
</div>
</body>
</html>