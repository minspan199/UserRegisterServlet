<%@page import="java.util.List"%>
<%@page import="registerServlet.dao.DaoImpl"%>
<%@page import="registerServlet.dao.Dao"%>
<%@page import="registerServlet.model.Person"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register your info</title>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<!-- end of bootstrap -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

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


<script language="javascript"></script>
</head>
<body>
	<jsp:include page="/header.jsp"></jsp:include>
	<div class="container">
		<%
			String success = "";
			String error = "";
			String exception = "";
			if (request.getAttribute("success") != null) {
				success = request.getAttribute("success").toString();
			}
			if (request.getAttribute("error") != null) {
				error = request.getAttribute("error").toString();
			}
			if (request.getAttribute("sql-exception") != null) {
				exception = request.getAttribute("sql-exception").toString();
			}
			System.out.println("success:" + success);
			System.out.println("error:" + error);
			System.out.println("sql-exception:" + exception);
		%>

		<c:if test="${not empty success}">
			<div class="alert alert-success alert-dismissible fade show my-5"
				role="alert">
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
				${error} ${exception}
			</div>
		</c:if>
	</div>

	<jsp:include page="/form.jsp"></jsp:include>
	<hr>

	<!-- 	<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/test" user="root" password="pass123" /> -->
	<jsp:include page="/list.jsp"></jsp:include>


	<div class="col-xl-8 col-xs-12">
		<jsp:include page="/footer.jsp"></jsp:include>
	</div>



</body>
</html>
