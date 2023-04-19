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

<link href="/css/dashboard.css" rel="stylesheet">
<link rel="stylesheet"
    href="https://code.highcharts.com/css/highcharts.css" />
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
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
	</div>
	
	<nav id="sidebarMenu" class="collapse d-lg-block sidebar collapse bg-white">
    <div class="position-sticky">
      <div class="list-group list-group-flush mx-3 mt-4">
        <a href="/#" class="list-group-item list-group-item-action py-2 ripple active">
          <i class="fas fa-chart-area fa-fw me-3"></i><span>Navigation</span>
        </a>
        <a href="/addJob" class="list-group-item list-group-item-action py-2 ripple"><i
            class="fas fa-lock fa-fw me-3"></i><span>Add Job</span></a>
        <a href="/view/${theUser.id}/edit" class="list-group-item list-group-item-action py-2 ripple"><i
            class="fas fa-chart-line fa-fw me-3"></i><span>Update Account Info</span></a>
        <a href="/allJobs" class="list-group-item list-group-item-action py-2 ripple">
          <i class="fas fa-chart-pie fa-fw me-3"></i><span>View All Jobs</span>
        </a>
      </div>
    </div>
  </nav>
	
	
	<div align="center">
        <h2>Job Stats</h2>
    </div>
    <figure class="highcharts-figure">
        <div id="container-bar"></div>
    </figure>
    <script type="text/javascript">
        $(document).ready(
                function() {
                    $.ajax({
                        url : "/get-data",
                        success : function(result) {
                            var yearDtls = [];
                            var countDtls = [];
                            console.log(result);
                            Object.keys(result).forEach(
                                    function(key) {
                                        yearDtls.push(key);
                                        countDtls.push(result[key]);
                                    });
                            drawChart(yearDtls, countDtls);
                        }
                    });
                });
        function drawChart(year, viewCounts) {
            Highcharts.chart('container-bar', {
                chart : {
                    type : 'column',
                    styledMode : true
                },
                title : {
                    text : 'Job Status Count'
                },
                xAxis : [ {
                    title : {
                        text : 'Status'
                    },
                    categories : year
                } ],
                yAxis : [ {
                    className : 'highcharts-color-0',
                    title : {
                        text : 'Stat Count'
                    }
                } ],
                series : [ {
                    data : viewCounts
                } ]
            });
        }
    </script>	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>