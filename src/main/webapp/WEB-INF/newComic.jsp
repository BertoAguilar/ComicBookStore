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
<title>Add Your Comic!</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/newComic.css" />
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
    	      				<a class="nav-link active" aria-current="page" href="#">Add a New Comic!</a>
        				</li>
        			</c:if>
        			<li class="nav-item">
          				<a href="/logout" class="nav-link">Logout</a>
        			</li>
				</ul>
			</div>
		</div>
	</nav>
	<div>
		<h1>New Comic</h1>
		<form:form action="/newComic" method="POST" modelAttribute="comic" enctype="multipart/form-data">
			<p>
				<form:label path="title">Title</form:label>
				<form:errors path="title" class="text-danger" />
				<form:input path="title" class="input-group" />
			</p>
			<p>
				<form:label path="author">Author</form:label>
				<form:errors path="author" class="text-danger" />
				<form:input path="author" class="input-group" />
			</p>
			<p>
				<form:label path="publisher">Publisher</form:label>
				<form:errors path="publisher" class="text-danger" />
				<form:input path="publisher" class="input-group" />
			</p>
			<p>
				<form:label path="numOfPages">Number Of Pages</form:label>
				<form:errors path="numOfPages" class="text-danger" />
				<form:input type="number" path="numOfPages" class="input-group" />
			</p>
			<p>
				<c:forEach var="genre" items="${genres}">
					<form:label path="genres"><c:out value="${genre.name}"></c:out></form:label>
					<form:checkbox path="genres" value="${genre}"/>
				</c:forEach>
			</p>
            <div>
                <form:label path="coverImage">Comic Book Cover</form:label>
                <input type="file" required id="coverPicture" name="coverPicture"/>
                <form:errors path="coverImage" class="text-danger" />
            </div>

			<div>
				<a href="/Home" class="btn btn-primary">Home</a> <input
					type="submit" value="Submit" class="btn btn-success" />
			</div>
		</form:form>
	</div>
</body>
</html>