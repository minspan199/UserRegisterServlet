package registerServlet.model;

public class Person {
	String userFirstName;
	String userLastName;
	String birthDate;
	String role;
	String department;
	String email;

	public Person(String userFirstName, String userLastName, String birthDate, String role, String department,
			String email) {
		super();
		this.userFirstName = userFirstName;
		this.userLastName = userLastName;
		this.birthDate = birthDate;
		this.role = role;
		this.department = department;
		this.email = email;
	}

	public String getUserFirstName() {
		return userFirstName;
	}

	public void setUserFirstName(String userFirstName) {
		this.userFirstName = userFirstName;
	}

	public String getUserLastName() {
		return userLastName;
	}

	public void setUserLastName(String userLastName) {
		this.userLastName = userLastName;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
