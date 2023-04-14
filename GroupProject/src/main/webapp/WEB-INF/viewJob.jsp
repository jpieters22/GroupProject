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
<title>Insert title here</title>
</head>
<body>
    <main>
    	<h1>${ oneJob.position }</h1>
    	<h2>(added by <c:out value="${theUser.firstName}"></c:out>)</h2> 
    	<br />
    	<h3>Gender: <c:out value="${oneJob.company}"></c:out></h3>
    	<h3>Origin: <c:out value="${oneJob.location}"></c:out></h3>
    	<br />
    	<h4>Meaning: <c:out value="${oneJob.type}"></c:out></h4>
    	<h4>Meaning: <c:out value="${oneJob.status}"></c:out></h4>
    	<br />
    	<section>
		<div>
			<c:if test="${ theUser.id == user_id }">
				 | 
				<a href="/job/${oneJob.id}/edit">Edit</a> | 
				<a href="/delete/${oneJob.id}">Delete</a>
			</c:if>
 		</div>
    	</section>
    </main>
    <footer>
    
    </footer>
</body>
</html>