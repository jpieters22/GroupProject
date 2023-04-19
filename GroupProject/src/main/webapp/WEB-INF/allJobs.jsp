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
<meta charset="UTF-8">
<title>Get all Job</title>
</head>
<body>
	<h1>Search Jobs</h1>
	<form action="${pageContext.request.contextPath}/search" method="get">
		<label for="query">Search by Position Name or Company:</label>
		<input type="text" name="query" id="query" />
		<input type="submit" value="Search" />
	</form>
	<c:if test="${not empty jobs}">
		<h2>Search Results:</h2>
		<table>
			<thead>
				<tr>
					<th>Position</th>
					<th>Company</th>
					<th>Location</th>
					<th>Type</th>
					<th>Status</th>
					<th>Actions</th>
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
	<h1>All Jobs</h1>
	<div>
		<c:set var="count" scope="page" value="0" />
		<c:forEach var="job" items="${ theUser.jobs }">
			<c:if test="${job.position != null}">
	   		<c:set var="count" scope="page" value="${count + 1}" />
	   </c:if>
		</c:forEach>
		<h4><c:out value="${count }"></c:out> Jobs found</h4>
	</div>
	<div class="container">
		<c:forEach var="j" items="${ theUser.jobs }">
			<h3>Position: <c:out value="${j.position }"></c:out></h3>
			<h3>Company Name: <c:out value="${j.company }"></c:out></h3>
			<h3>Location: <c:out value="${j.location }"></c:out></h3>
			<h3>Application Status: <c:out value="${j.status }"></c:out></h3>
			<h3>Employment Type: <c:out value="${j.type }"></c:out></h3>
			<h3>Note to self: <c:out value="${j.note }"></c:out></h3>
		<br />
		</c:forEach>
	</div>

</body>
</html>