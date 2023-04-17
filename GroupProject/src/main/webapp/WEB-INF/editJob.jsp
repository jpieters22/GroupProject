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
<title>Update Job</title>
</head>
<body>
	<header>
		<h1>Update Job</h1>
	</header>
	<main>
		<form:form action="/jobs/${job.id}" method="post" modelAttribute="job">
		<input type="hidden" name="_method" value="put">
            <section>
                <label for="position">Position</label>
                <input type="text" name="position" id="" value="${job.position}">
                <form:errors path="position" class="text-danger"/>
            </section>
            <section>
                <label for="company">Company</label>
                <input type="text" name="company" id="" value="${job.company}">
                <form:errors path="company" class="text-danger"/>
            </section>
            <section>
                <label for="location">Location</label>
                <input type="text" name="location" id="" value="${job.location}">
                <form:errors path="location" class="text-danger"/>
            </section>
            <section>
            <select name="status" id="">
            	<option value="pending">Pending</option>
                <option value="interview">Interview</option>
                <option value="declined">Declined</option>
            </select>
            <form:errors path="status" class="text-danger"/>
            </section>
            <section>
            <select name="type" id="">
            	<option value="fulltime">Full Time</option>
                <option value="contract">Contract</option>
                <option value="partime">Part-Time</option>
            </select>
            <form:errors path="type" class="text-danger"/>
            </section>
            <section>
                <label for="note">Add a note for yourself!</label>
                <textarea name="note" rows="10" cols="30" ></textarea>
                <form:errors path="note" class="text-danger"/>
            </section>
            <section>
                <input type="hidden" name="owner" value="${ user_id }" />
            </section>
            <button>Update</button>
        </form:form>
	</main>
</body>
</html>