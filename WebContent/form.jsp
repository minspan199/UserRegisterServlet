<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="style.css" />
<div class="container">
	<div class="row col-lg-10 col-xl-9 mx-auto">
		<div class="card card-signin flex-row my-5">
			<div class="card-img-left d-none d-md-flex">
				<!-- Background image for card set in CSS! -->
			</div>
			<div class="card-body">
				<h2 class="card-title text-center py-5">New User</h2>
				<%
					String Action = "/UserRegister/register";
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
						type="hidden" id="idEmployee" name="idEmployee" value="${user.id}" />
					<%-- <h2>New User</h2> --%>
					<div class="form-group col-xs-12 col-md-9 mx-auto form-label-group">
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
							value="${user.email}" placeholder="smith@aol.com" required="true" />
						<br>
						<button type="submit" class="btn btn-outline-warning px-5 py-1">submit</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>