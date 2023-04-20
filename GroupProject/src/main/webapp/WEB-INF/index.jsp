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
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<!-- used for linking css stylesheet from resources/static/css -->
	<link href="/css/styles.css" rel="stylesheet">
	<link href="/css/form.css" rel="stylesheet">
	<!-- ==================================== -->
<title>App Tracker</title>
</head>
<body class="d-flex justify-content-center">
	<div class="container m-5">
		<h1 class="text-center">Login</h1>
		<form:form action="/login" class="mt-4" method="post" modelAttribute="newLogin">
			<section class="d-flex justify-content-between align-items-center">
				<form:label class="form-label col-6" path="email">Email</form:label>
				<form:input class="form-control" path="email" />
			</section>
			<form:errors path="email" class="text-danger fw-semibold" />
			<section class="mt-2 d-flex justify-content-between align-items-center">
					<form:label class="form-label col-6" path="password">Password:</form:label>
					<form:input class="form-control" path="password" type="password"/>
			</section>
			<form:errors path="password" class="text-danger fw-semibold" />
			<button class="btn btn-outline-primary">Login</button>
		</form:form>
		<h3>Register here!</h3>
			<a class="link" href="/register">Register</a>
	</div>
	
	
	
</body>
</html>