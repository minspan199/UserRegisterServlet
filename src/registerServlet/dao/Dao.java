package registerServlet.dao;
import java.sql.SQLException;
import java.util.List;

import registerServlet.model.Person;


public interface Dao {

 void insertPerson(Person person) throws SQLException;

 Person selectPerson(String email) throws SQLException;

 List<Person> selectAllPersons();
 
 void init() throws SQLException;

 boolean deletePerson(String email) throws SQLException;

 boolean updatePerson(Person person) throws SQLException;

}
