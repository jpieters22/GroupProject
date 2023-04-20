<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- for forms -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!-- for validation -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" type="text/css" href="/css/style.css">
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>View Job</title>
</head>
<body class="d-flex justify-content-center">
    
     <div class="col-sm-6 mb-3 mb-sm-0">
    <div class="card">
      <div class="card-body">
      <h2 class="card-title">Position: <c:out value="${oneJob.position }"></c:out></h2>
        <h6 class="card-subtitle mb-2 text-body-secondary">Company Name: <c:out value="${oneJob.company }"></c:out></h6>
        <h6 class="card-subtitle mb-2 text-body-secondary">Location: <c:out value="${oneJob.location }"></c:out></h6>
        <h6 class="card-subtitle mb-2 text-body-secondary">Application Status: <c:out value="${oneJob.status }"></c:out></h6>
        <p class="card-text">Employment Type: <c:out value="${oneJob.type }"></c:out></p>
        <p class="card-text">Note to self: <c:out value="${oneJob.note }"></c:out></p>
        <c:if test="${ oneJob.owner.id == user_id }">
        <a href="/job/${oneJob.id}/edit" class="btn btn-primary">Edit</a>
        <a href="/delete/${oneJob.id}" class="btn btn-primary">Delete</a>
        </c:if>
      </div>
    </div>
  </div>

</body>
</html>