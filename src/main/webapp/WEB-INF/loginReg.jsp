<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- For JSTL Forms -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login And Register</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/loginReg.css" />
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<!-- YOUR own local JavaScript -->
<script type="text/javascript" src="/js/app.js"></script>

</head>
<body>
		<div>
			<div>
				<form:form action="/register/user" method="post" modelAttribute="newUser">
					<h1>Register</h1>
					<p>Please enter your email and create a password!</p>
					<p>
						<form:label path="firstName">First Name</form:label>
						<form:errors path="firstName" class="text-danger"/>
						<form:input type="text" path="firstName" placeholder="First Name" />
					</p>
					<p>
						<form:label path="lastName">Last Name</form:label>
						<form:errors class="text-danger" path="lastName" />
						<form:input type="text" path="lastName" placeholder="Last Name" />
					</p>
					<p>
						<form:label path="email">Email</form:label>
						<form:errors class="text-danger" path="email" />
						<form:input type="email" path="email" placeholder="Email" />
					</p>
					<p>
						<form:label path="password">Password</form:label>
						<form:errors class="text-danger" path="password" />
						<form:input type="password" path="password" placeholder="Password" />
					</p>
					<p>
						<form:label path="confirm">Confirm Password</form:label>
						<form:errors class="text-danger" path="confirm" />
						<form:input type="password" path="confirm"
							placeholder="Confirm Password" />
					</p>
					<input type="submit" name="" value="Login">
				</form:form>
			</div>
		</div>
		<div>
			<div>
				<div>
					<form:form action="/login/user" method="post"
						modelAttribute="newLogin">
						<h1>Login</h1>
						<p>Please enter your Email and Password!</p>
						<p>
							<form:label path="email">Email</form:label>
							<form:errors class="text-danger" path="email" />
							<form:input type="email" path="email" placeholder="Email" />
						</p>
						<p>
							<form:label path="password">Password</form:label>
							<form:errors class="text-danger" path="password" />
							<form:input type="password" path="password"
								placeholder="Password" />
						</p>
						<input type="submit" name="" value="Login">
					</form:form>
				</div>
			</div>
		</div>
</body>
</html>