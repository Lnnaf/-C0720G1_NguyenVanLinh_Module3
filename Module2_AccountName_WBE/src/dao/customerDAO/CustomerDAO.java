package dao.customerDAO;

import models.Customer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO implements ICustomerDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/furama_resort?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "password";
    private static final String SELECT_ALL_CUSTOMER = "select * from customer_info_view order by customer_info_view.customer_id;";
    private static final String SELECT_ALL_CUSTOMER_ID = "select * from customer_id_view;";
    private static final String SELECT_ALL_CUSTOMER_ID_CARD = "select customer_id_card from customer;";
    private static final String SELECT_ALL_CUSTOMER_PHONE = "select customer_phone from customer;";
    private static final String INSERT_NEW_CUSTOMER = "insert into customer values (?,?,?,?,?,?,?,?,?)";
    private static final String SELECT_CUSTOMER = "select * from customer where customer_id = ?";
    private static final String UPDATE_CUSTOMER = "update customer set customer_type_id =?,customer_name= ?, customer_birthday=?," +
            " customer_gender=?, customer_id_card =?, customer_phone=?, customer_email=?, customer_address=? where customer_id = ?;";
    private static final String DELETE_CUSTOMER = "delete from customer where customer_id = ?";
    public CustomerDAO() {
    }
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = (Connection) DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }
    @Override
    public List<Customer> selectAllCustomer() {
        List<Customer>customers = new ArrayList<>();
        try (Connection connection = getConnection();

             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER)) {
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String customer_id = rs.getString("customer_id");
                String customer_name = rs.getString("customer_name");
                String customer_birthday = rs.getString("customer_birthday");
                String customer_gender = rs.getString("customer_gender");
                String customer_id_card = rs.getString("customer_id_card");
                String customer_phone = rs.getString("customer_phone");
                String customer_email = rs.getString("customer_email");
                String customer_address = rs.getString("customer_address");
                String customer_type_name = rs.getString("customer_type_name");
                customers.add(new Customer(customer_id, customer_name, customer_birthday,customer_gender,customer_id_card,customer_phone, customer_email, customer_address,customer_type_name));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return customers;
    }

    @Override
    public List<String> selectAllCustomerID() {
        List<String>customers = new ArrayList<>();
        try (Connection connection = getConnection();

             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER_ID)) {
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String customer_id = rs.getString("customer_id");

                customers.add(customer_id);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return customers;
    }

    @Override
    public List<String> selectAllCustomerIDCard() {
        List<String> listIDCard = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER_ID_CARD)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String customer_id_card = rs.getString("customer_id_card");

                listIDCard.add(customer_id_card);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return listIDCard;
    }

    @Override
    public List<String> selectAllCustomerPhone() {
        List<String> listPhone = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER_PHONE)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String customer_phone = rs.getString("customer_phone");

                listPhone.add(customer_phone);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return listPhone;
    }

    @Override
    public void insertCustomer(Customer customer) {
        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_NEW_CUSTOMER)) {
            preparedStatement.setString(1, customer.getId());
            preparedStatement.setInt(2, Integer.parseInt(customer.getCustomerType()));
            preparedStatement.setString(3, customer.getName());
            preparedStatement.setString(4, customer.getBirthday());
            preparedStatement.setString(5, customer.getGender());
            preparedStatement.setString(6, customer.getIdCard());
            preparedStatement.setString(7, customer.getPhone());
            preparedStatement.setString(8, customer.getEmail());
            preparedStatement.setString(9, customer.getAddress());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public Customer selectCustomer(String id) {
        Customer updCustomer=null;
        try (Connection connection = getConnection();

             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMER)) {
            // Step 3: Execute the query or update query
            preparedStatement.setString(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String customer_id = rs.getString("customer_id");
                String customer_type_name = rs.getString("customer_type_id");
                String customer_name = rs.getString("customer_name");
                String customer_birthday = rs.getString("customer_birthday");
                String customer_gender = rs.getString("customer_gender");
                String customer_id_card = rs.getString("customer_id_card");
                String customer_phone = rs.getString("customer_phone");
                String customer_email = rs.getString("customer_email");
                String customer_address = rs.getString("customer_address");

                updCustomer = new Customer(customer_id, customer_name, customer_birthday,customer_gender,customer_id_card,customer_phone, customer_email, customer_address,customer_type_name);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return updCustomer;
    }

    @Override
    public void updateCustomer(Customer customer) {
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CUSTOMER)) {
            preparedStatement.setInt(1, Integer.parseInt(customer.getCustomerType()));
            preparedStatement.setString(2, customer.getName());
            preparedStatement.setString(3, customer.getBirthday());
            preparedStatement.setString(4, customer.getGender());
            preparedStatement.setString(5, customer.getIdCard());
            preparedStatement.setString(6, customer.getPhone());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getAddress());
            preparedStatement.setString(9, customer.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public void deleteCustomer(String id) {
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CUSTOMER)) {
            preparedStatement.setString(1,id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
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
