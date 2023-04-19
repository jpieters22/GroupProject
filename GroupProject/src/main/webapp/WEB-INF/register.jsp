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
<title>App Tracker</title>
</head>
<body>	
	<img id="image" src="https://wpreloaded.com/wp-content/uploads/2018/03/Application-Tracking-System_final-02-1024x355.jpg" alt="trackerImage" />
		<form:form class="row g-3 " action="/register" method="post" modelAttribute="newUser">
		<h3>Register</h3>
  			<p class="col-md-6">
		        <form:label class="form-label" path="firstName">First Name:</form:label>
		        <form:errors class="text-danger fw-semibold" path="firstName"/>
		        <form:input class="form-control" path="firstName"/>
		    </p>
		    <p class="col-md-6">
		        <form:label class="form-label" path="lastName">Last Name:</form:label>
		        <form:errors class="text-danger fw-semibold" path="lastName"/>
		        <form:input class="form-control" path="lastName"/>
		    </p>
		    <p class="col-6">
		        <form:label class="form-label" path="email">Email:</form:label>
		        <form:errors class="text-danger fw-semibold" path="email"/>
		        <form:input class="form-control" path="email"/>
		    </p>
		    <p class="col-6">
		        <form:label class="form-label" path="password">Password:</form:label>
		        <form:errors class="text-danger fw-semibold" path="password"/>     
		        <form:input class="form-control" type="password" path="password" min="0"/>
		    </p>    
		   	<p class="col-md-6">
		        <form:label class="form-label" path="confirmPassword">Confirm Password:</form:label>
		        <form:errors class="text-danger fw-semibold" path="confirmPassword"/>     
		        <form:input class="form-control" type="password" path="confirmPassword" min="0" />
		    </p>    
		    <div class="col-12">
   				<button style="padding-right: 95px" type="submit" class="btn btn-primary">Register</button>
 			</div>
		</form:form>
		<div class="page">
			<a class="link" href="/">Have an account? Login</a>
		</div> 	
	</body>
</html>