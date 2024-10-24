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


            <div>
                <form:label path="coverImage">Comic Book Cover</form:label>
                <input type="file" id="coverPicture" name="coverPicture"/>
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