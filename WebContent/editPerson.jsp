<%@page import="registerServlet.dao.DaoImpl"%>
<%@page import="registerServlet.dao.Dao"%>
<%@page import="registerServlet.model.Person"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%
	String email = request.getParameter("email");
	Dao dao = new DaoImpl();
	Person person = dao.selectPerson(email);
	if (person == null) {
		person.setUserFirstName("UNKOWN");
	}
%>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="style.css" />
<title>Update info for <%=person.getUserFirstName()%></title>
</head>
<body>
	<h2>
		Registered form for
		<%=person.getUserFirstName()%></h2>
	<jsp:include page="/form.jsp"></jsp:include>
</body>
</html>