package registerServlet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import registerServlet.JdbcUtils;
import registerServlet.model.Person;

/**
 * This DAO class provides CRUD database operations for the table
 * students_tomcat in the database.
 * 
 * @author Michael
 *
 */

public class DaoImpl implements Dao {

//	private static final String INSERT_PERSON_SQL = "INSERT INTO students_tomcat"
//			+ "  (title, username, description, target_date,  is_done) VALUES " + " (?, ?, ?, ?, ?);";
//	private static final String INSERT_PERSON_SQL = "INSERT INTO students_tomcat (userFirstName, userLastName, birthDate, role, department, email) "
//			+ "VALUES('" + userFirstName + "','" + userLastName + "','" + birthDate + "','" + role + "','" + department
//			+ "','" + email + "') " + "ON DUPLICATE KEY UPDATE email='" + email + "'";
	private static final String INSERT_PERSON_SQL = "INSERT INTO students_tomcat (userFirstName, userLastName, birthDate, role, department, email) "
			+ "VALUES (?, ?, ?, ?, ?, ?) " + "ON DUPLICATE KEY UPDATE email = ?";
	private static final String SELECT_PERSON_BY_EMAIL = "select userFirstName, userLastName, birthDate, role, department, email from students_tomcat where email =?";
	private static final String SELECT_ALL_PERSONS = "select * from students_tomcat order by userFirstName ASC";
	private static final String DELETE_PERSON_BY_EMAIL = "delete from students_tomcat where email = ?;";
	private static final String UPDATE_PERSON = "update students_tomcat set title = ?, username= ?, description =?, target_date =?, is_done = ? where id = ?;";

	public DaoImpl() {
	}

	@Override
	public void insertPerson(Person person) throws SQLException {
		// TODO Auto-generated method stub
		// try-with-resource statement will auto close the connection.

		Connection connection = JdbcUtils.getConnection();
		if (connection != null) {
			PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PERSON_SQL);
			preparedStatement.setString(1, person.getUserFirstName());
			preparedStatement.setString(2, person.getUserLastName());
			preparedStatement.setString(3, person.getBirthDate());
			preparedStatement.setString(4, person.getRole());
			preparedStatement.setString(5, person.getDepartment());
			preparedStatement.setString(6, person.getEmail());
			preparedStatement.setString(7, person.getEmail());
			System.out.print(preparedStatement.toString());
			preparedStatement.execute();
		} else {
			throw new SQLException("Cannot connect to Database.");
		}
	}

	@Override
	public Person selectPerson(String email) throws SQLException {
		// TODO Auto-generated method stub
		Person person = null;
		// Step 1: Establishing a Connection
		try (Connection connection = JdbcUtils.getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PERSON_BY_EMAIL);) {
			preparedStatement.setString(1, email);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String userFirstName = rs.getString("userFirstName");
				String userLastName = rs.getString("userLastName");
				String birthDate = rs.getString("birthDate");
				String role = rs.getString("role");
				String department = rs.getString("department");
				person = new Person(userFirstName, userLastName, birthDate, role, department, email);
			}
		}
		return person;
	}

	@Override
	public List<Person> selectAllPersons() {
		// TODO Auto-generated method stub
		// using try-with-resources to avoid closing resources (boiler plate code)
		List<Person> persons = new ArrayList<>();

		// Step 1: Establishing a Connection
		try (Connection connection = JdbcUtils.getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PERSONS);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String userFirstName = rs.getString("userFirstName");
				String userLastName = rs.getString("userLastName");
				String birthDate = rs.getString("birthDate");
				String role = rs.getString("role");
				String department = rs.getString("department");
				String email = rs.getString("email");
				persons.add(new Person(userFirstName, userLastName, birthDate, role, department, email));
			}
		} catch (SQLException exception) {
			JdbcUtils.printSQLException(exception);
		}
		return persons;
	}

	@Override
	public boolean deletePerson(String email) throws SQLException {
		// TODO Auto-generated method stub
		boolean rowDeleted;
		try (Connection connection = JdbcUtils.getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_PERSON_BY_EMAIL);) {
			statement.setString(1, email);
			rowDeleted = statement.executeUpdate() > 0;
			System.out.println(rowDeleted + ": " + statement);
		}
		return rowDeleted;
	}

	@Override
	public boolean updatePerson(Person person) throws SQLException {
		// TODO Auto-generated method stub
		boolean rowUpdated;
		try (Connection connection = JdbcUtils.getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_PERSON);) {
			statement.setString(1, person.getUserFirstName());
			statement.setString(2, person.getUserLastName());
			statement.setString(3, person.getBirthDate());
			statement.setString(4, person.getRole());
			statement.setString(5, person.getDepartment());
			statement.setString(6, person.getEmail());
			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

	@Override
	public void init() throws SQLException {
		// TODO Auto-generated method stub
		Connection connection = JdbcUtils.getConnection();
		if (connection != null) {
			Statement statement = connection.createStatement();
			String createTable = "CREATE TABLE IF NOT EXISTS `students_tomcat` "
					+ "( `id` int(11) NOT NULL auto_increment, " + "`userFirstName` varchar(250) NOT NULL default '', "
					+ "`userLastName` varchar(250)  NOT NULL default '', " + "`birthDate`  DATETIME NOT NULL, "
					+ "`role` varchar(50)  NULL, " + "`department`  varchar(100) NOT NULL default '', "
					+ "`email` varchar(50) NOT NULL unique default '', " + "PRIMARY KEY  (`id`) );";
			statement.execute(createTable);
			connection.close();
		} else {
			throw new SQLException("Cannot connect to Database.");
		}
	}
}
