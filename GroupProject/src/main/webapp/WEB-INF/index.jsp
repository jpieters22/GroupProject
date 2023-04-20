<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!-- for forms -->
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
			<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
				<!-- for validation -->
				<%@ page isErrorPage="true" %>
					<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
						<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


							<!DOCTYPE html>
							<html>

							<head>
								<meta charset="UTF-8">
								<meta http-equiv="X-UA-Compatible" content="IE=edge">
								<meta name="viewport" content="width=device-width, initial-scale=1.0">
								<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
									rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
									crossorigin="anonymous">
								<!-- used for linking css stylesheet from resources/static/css -->
								<link href="/css/styles.css" rel="stylesheet">
								<link href="/css/form.css" rel="stylesheet">
								<link href="/css/login2.css" rel="stylesheet">
								<link href="/css/login.css" rel="stylesheet">
								<!-- <link href="/css/login.css" rel="stylesheet"> -->
								<!-- ==================================== -->
								<title>App Tracker</title>
							</head>

							<!-- PART OF BODY TAG: class="d-flex justify-content-center" -->

							<body>
								<!--+--------------------------------CONTAINER--------------------------------->
								<div class="container-card">

									<!--*--------------------CARD 1/2--------------------->
									<div class="container1">
										<h1>
											Hello!
										</h1>
										<h2>
											Welcome Back!
										</h2>
										<h3>New here?</h3>
										<a class="link" href="/register"> Register Now!</a>
									</div>

									<!--*------------------- CARD 2/2--------------------->
									<div class="container2">
										<form:form action="/login" method="post" modelAttribute="newLogin">
											<h1 class="text-center">Login</h1>

											<!--!--------------EMAIL---------------->
											<section class="d-flex justify-content-between align-items-center">
												<!-- <form:label class="form-label" path="email">Email:</form:label> -->
												<form:input placeholder="Email" class="form-control" path="email" />
											</section>
											<form:errors path="email" class="text-danger fw-semibold" />

											<!--!--------------PASSWORD---------------->
											<section class="mt-2 d-flex justify-content-between align-items-center">
												<!-- <form:label class="form-label" path="password">Password:</form:label> -->
												<form:input placeholder="Password" class="form-control" path="password" type="password" />
											</section>
											<form:errors path="password" class="text-danger fw-semibold" />

											<!--!--------------BUTTON---------------->
											<section class="button-sec">
												<button class="btn">Login</button>
											</section>
										</form:form>

									</div>
								</div>

							</body>

							</html>