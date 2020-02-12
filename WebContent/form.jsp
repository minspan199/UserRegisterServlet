<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register your info</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript" src="js.js"></script>
<link rel="stylesheet"
	href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css"
	integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX"
	crossorigin="anonymous">
<script
	src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js"
	integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9"
	crossorigin="anonymous"></script>
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/55f9e694ff.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<%
			String success = "";
			String error = "";
			if (request.getAttribute("success") != null) {
				success = request.getAttribute("success").toString();
			}
			if (request.getAttribute("error") != null) {
				error = request.getAttribute("error").toString();
			}
		%>

		<c:if test="${not empty success}">
			<div class="alert alert-success alert-dismissible fade show my-5" role="alert">
				<a class="close" data-dismiss="alert"><i
					class="fas fa-window-close"></i></a>
				<h4 class="alert-heading">
					<i class="far fa-thumbs-up"></i> <span class="badge badge-success">Success</span>
				</h4>
				<hr>
				${success}
			</div>
		</c:if>

		<br>
		<c:if test="${not empty error}">
			<div class="alert alert-warning alert-dismissible fade show my-5"
				role="alert">
				<a class="close" data-dismiss="alert"><i
					class="fas fa-window-close"></i></a>
				<h4 class="alert-heading">
					<i class="fas fa-exclamation-triangle"></i> <span
						class="badge badge-warning">Failure</span>
				</h4>
				<hr>
				${error}
			</div>
		</c:if>
	</div>

	<div class="container">
		<div class="row col-lg-10 col-xl-9 mx-auto">
			<div class="card card-signin flex-row my-5">
				<div class="card-img-left d-none d-md-flex">
					<!-- Background image for card set in CSS! -->
				</div>
				<div class="card-body">
					<h2 class="card-title text-center py-5">New User</h2>
					<%
						String Action = "/UserRegisterService/register";
						String urlActionAEncoded = response.encodeURL(Action);
					%>
					<form class="form-signin" action="<%=urlActionAEncoded%>"
						method="post" role="form" data-toggle="validator">
						<c:if test="${empty action}">
							<c:set var="action" value="add" />
						</c:if>
						<input type="hidden" name="CSRF_NONCE"
							value="<%=response.encodeUrl(null)%>"> <input
							type="hidden" id="action" name="action" value="${action}" /> <input
							type="hidden" id="idEmployee" name="idEmployee"
							value="${user.id}" />
						<%-- <h2>New User</h2> --%>
						<div
							class="form-group col-xs-12 col-md-9 mx-auto form-label-group">
							<div class="form-row">
								<div class="col-6">
									<label for="name" class="control-label col-xs-4">First
										name:</label> <input type="text" name="name" id="name"
										class="form-control" value="${user.name}" required="true" />
								</div>
								<div class="col-6">
									<label for="lastName" class="control-label col-xs-4">Last
										name:</label> <input type="text" name="lastName" id="lastName"
										class="form-control" value="${user.lastName}" required="true" />
								</div>
							</div>

							<label for="birthdate" class="control-label col-xs-4">Birth
								date</label> <input type="text" pattern="^\d{2}-\d{2}-\d{4}$"
								name="birthDate" id="birthdate" class="form-control"
								value="${user.birthDate}" maxlength="10" placeholder="MM-dd-yyy"
								required="true"></input> <label for="role"
								class="control-label col-xs-4">Role:</label> <input type="text"
								name="role" id="role" class="form-control" value="${user.role}"
								required="true" /> <label for="department"
								class="control-label col-xs-4">Department:</label> <input
								type="text" name="department" id="department"
								class="form-control" value="${user.department}" required="true" />

							<label for="department" class="control-label col-xs-4">E-mail:</label>

							<input type="text" name="email" id="email" class="form-control"
								value="${user.email}" placeholder="smith@aol.com"
								required="true" /> <br>
							<button type="submit" class="btn btn-outline-warning px-5 py-1">submit</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
