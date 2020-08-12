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
    
    .col-sm-4 {
    margin: 50px 20px 20px 20px;}

</style>
<body>
	<div class="wrapper">
		<div class="header">
				<a href="/dashboard">Dashboard</a>
		</div>

			<div class="col-sm-4">
                <form:form action="/create" method="post" modelAttribute="lookify">
                    <div class="form-group">
                        <label>Title:</label>
                        <form:input path="title" class="form-control" />
                        <form:errors path="title" class="text-danger" />
                    </div>
                    <div class="form-group">
                        <label>Artist:</label>
                        <form:input path="artist" class="form-control" />
                        <form:errors path="artist" class="text-danger" />
                    </div>
                    
                    
                    <form:label path="rating">Rating
                        <form:select path="rating" class="form-control">
                            <c:forEach items="1,2,3,4,5,6,7,8,9,10" var="rating" varStatus="loop" >
                                <form:option value="${rating}">${rating}</form:option>
                            </c:forEach>
                        </form:select>
                    <form:errors path="rating"/></form:label><br>
                    
                    
                    <input type="submit" value="Add Song" class="btn btn-primary" />
                </form:form>           
            </div>
	
	
	
	

	</div>
</body>
</html>