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
<!-- importing style-->
<!DOCTYPE html>
<html>
	
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Add Job</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<!-- used for linking css stylesheet from resources/static/css -->
	<link href="/css/styles.css" rel="stylesheet">
	<link href="/css/form.css" rel="stylesheet">
	<!-- ==================================== -->
</head>

<body class="d-flex justify-content-center">
	<div class="container m-5">
		<h1 class="text-center">Add Job</h1>
		<form:form action="/createJob" class="mt-4" method="post" modelAttribute="jobForm">
			<section class="d-flex justify-content-between align-items-center">
				<label class="form-label col-6" for="position">Position</label>
				<input type="text" name="position" class="form-control">
			</section>
			<form:errors path="position" class="text-danger fw-semibold" />
			<section class="mt-2 d-flex justify-content-between align-items-center">
				<label class="form-label col-6" for="company">Company</label>
				<input type="text" name="company" class="form-control">
			</section>
			<form:errors path="company" class="text-danger fw-semibold" />
			<section class="mt-2 d-flex justify-content-between align-items-center">
				<label class="form-label col-6" for="location">Location</label>
				<input type="text" name="location" class="form-control">
			</section>
			<form:errors path="location" class="text-danger fw-semibold" />
			<section class="mt-2 d-flex justify-content-between align-items-center">
				<label class="form-label col-6" for="status">Application Status</label>
				<select class="form-select" name="status" id="">
					<option value="">Choose...</option>
					<option value="Pending">Pending</option>
					<option value="Interview">Interview</option>
					<option value="Declined">Declined</option>
				</select>
			</section>
			<form:errors path="status" class="text-danger fw-semibold " />
			<section class="mt-2 d-flex justify-content-between align-items-center">
				<label class="form-label col-6" for="type">Employment Type</label>
				<select class="form-select" name="type" id="">
					<option value=""></option>
					<option value="Full-Time">Full-Time</option>
					<option value="Contract">Contract</option>
					<option value="Part-Time">Part-Time</option>
				</select>
			</section>
			<form:errors path="type" class="text-danger fw-semibold" />
			<section class="mt-2 d-flex justify-content-between align-items-center">
				<label class="form-label col-6" for="note">Add a note for yourself!</label>
				<textarea name="note" class="form-control" rows="3"></textarea>
			</section>
			<form:errors path="note" class="text-danger fw-semibold" />
			<section>
				<input type="hidden" name="owner" value="${ user_id }" />
			</section>
			<button class="btn btn-outline-primary">Save</button>
		</form:form>
	</div>
<!-- used for linking css stylesheet from resources/statci/css -->
<script src="js/styles.js"></script>
<script src="js/form.js"></script>

</body>

</html>