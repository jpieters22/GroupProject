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
<body class="d-flex justify-content-center">
	
	<div class="container m-5">
		<h1 class="text-center">Edit User</h1>
		<form:form action="/views/${person.id}" class="mt-4" method="post" modelAttribute="person">
			<input type="hidden" name="_method" value="put"/>
			<section class="d-flex justify-content-between align-items-center">
				<form:label class="form-label col-6" path="firstName">First Name:</form:label>
				<form:input class="form-control" path="firstName" />
			</section>
			<form:errors path="firstName" class="text-danger fw-semibold" />
			<section class="mt-2 d-flex justify-content-between align-items-center">
					<form:label class="form-label col-6" path="lastName">Last Name:</form:label>
					<form:input class="form-control" path="lastName"/>
			</section>
			<p>
				    	<form:input type="hidden" path="email"/> 
				    </p>
				    <p>
				    	<form:input type="hidden" path="password" min="0"/>
				    </p>
				    <p>
				    	<form:input type="hidden" path="confirmPassword" value="${ person.password }" />
				    </p>  
			<section>
				<input type="hidden" name="owner" value="${ user_id }">
			</section>
			<c:if test="${ person.id == user_id }">
                <button class="btn btn-outline-primary">Update</button>
            </c:if>
            <a href="/dashboard"><button type="button" class="btn btn-warning">Cancel</button></a>
		</form:form>
	</div>
</body>
</html>