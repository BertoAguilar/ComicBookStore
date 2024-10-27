<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
    <h1>Create Genre</h1>
    <form:form action="/genre" method="POST" modelAttribute="genre">
        <form:label path="name">Name: </form:label>
        <form:errors path="name"/>
        <form:input type="text" path="name"/>

        <form:button type="submit" value="submit">Create</form:button>
    </form:form>

    <h1>Genres</h1>
    <table>
        <thead>
            <tr>
                <th>Name</th>
            </tr>
        </thead>

        <tbody>
            <c:forEach var="genre" items="${genres}">
                <tr>
                    <td><c:out value="${genre.name}"></c:out></td>
                </tr>
                <td>
                    <form action="/genre/delete/${genre.id}" method="post">
                        <input type="hidden" name="_method" value="delete">
                        <button type="submit" value="Delete">Delete</button>
                    </form>
                </td>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>