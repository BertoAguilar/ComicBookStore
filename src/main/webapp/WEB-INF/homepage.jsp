<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Format Date -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- For JSTL Forms -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome <c:out value="${ user.firstName}" /></title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/homepage.css" />
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<!-- YOUR own local JavaScript -->
<script type="text/javascript" src="/js/app.js"></script>

</head>
<body>
	<c:if test="${user.isAdmin == true}">
		<h1>Welcome Admin <c:out value="${user.firstName}" /></h1>
		<a href="/comics/new" class="btn btn-primary">Add A New Comic</a>
	</c:if>
	<c:if test="${user.isAdmin == null or user.isAdmin == false}">
		<h1>Welcome <c:out value="${user.firstName}" /></h1>
	</c:if>
	<a href="/genre" class="btn btn-primary">Genre</a>
	<a href="/logout" class="btn btn-danger">Logout</a>

	<h2>All Of Our Comics</h2>
	<table class="table">
		<thead>
			<tr>
				<th>Title</th>
				<th>Cover Image</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="comic" items="${comics}">
				<tr>
					<td><a href="/comic/details/${comic.id}"> <c:out value="${comic.title}" /></a></td>
					<td><a href="/comic/details/${comic.id}"> <img src="/uploads/cover_pictures/${comic.coverImage}" alt="${comic.title}'s Cover Image" style="width:150px;"></a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>