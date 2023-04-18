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
	<form:form action="/job/${oneJob.id}" method="post" modelAttribute="oneJob">
		<input type="hidden" name="_method" value="put"/>
    		<p>
		        <form:label path="position">Position</form:label>
		        <form:input path="position" />
		        <form:errors path="position"/>
		    </p>
		    <p>
		        <form:label path="company">Company Name:</form:label>
		        <form:input path="company"/>
		        <form:errors path="company"/>
		    </p> 
		    <p>
		        <form:label path="location">Location:</form:label>
		        <form:input path="location"/>
		        <form:errors path="location"/>
		    </p> 
		    <p>
			<form:label path="type">Employment Type:</form:label>
		    <form:select path="type">
		       <form:option value="Full-Time" path="type">Full-Time</form:option>
		       <form:option value="Part-Time" path="type">Part-Time</form:option>
		       <form:option value="Contract" path="type">Contract</form:option>
		    </form:select>
    		<form:errors path="type" class="text-danger"/>
		    </p>
		    <p>
		    <form:label path="status">Application Status:</form:label>
		    <form:select path="status">
		       <form:option value="Pending" path="type">Pending</form:option>
		       <form:option value="Declined" path="type">Declined</form:option>
		       <form:option value="Interview" path="type">Interview</form:option>
		    </form:select>
    		<form:errors path="status" class="text-danger"/>
		    </p>   
  
    		<section>
    			 <form:label path="note">Update your note!</form:label>
		        <form:input path="note" class="textarea"/>
		        <form:errors path="note"/>
    		</section>
    		  <section>
                <input type="hidden" name="owner" value="${ user_id }">
            </section>
            <button>Update</button>
        </form:form>

</body>
</html>