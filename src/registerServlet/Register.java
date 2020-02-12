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

import registerServlet.dao.Dao;
import registerServlet.dao.DaoImpl;
import registerServlet.model.Person;

/**
 * Servlet implementation class register2db
 */
@WebServlet("/UserRegisterService/register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Dao userDao;

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
		
		Person person = new Person(userFirstName, userLastName, birthDate, role, department, email);
		boolean success = false;
		try {
			userDao.init();
			userDao.insertPerson(person);
			success = true;
		} catch (SQLException e) {
			// TODO: handle exception
			request.setAttribute("error", "sql exception: " + e.getMessage());
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
