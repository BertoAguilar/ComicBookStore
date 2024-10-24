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
    <h1>
        Welcome
        <c:out value="${user.firstName}" />
    </h1>
    <a href="/comics/new" class="btn btn-primary">Add A New Comic</a>
    <a href="/logout" class="btn btn-danger">Logout</a>

    <h2>All Comics</h2>
    <table class="table">
        <thead>
            <tr>
                <th>Title</th>
                <th>Author</th>
                <th>Number of Pages</th>
                <th>Cover Image</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="comic" items="${comics}">
                <tr>
                    <td>
                        <a href="/teams/details/${comic.title}">
                            <c:out value="${comic.title}" />
                        </a>
                    </td>
                    <td><c:out value="${comic.author}" /></td>
                    <td><c:out value="${comic.numOfPages}" /></td>
                    <td>
                        <img src="/uploads/cover_pictures/${comic.coverImage}" alt="${comic.title}'s Cover Image">
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
<img src="/uploads/cover_pictures/spidermanComicCover.jpg"/>

</body>
</html>