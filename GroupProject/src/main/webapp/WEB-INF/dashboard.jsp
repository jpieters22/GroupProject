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

<link href="css/dashboard.css" rel="stylesheet">
<title>App Dashboard</title>
</head>
<body>
	<h1>Job Status Count</h1>
	<c:set var="countPending" scope="page" value="0" />
	<c:set var="countDeclined" scope="page" value="0" />
	<c:set var="countInterview" scope="page" value="0" />
	<c:forEach items="${theUser.jobs}" var="j">
	   <c:if test="${j.status == 'Pending'}">
	   		<c:set var="countPending" scope="page" value="${countPending + 1}" />
	   </c:if>
	   <c:if test="${j.status == 'Declined'}">
	      	<c:set var="countDeclined" scope="page" value="${countDeclined + 1}" />
	   </c:if>
	   <c:if test="${j.status == 'Interview'}">
	      	<c:set var="countInterview" scope="page" value="${countInterview + 1}" />
	   </c:if>
	</c:forEach>
	<div class="topNav">
<button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#pending" aria-expanded="false" aria-controls="collapseWidthExample">
    Pending
  </button>

<div style="min-height: 120px;">
  <div class="collapse collapse-horizontal" id="pending">
    <div class="card card-body" style="width: 300px;">
      <p>Jobs Pending: <c:out value="${countPending}" /> </p>
    </div>
  </div>
</div>

<button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#declined" aria-expanded="false" aria-controls="collapseWidthExample">
    Declined
  </button>

<div style="min-height: 120px;">
  <div class="collapse collapse-horizontal" id="declined">
    <div class="card card-body" style="width: 300px;">
      <p>Jobs Declined: <c:out value="${countDeclined}" /> </p>
    </div>
  </div>
</div>

<button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#interview" aria-expanded="false" aria-controls="collapseWidthExample">
    Interview
  </button>

<div style="min-height: 120px;">
  <div class="collapse collapse-horizontal" id="interview">
    <div class="card card-body" style="width: 300px;">
      <p>Jobs scheduled for an interview: <c:out value="${countInterview}" /> </p>
    </div>
  </div>
</div>

	<a href="/view/${theUser.id}/edit">Edit User</a>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>