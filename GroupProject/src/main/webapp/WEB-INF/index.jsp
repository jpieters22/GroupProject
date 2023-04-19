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

<!-- My CSS -->
<link rel="stylesheet" type="text/css" href="/css/styles.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">
<meta charset="UTF-8">
<title>App Tracker</title>
</head>
<body class="d-flex justify-content-center">
	<img id="image" src="https://wpreloaded.com/wp-content/uploads/2018/03/Application-Tracking-System_final-02-1024x355.jpg" alt="trackerImage" />
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
					<form:input class="form-control" path="password"/>
			</section>
			<form:errors path="password" class="text-danger fw-semibold" />
			<button class="btn btn-outline-primary">Login</button>
		</form:form>
		<h3>Register here!</h3>
			<a class="link" href="/register">Register</a>
	</div>
	
	
	
</body>
</html>