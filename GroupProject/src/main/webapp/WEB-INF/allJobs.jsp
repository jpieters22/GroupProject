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
<html xmlns:th="http://www.thymeleaf.org">
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<meta charset="UTF-8">

<link href="/css/allJobs.css" rel="stylesheet">
<link rel="stylesheet"
    href="https://code.highcharts.com/css/highcharts.css" />
<meta charset="UTF-8">
<title>Get all Job</title>
</head>
<body>

	<nav class="navbar navbar-expand-lg bg-primary text-light" data-bs-theme="dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Job Tracker</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/addJob">Add Job</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/view/${theUser.id}/edit">Update Account</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/dashboard">Dashboard</a>
        </li>
      </ul>
	<form action="${pageContext.request.contextPath}/search" method="get">
		<label for="query">Search by Position Name or Company:</label>
		<input type="text" name="query" id="query" />
		<button class="btn btn-outline-light" type="submit">Search</button>
	</form>
    </div>
  </div>
</nav>

<div class="container">
	<div class="searchResults">
	<c:if test="${not empty jobs}">
		<h2>Search Results:</h2>
		<table class="table table-striped border mt-3 table-sm">
			<thead>
				<tr>
					<th scope="col">Position</th>
					<th scope="col">Company</th>
					<th scope="col">Location</th>
					<th scope="col">Type</th>
					<th scope="col">Status</th>
					<th scope="col">Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${jobs}" var="job">
					<c:if test="${ job.owner.id == user_id }">
						<tr>
							<td>${job.position}</td>
							<td>${job.company}</td>
							<td>${job.location}</td>
							<td>${job.type}</td>
							<td>${job.status}</td>
							<td>
								<a href="/job/${job.id}/edit">Edit</a> | 
								<a href="/delete/${job.id}">Delete</a> |
								<a href="/job/${job.id}">View</a>
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>

		</c:if>
	
<div class="container">
	<h1>All Jobs</h1>
        <c:set var="count" scope="page" value="0" />
        <c:forEach var="job" items="${ theUser.jobs }">
            <c:if test="${job.position != null}">
               <c:set var="count" scope="page" value="${count + 1}" />
       </c:if>
        </c:forEach>
	<h4><c:out value="${count}"></c:out> Jobs found</h4>

<div class="row">
<c:forEach var="j" items="${ theUser.jobs }">
  <div class="col-sm-6 mb-3 mb-sm-0">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">Position: <c:out value="${j.position }"></c:out></h5>
        <h6 class="card-subtitle mb-2 text-body-secondary">Company Name: <c:out value="${j.company }"></c:out></h6>
        <h6 class="card-subtitle mb-2 text-body-secondary">Location: <c:out value="${j.location }"></c:out></h6>
        <h6 class="card-subtitle mb-2 text-body-secondary">Application Status: <c:out value="${j.status }"></c:out></h6>
        <p class="card-text">Employment Type: <c:out value="${j.type }"></c:out></p>
        <p class="card-text">Note to self: <c:out value="${j.note }"></c:out></p>
        <a href="/job/${j.id}/edit" class="btn btn-primary">Edit</a>
        <a href="/delete/${j.id}" class="btn btn-primary">Delete</a>
      </div>
    </div>
  </div>

</c:forEach>
</div>
</div>


	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>