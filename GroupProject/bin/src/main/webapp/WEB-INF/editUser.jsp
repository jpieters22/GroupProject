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
			<form:form action="/views/${person.id}" method="post" modelAttribute="person">
				<input type="hidden" name="_method" value="put"/>
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
			    <form:input type="hidden" path="email"/> 
			    </p>
			    <p>
			    <form:input type="hidden" path="password" min="0"/>
			    </p> 
			    <section>
                	<input type="hidden" name="owner" value="${ user_id }">
            	</section>
			    <button>Submit</button>
			</form:form> 	
	</section>
</body>
</html>