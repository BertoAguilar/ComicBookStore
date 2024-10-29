<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- For JSTL Forms -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head> 
<meta charset="ISO-8859-1">
<title><c:out value="${comic.title}" /></title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css" />
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<!-- YOUR own local JavaScript -->
<script type="text/javascript" src="/js/app.js"></script>

</head>
<body>
<c:set var="isAdmin" value="#{user.isAdmin == true}" />
<c:set var="isNotAdmin" value="#{user.isAdmin == null or user.isAdmin == false}"/>
	<nav class="navbar navbar-expand-lg border border-secondary mb-3" style="background-color: #e1ecfd">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Comic Book Store</a>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item">
          				<a class="nav-link" aria-current="page" href="/Home">Dashboard</a>
        			</li>
        			<li class="nav-item">
          				<a class="nav-link" aria-current="page" href="/genre">Add/View Genres</a>
        			</li>
        			<c:if test="${isAdmin}">
	        			<li class="nav-item">
    	      				<a class="nav-link" aria-current="page" href="/comics/new">Add a New Comic!</a>
        				</li>
        			</c:if>
        			<li class="nav-item">
          				<a href="/logout" class="nav-link">Logout</a>
        			</li>
				</ul>
			</div>
		</div>
	</nav>
	<h1><c:out value="${comic.title}" /></h1>
	<p><img src="/uploads/cover_pictures/${comic.coverImage}"
		alt="${comic.title}'s Cover Image" style="width: 150px;"></p>
	<p>Written By: <c:out value="${comic.author}" /></p>
	<p>Number Of Pages: <c:out value="${comic.numOfPages}" /></p>
	
	<a href="/Home" class="btn btn-primary">Home</a>	
	<c:if test="${user.isAdmin == true}">
		<a href="/comics/edit/${comic.id}" class="btn btn-warning">Edit</a>
		<form action="/comics/destroy/${comic.id}" method="post">
			<input type="hidden" name="_method" value="delete"> 
			<input type="submit" value="Delete" class="btn btn-danger">
		</form>
	</c:if>
	</body>
</html>