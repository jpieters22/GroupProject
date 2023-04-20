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
								<!-- Bootstrap CSS -->
								<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
								<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
									rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
									crossorigin="anonymous">

								<!-- My CSS -->
								<link href="/css/styles.css" rel="stylesheet">
								<!-- <link href="/css/form.css" rel="stylesheet"> -->
								<link href="/css/login.css" rel="stylesheet">
								<link href="/css/reg.css" rel="stylesheet">
								<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">
								<meta charset="UTF-8">
								<title>Register</title>
							</head>

							<body>
								<!--+--------------------------------CONTAINER--------------------------------->
								<div class="container-card">
									<!--*--------------------CARD 1/2--------------------->

									<div class="container1">
										<form:form action="/register" method="post" modelAttribute="newUser">
											<h1 class="text-center">Register</h1>

											<!--!--------------FIRST---------------->
											<section class="d-flex justify-content-between align-items-center">
												<!-- <label class="form-label col-6" for="firstName">First Name:</label> -->
												<input type="text" name="firstName" class="form-control" placeholder="First Name">
											</section>
											<form:errors path="firstName" class="text-danger fw-semibold" />

											<!--!--------------LAST---------------->
											<section class="mt-2 d-flex justify-content-between align-items-center">
												<!-- <label class="form-label col-6" for="lastName">Last Name:</label> -->
												<input type="text" name="lastName" class="form-control" placeholder="Last Name">
											</section>
											<form:errors path="lastName" class="text-danger fw-semibold" />

											<!--!--------------EMAIL---------------->
											<section class="mt-2 d-flex justify-content-between align-items-center">
												<!-- <label class="form-label col-6" for="email">Email:</label> -->
												<input type="text" name="email" class="form-control" placeholder="Email">
											</section>
											<form:errors path="email" class="text-danger fw-semibold" />

											<!--!--------------PASSWORD---------------->
											<section class="mt-2 d-flex justify-content-between align-items-center">
												<!-- <label class="form-label col-6" for="password">Password:</label> -->
												<input type="password" name="password" class="form-control" placeholder="Password">
											</section>
											<form:errors path="password" class="text-danger fw-semibold" />

											<!--!--------------CONFIRM---------------->
											<section class="mt-2 d-flex justify-content-between align-items-center">
												<!-- <label class="form-label col-6" for="confirmPassword">Confirm
													Password:</label> -->
												<input type="password" name="confirmPassword" class="form-control"
													placeholder="Confirm Password">
											</section>
											<form:errors path="confirmPassword" class="text-danger fw-semibold" />

											<!--!--------------BUTTON---------------->
											<section class="button-sec">
												<button class="btn">Register</button>
											</section>

										</form:form>

									</div>
									<!--*--------------------CARD 2/2--------------------->
									<div class="container2">
										<h1>
											Welcome!
										</h1>
										<h3>Have an Account?</h3>
										<a class="link" href="/">Login</a>
									</div>

								</div>


							</body>

							</html>