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
<title>Add The New Player</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/newPlayer.css" />
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<!-- YOUR own local JavaScript -->
<script type="text/javascript" src="/js/app.js"></script>

</head>
<body>
	<h2>
		<c:out value="${error}"></c:out>
	</h2>
	<div>
		<h1>New Comic</h1>
		<form:form action="/players" method="post"
			enctype="multipart/form-data" modelAttribute="player">
			<p class="formContainer">
				<form:errors path="playerName" class="text-danger" />
				<form:input path="playerName" class="input-group"
					placeholder="Players Name" />
			</p>
			<div>
				<label for="profilePicture">Profile Picture:</label> <input
					type="file" id="profilePicture" name="profilePicture">
			</div>
			<div class="formContainer">
				<a href="/teams" class="btn">Home</a> <input type="submit"
					value="Submit" class="btn" />
			</div>
		</form:form>
	</div>
</body>
</html>