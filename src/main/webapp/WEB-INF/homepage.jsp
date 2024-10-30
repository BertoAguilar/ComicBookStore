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
<c:set var="isAdmin" value="#{user.isAdmin == true}" />
<c:set var="isNotAdmin" value="#{user.isAdmin == null or user.isAdmin == false}"/>
	<nav class="navbar navbar-expand-lg border border-secondary mb-3" style="background-color: #e1ecfd">
		<div class="container-fluid">
			<a class="navbar-brand" href="/Home">Comic Book Store</a>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item">
          				<a class="nav-link active" aria-current="page" href="#">Dashboard</a>
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
	<div class="container" style="width: 75%">
		<c:if test="${isAdmin}">
			<h1>Welcome, Admin <c:out value="${user.firstName}" /></h1>
		</c:if>
		<c:if test="${isNotAdmin}">
			<h1>Welcome, <c:out value="${user.firstName}" /></h1>
		</c:if>
		<div class="container mt-3" style="width: 60%">
			<h2>All Of Our Comics</h2>
			<table class="table table-hover table-bordered">
				<thead>
					<tr>
						<th>Title</th>
						<th>Cover Image</th>
					</tr>
				</thead>
				<tbody class="table-group-divider">
					<c:forEach var="comic" items="${comics}">
						<tr>
							<td><a href="/comic/details/${comic.id}"> <c:out value="${comic.title}" /></a></td>
							<td><a href="/comic/details/${comic.id}"> <img src="/uploads/cover_pictures/${comic.coverImage}" alt="${comic.title}'s Cover Image" style="width:150px;"></a></td>
		                </tr>
		            </c:forEach>
		        </tbody>
		    </table>
		</div>
	</div>
</body>
</html>