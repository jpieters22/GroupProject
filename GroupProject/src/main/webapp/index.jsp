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

								<!-- My CSS -->
								<link rel="stylesheet" type="text/css" href="/css/styles.css">
								<link rel="stylesheet" type="text/css" href="/css/logreg.css">
								<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">
								<meta charset="UTF-8">
								<title>App Tracker</title>
							</head>

							<!--*---------------FULL BODY----------------->

							<body>
								<!--*---------------LOGO/NAME----------------->
								<header>
									<h1>App Tracker</h1>
								</header>

								<div class="container px-4 py-5 px-md-5 text-center text-lg-start my-5">
									<div class="row gx-lg-5 align-items-center mb-5">

										<!--*---------------lEFT SIDE CARD----------------->
										<div class="col-lg-6 mb-5 mb-lg-0" style="z-index: 10">
											<h1 class="my-5 display-5 fw-bold ls-tight">Hello!</h1>
											<p class="mb-4 opacity-70">
												Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis fuga ullam veritatis
												recusandae ab
												inventore illo repellendus et ipsam magni. Beatae perferendis aliquid eaque, consectetur
												aspernatur
												unde est porro asperiores.
											</p>
										</div>

										<!--*---------------LOGIN FORM CARD----------------->
										<div class="card bg-glass">
											<div class="card-body px-4 py-5 px-md-5">

												<h2>Login</h2>
												<form:form action="/login" method="post" modelAttribute="newLogin">

													<!--+---------Email input----------->
													<p>
														<form:label path="email">Email:</form:label>
														<form:errors path="email" />
														<form:input path="email" />
													</p>
													<!--+---------Password input----------->
													<p>
														<form:label path="password">Password:</form:label>
														<form:errors path="password" />
														<form:input type="password" path="password" min="0" />
													</p>
													<button>Submit</button>
												</form:form>
												<div class="page">
													<h3>Register here!</h3>
													<a class="link" href="/register">Register</a>
												</div>

											</div>
										</div>
									</div>
								</div>
							</body>

							</html>