<%@page import="registerServlet.model.Person"%>
<%@page import="registerServlet.dao.DaoImpl"%>
<%@page import="registerServlet.dao.Dao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript" src="js.js"></script>

<script src="http://malsup.github.com/jquery.form.js"></script>


<%
	Dao dao = new DaoImpl();
	List<Person> persons = dao.selectAllPersons();
	System.out.println(persons.size());
%>

<script type="text/javascript" src="js.js"></script>
<div class="mx-auto col-xl-6 col-xs-10">
	<div>
		<a class="btn btn-primary mx-auto" data-toggle="collapse"
			href="#registeredTable" role="button" aria-expanded="false"> Show
			Registered Persons </a>
	</div>

</div>

<div class="collapse" id="registeredTable">
	<div
		class="col-xl-8 col-xs-12 bg-light border border-dark mx-auto py-3">
		<div class="card card-body">
			<table id="dtBasicExample"
				class="table table-striped table-bordered table-sm" cellspacing="0"
				width="100%">
				<thead>
					<tr>
						<th class="th-sm">Name</th>
						<th class="th-sm">Role</th>
						<th class="th-sm">Department</th>
						<th class="th-sm">email</th>
						<th class="th-sm">Operations</th>
					</tr>
				</thead>
				<tbody>

					<%-- 						<c:forEach items="${persons}" var="person">
							<tr>
								<td><c:out
										value="${person.userFirstName} ${person.userLastName}" /></td>
								<td><c:out value="${person.role}" /></td>
								<td><c:out value="${person.department}" /></td>
								<td><c:out value="${person.email}" /></td>
							</tr>
						</c:forEach> --%>

					<%
						String Action = "/UserRegister/delete";
						String urlActionAEncoded = response.encodeURL(Action);
					%>
					<%
						for (int i = 0; i < persons.size(); i++) {
					%>
					<tr>
						<td><%=persons.get(i).getUserFirstName()%> <%=persons.get(i).getUserLastName()%></td>
						<td><%=persons.get(i).getRole()%></td>
						<td><%=persons.get(i).getDepartment()%></td>
						<td><%=persons.get(i).getEmail()%></td>
						<td>



							<form id="deleteEntry" action="<%=urlActionAEncoded%>"
								method="post">
								<input type="hidden" name="email"
									value="<%=persons.get(i).getEmail()%>"></input> <a
									class="badge badge-pill badge-warning"
									href="edit?email=<%=persons.get(i).getEmail()%>"><span
									class="p-1">Edit</span></a> &nbsp;&nbsp;&nbsp;
								<button type="submit" class="badge badge-pill badge-danger"
									onclick="deleteEntry('<%=persons.get(i).getUserFirstName()%>')">
									<span class="p-1">Delete</span>
								</button>
							</form>

						</td>
					</tr>
					<%
						}
					%>
					<%-- "${pageContext.request.contextPath}/delete?email=<%=persons.get(i).getEmail()%>" --%>
				</tbody>
				<tfoot>
					<tr>
						<th>Name</th>
						<th>Role</th>
						<th>Department</th>
						<th>email</th>
						<th class="th-sm">Operations</th>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</div>