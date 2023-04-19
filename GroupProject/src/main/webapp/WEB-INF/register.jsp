<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- for forms -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!-- for validation -->
<%@ page isErrorPage="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css"> 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

<!-- My CSS -->
<link href="/css/styles.css" rel="stylesheet">
<link href="/css/form.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">
<meta charset="UTF-8">
<title>Register</title>
</head>
<body class="d-flex justify-content-center">
	<div class="container m-5">
		<h1 class="text-center">Register</h1>
		<form:form action="/register" class="mt-4" method="post" modelAttribute="newUser">
			<section class="d-flex justify-content-between align-items-center">
				<label class="form-label col-6" for="firstName">First Name:</label>
				<input type="text" name="firstName" class="form-control">
			</section>
			<form:errors path="firstName" class="text-danger fw-semibold" />
			<section class="mt-2 d-flex justify-content-between align-items-center">
				<label class="form-label col-6" for="lastName">Last Name:</label>
				<input type="text" name="lastName" class="form-control">
			</section>
			<form:errors path="lastName" class="text-danger fw-semibold" />
			<section class="mt-2 d-flex justify-content-between align-items-center">
				<label class="form-label col-6" for="email">Email:</label>
				<input type="text" name="email" class="form-control">
			</section>
			<form:errors path="email" class="text-danger fw-semibold" />
			<section class="mt-2 d-flex justify-content-between align-items-center">
				<label class="form-label col-6" for="password">Password:</label>
				<input type="password" name="password" class="form-control">
			</section>
			<form:errors path="password" class="text-danger fw-semibold" />
			<section class="mt-2 d-flex justify-content-between align-items-center">
				<label class="form-label col-6" for="confirmPassword">Confirm Password:</label>
				<input type="password" name="confirmPassword" class="form-control">
			</section>
			<form:errors path="confirmPassword" class="text-danger fw-semibold" />
			<button class="btn btn-outline-primary">Register and Login</button>
		</form:form>
		<h3>Have an Account?</h3>
			<a class="link" href="/">Login</a>
	</div>
	
	
	
</body>
</html>