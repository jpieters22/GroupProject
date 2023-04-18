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
<body>
	<header>
		<nav>
		
		</nav>
	</header>
	<main class="container">
		<section class="login">
		<h1>App Tracker</h1>
			<h2>Login</h2>
				<form:form action="/login" method="post" modelAttribute="newLogin">
				    <p>
				        <form:label path="email">Email:</form:label>
				        <form:errors path="email"/>
				        <form:input path="email"/>
				    </p>
				    <p>
				        <form:label path="password">Password:</form:label>
				        <form:errors path="password"/>     
				        <form:input type="password" path="password" min="0"/>
				    </p>    
				    <button>Submit</button>
			</form:form> 
		<div class="page">
			<h3>Register here!</h3>
			<a class="link" href="/register">Register</a>
		</div>
		</section>
	</main>
	<footer>

	</footer>
</body>
</html>