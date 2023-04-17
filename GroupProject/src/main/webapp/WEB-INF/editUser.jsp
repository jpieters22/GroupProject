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
<!-- Bootstrap CSS -->
<!-- <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css"> -->
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<!-- My CSS -->
<link rel='stylesheet' href='/css/styles.css'>
<script type = "text/javascript" src='/js/scripts.js'></script>
<meta charset="UTF-8">
<title>Update Account</title>
</head>
<body>
<header>
		<h1>App Tracker</h1>
		<h1>Edit User</h1>
	</header>
	<main>
		<form:form action="/views/${theUser.id}" method="POST" modelAttribute="theUser">
		<input type="hidden" name="_method" value="put">
				<section>
					<form:label path="firstName">Update First Name</form:label>
					<form:input type="text" class="input" path="firstName" />
					<form:errors path="firstName" class="text-danger" />
				</section>
				<section>
					<form:label path="lastName">Update Last Name</form:label>
					<form:input type="text" class="input" path="lastName" />
					<form:errors path="lastName" class="text-danger" />
				</section>
				<section>
					<form:input type="hidden" path="email" class="text-danger" />
				</section>
				<section>
					<form:input type="hidden" path="password" class="text-danger" />
				</section>
				<section>
                	<input type="hidden" name="owner" value="${ user_id }" />
            	</section>
				<button class="btn btn-primary">Update</button>
			</form:form>
	</main>
</body>
</html>