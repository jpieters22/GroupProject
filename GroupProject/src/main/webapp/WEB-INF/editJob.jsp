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
	<title>Edit Job</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<!-- used for linking css stylesheet from resources/static/css -->
	<link href="/css/styles.css" rel="stylesheet">
	<link href="/css/form.css" rel="stylesheet">
	<!-- ==================================== -->
</head>
<body class="d-flex justify-content-center">
	<div class="container m-5">
		<h1 class="text-center">Edit Job</h1>
		<form:form action="/job/${oneJob.id}" class="mt-4" method="post" modelAttribute="oneJob">
			<input type="hidden" name="_method" value="put"/>
			<section class="d-flex justify-content-between align-items-center">
				<form:label class="form-label col-6" path="position">Position</form:label>
				<form:input class="form-control" path="position" />
			</section>
			<form:errors path="position" class="text-danger fw-semibold" />
			<section class="mt-2 d-flex justify-content-between align-items-center">
					<form:label class="form-label col-6" path="company">Company Name:</form:label>
					<form:input class="form-control" path="company"/>
			</section>
			<form:errors path="company" class="text-danger fw-semibold"/>
			<section class="mt-2 d-flex justify-content-between align-items-center">
					<form:label class="form-label col-6" path="location">Location:</form:label>
					<form:input class="form-control" path="location"/>
			</section>
			<form:errors path="location" class="text-danger fw-semibold"/>
			<section class="mt-2 d-flex justify-content-between align-items-center">
				<form:label class="form-label col-6" path="type">Employment Type:</form:label>
				<form:select class="form-control" path="type">
					<form:option value="Full-Time" path="type">Full-Time</form:option>
					<form:option value="Part-Time" path="type">Part-Time</form:option>
					<form:option value="Contract" path="type">Contract</form:option>
				</form:select>
			</section>
			<form:errors path="type" class="text-danger fw-semibold"/>
			<section class="mt-2 d-flex justify-content-between align-items-center">
				<form:label class="form-label col-6" path="status">Application Status:</form:label>
				<form:select class="form-control" path="status">
					<form:option value="Pending" path="type">Pending</form:option>
					<form:option value="Declined" path="type">Declined</form:option>
					<form:option value="Interview" path="type">Interview</form:option>
				</form:select>
			</section>  
			<form:errors path="status" class="text-danger fw-semibold"/>
			<section class="mt-2 d-flex justify-content-between align-items-center">
				<form:label class="form-label col-6" path="note">Update your note!</form:label>
				<textarea name="note" class="form-control" rows="3"></textarea>
			</section>
			<form:errors path="note" class="text-danger fw-semibold"/>
			<section>
				<input type="hidden" name="owner" value="${ user_id }">
			</section>
			<c:if test="${ user_id == user_id }">
                <button class="btn btn-outline-primary">Update</button>
            </c:if>
			<a href="/dashboard"><button type="button" class="btn btn-warning">Cancel</button></a>
		</form:form>
	</div>

</body>
</html>