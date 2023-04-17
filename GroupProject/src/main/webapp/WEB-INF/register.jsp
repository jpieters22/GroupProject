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
<title>Insert title here</title>
</head>
<body>
	<section class="container">
		<h1>App Tracker</h1>
		<h2>Register</h2>
			<form:form action="/register" method="post" modelAttribute="newUser">
				<p>
			        <form:label path="firstName">First Name:</form:label>
			        <form:errors path="firstName"/>
			        <form:input path="firstName"/>
			    </p>
			    <p>
			        <form:label path="lastName">Last Name:</form:label>
			        <form:errors path="lastName"/>
			        <form:input path="lastName"/>
			    </p>
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
			   	<p>
			        <form:label path="confirmPassword">Confirm Password:</form:label>
			        <form:errors path="confirmPassword"/>     
			        <form:input type="password" path="confirmPassword" min="0" />
			    </p>    
			    <button>Submit</button>
			</form:form>
			<div class="page">
				<h3>Have an account?</h3>
				<a class="link" href="/">Login</a>
			</div> 	
	</section>
</body>
</html>