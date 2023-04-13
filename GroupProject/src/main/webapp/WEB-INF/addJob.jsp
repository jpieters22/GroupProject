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
<title>Insert title here</title>
</head>
<body>
	<form:form action="/createJob" method="post" modelAttribute="jobForm">
            <section>
                <label for="position">Position</label>
                <input type="text" name="position" id="">
                <form:errors path="position" class="text-danger"/>
            </section>
            <section>
                <label for="company">Company</label>
                <input type="text" name="company" id="">
                <form:errors path="company" class="text-danger"/>
            </section>
            <section>
                <label for="location">Location</label>
                <input type="text" name="location" id="">
                <form:errors path="location" class="text-danger"/>
            </section>
        	<section>
        	  <select name="status" id="">
        	  	<option value=""></option>
    			<option value="pending">Pending</option>
    			<option value="interview">Interview</option>
    			<option value="declined">Declined</option>
    		</select>
    		<form:errors path="status" class="text-danger"/>
        	</section>
    		<section>
    			<select name="type" id="">
    			<option value=""></option>
    			<option value="fulltime">Full-Time</option>
    			<option value="contract">Contract</option>
    			<option value="partime">Part-Time</option>
    		</select>
    		<form:errors path="type" class="text-danger"/>
    		</section>
            <button>Save</button>
        </form:form>

</body>
</html>