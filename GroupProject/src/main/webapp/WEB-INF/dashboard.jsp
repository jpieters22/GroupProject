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
<title>Insert title here</title>
</head>
<body>
	<h1>Home</h1>
	<a href="/view/${theUser.id}/edit">Edit User</a>
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
	

	
</body>
</html>