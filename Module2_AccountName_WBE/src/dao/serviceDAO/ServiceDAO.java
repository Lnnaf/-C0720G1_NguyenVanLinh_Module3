package dao.serviceDAO;

import dao.serviceDAO.IServiceDAO;
import models.Service;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ServiceDAO implements IServiceDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/furama_resort?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "password";
    private static final String SELECT_ALL_SERVICE = "select * from service_info_view order by service_info_view.service_id;";
    private static final String SELECT_ALL_SERVICE_ID = "select service_id from service;";
    private static final String INSERT_NEW_SERVICE = "insert into service values (?,?,?,?,?,?,?,?,?,?,?,?)";

    public ServiceDAO() {
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
    public List<Service> showAllService() {
        List<Service> services = new ArrayList<>();
        try (Connection connection = getConnection();

             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SERVICE)) {
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String service_id = rs.getString("service_id");
                String service_name = rs.getString("service_name");
                double service_area = rs.getDouble("service_area");
                int service_cost = rs.getInt("service_cost");
                int service_max_people = rs.getInt("service_max_people");
                String service_type_name = rs.getString("service_type_name");
                String rent_type_name = rs.getString("rent_type_name");
                int rent_type_cost = rs.getInt("rent_type_cost");
                String standard_room = rs.getString("standard_room");
                String description_other_convenience = rs.getString("description_other_convenience");
                double service_pool_area = rs.getDouble("service_pool_area");
                int number_of_floors = rs.getInt("number_of_floors");
                String service_status = rs.getString("service_status");
                services.add(new Service(service_id, service_name, service_area, service_cost, service_max_people, service_type_name,
                        rent_type_name, rent_type_cost, standard_room, description_other_convenience, service_pool_area, number_of_floors, service_status));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return services;
    }

    @Override
    public void insertNewService(Service service) {
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_NEW_SERVICE)) {
            preparedStatement.setString(1, service.getServiceId());
            preparedStatement.setString(2, service.getName());
            preparedStatement.setDouble(3, service.getServiceArea());
            preparedStatement.setInt(4, service.getServiceCost());
            preparedStatement.setInt(5, service.getServiceMaxPeople());
            preparedStatement.setInt(6, service.getRentTypeId());
            preparedStatement.setInt(7, service.getServiceTypeId());
            preparedStatement.setString(8, service.getStandardRoom());
            preparedStatement.setString(9, service.getDescription());
            preparedStatement.setDouble(10, service.getPoolArea());
            preparedStatement.setInt(11, service.getNumOfFloor());
            preparedStatement.setString(12, service.getStatus());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public List<String> selectAllServiceID() {
        List<String> listServiceID = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SERVICE_ID)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String service_id = rs.getString("service_id");

                listServiceID.add(service_id);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return listServiceID;
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
