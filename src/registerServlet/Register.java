package registerServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class register2db
 */
@WebServlet("/UserRegisterService/register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public Register() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.getWriter().println("<br>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		response.setContentType("text/html");
		PrintWriter printWriter = response.getWriter();
		String userFirstName = request.getParameter("name");
		String userLastName = request.getParameter("lastName");
		String birthDate = request.getParameter("birthDate");
		String role = request.getParameter("role");
		String department = request.getParameter("department");
		String email = request.getParameter("email");

		SimpleDateFormat dateFormat = new SimpleDateFormat("MM-dd-yyyy");
		Date d;
		try {
			d = dateFormat.parse(birthDate);
			dateFormat.applyPattern("yyyy-MM-dd");
			birthDate = dateFormat.format(d);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		boolean success = false;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String jdbcUrl = "jdbc:mysql://localhost:3306/students";
			String userName = "root";
			String password = "@p232324P";
			Connection connection = DriverManager.getConnection(jdbcUrl, userName, password);
			Statement statement = connection.createStatement();
			String createTable = "CREATE TABLE IF NOT EXISTS `students_tomcat` "
					+ "( `id` int(11) NOT NULL auto_increment, " + "`userFirstName` varchar(250) NOT NULL default '', "
					+ "`userLastName` varchar(250)  NOT NULL default '', " + "`birthDate`  DATETIME NOT NULL, "
					+ "`role` varchar(50)  NULL, " + "`department`  varchar(100) NOT NULL default '', "
					+ "`email` varchar(50) NOT NULL unique default '', " + "PRIMARY KEY  (`id`) );";
			statement.execute(createTable);
			String insertEntry = "INSERT INTO students_tomcat (userFirstName, userLastName, birthDate, role, department, email) "
					+ "VALUES('" + userFirstName + "','" + userLastName + "','" + birthDate + "','" + role + "','"
					+ department + "','" + email + "') " + "ON DUPLICATE KEY UPDATE email='" + email + "'";
//			printWriter.println("sql syntax:   "+insertEntry);
			statement.execute(insertEntry);
			success = true;
		} catch (SQLException e) {
			// TODO: handle exception
			request.setAttribute("error", "sql exception: " + e.getMessage());
		} catch (ClassNotFoundException e) {
			// TODO: handle exception
			request.setAttribute("error", "class not found: " + e.getMessage());
		} finally {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/form.jsp");
			if (success) {
				request.setAttribute("success", userFirstName + " " + userLastName + " added");
			} else {
				request.setAttribute("success", userFirstName + " " + userLastName + " not added");
			}
			dispatcher.include(request, response);
		}
	}

}
