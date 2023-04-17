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
<title>Get all Job</title>
</head>
<body>
	<h1>Get All Jobs</h1>
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