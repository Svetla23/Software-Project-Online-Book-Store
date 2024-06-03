package customer.dao;

import java.sql.*;

import customer.bean.Customer;

public class CustomerDao {

    public int registerCustomer(Customer customer) throws ClassNotFoundException {
   
        String INSERT_USERS_SQL = "INSERT INTO users(firstname,lastname,username,password,address,mobilenum) values(?,?,?,?,?,?)";

        int result = 0;
   
        try {
        	Class.forName("oracle.jdbc.driver.OracleDriver");
        	Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","bookstoreapp","admin123");
      
            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL);
            preparedStatement.setString(1, customer.getFirstName());
            preparedStatement.setString(2, customer.getLastName());
            preparedStatement.setString(3, customer.getUsername());
            preparedStatement.setString(4, customer.getPassword());
            preparedStatement.setString(5, customer.getAddress());
            preparedStatement.setInt(6, customer.getMobilenum());

           // System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            result = preparedStatement.executeUpdate();
            preparedStatement.close();
            connection.close();

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        catch(Exception e) {
        	e.printStackTrace();
        }
        return result;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}