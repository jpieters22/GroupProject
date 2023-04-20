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
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="com.google.gson.JsonObject" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.google.gson.JsonArray" %>

<!DOCTYPE html>
<html xmlns="https://www.thymeleafe.org">
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<meta charset="UTF-8">

<link href="/css/dashboard.css" rel="stylesheet">
<link rel="stylesheet"
    href="https://code.highcharts.com/css/highcharts.css" />
<title>App Dashboard</title>
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0/dist/chartjs-plugin-datalabels.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-primary text-light" data-bs-theme="dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Job Tracker</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/addJob">Add Job</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/view/${theUser.id}/edit">Update Account</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/allJobs">View All Jobs</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/logout">Logout</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
	
<div class="text-center">
<h1 class="display-4">Welcome ${theUser.firstName}!</h1>
</div>

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
    </div>
    
 	<div class="jobGraph" >
        <canvas id="myChart"></canvas>
    </div>
    
<c:set var="countP" scope="page" value="${countPending}" />
<c:set var="countD" scope="page" value="${countDeclined}" />
<c:set var="countI" scope="page" value="${countInterview}" />


<%
    List<String> labels = Arrays.asList("Pending", "Declined", "Interview");
    List<Integer> values = Arrays.asList(Integer.parseInt(pageContext.getAttribute("countP").toString()),
        Integer.parseInt(pageContext.getAttribute("countD").toString()),
        Integer.parseInt(pageContext.getAttribute("countI").toString()));

%>


<%
    JsonObject data = new JsonObject();
    data.addProperty("type", "bar");
    JsonObject dataObj = new JsonObject();
    dataObj.add("labels", new Gson().toJsonTree(labels));
    JsonArray datasets = new JsonArray();
    JsonObject datasetObj = new JsonObject();
    datasetObj.addProperty("label", "My Job Stats");
    datasetObj.add("data", new Gson().toJsonTree(values));
    datasets.add(datasetObj);
    dataObj.add("datasets", datasets);
    data.add("data", dataObj);
%>

    
 
   
<script>
    var ctx = document.getElementById('myChart').getContext('2d');
    var myChart = new Chart(ctx, <%= data %>);
</script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>