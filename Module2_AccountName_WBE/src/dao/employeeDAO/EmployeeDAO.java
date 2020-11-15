package dao.employeeDAO;

import models.Employee;
import models.other.Division;
import models.other.Education;
import models.other.Position;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO implements IEmployeeDAO {
    public static final String SELECT_FROM_EDUCATION_DEGREE = "select * from  education_degree";
    public static final String SELECT_FROM_DIVISION = "select * from division";
    public static final String INSERT_INTO_EMPLOYEE_ = "insert into employee (employee_name,employee_birthday,employee_id_card,employee_salary,employee_phone,employee_email,employee_address,positions_id,education_degree_id,division_id,username)" +
            "values (?,?,?,?,?,?,?,?,?,?,?)";
    private static final String UPDATE_EMPLOYEE = "update  employee set employee_name=?, employee_birthday=?, employee_id_card=?, employee_salary=?, employee_phone=?," +
            " employee_email=?, employee_address=?, positions_id=?, education_degree_id=?, division_id=? where employee_id= ?;";
    public static final String DELETE_EMPLOYEE = "delete from  employee where employee_id=?";
    private String jdbcURL = "jdbc:mysql://localhost:3306/furama_resort?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "password";
    private static final String SELECT_ALL_EMPLOYEE= "SELECT * FROM furama_resort.employee_info_view";
    private static final String SELECT_POSITIONS= "SELECT * FROM furama_resort.positions";

    public EmployeeDAO() {
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
    public List<Employee> showAllEmployee() {
        List<Employee> employees = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EMPLOYEE)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
               String employee_id = rs.getString("employee_id");
               String employee_name = rs.getString("employee_name");
               String employee_birthday = rs.getString("employee_birthday");
               String employee_id_card = rs.getString("employee_id_card");
               int employee_salary = rs.getInt("employee_salary");
               String employee_phone = rs.getString("employee_phone");
               String employee_email = rs.getString("employee_email");
               String employee_address = rs.getString("employee_address");
               String positions_name = rs.getString("positions_name");
               String education_degree_name = rs.getString("education_degree_name");
               String division_name = rs.getString("division_name");
               String username = rs.getString("username");
                employees.add(new Employee(employee_id, employee_name, employee_birthday, employee_id_card,
                        employee_salary,employee_phone, employee_email,
                        employee_address, positions_name, education_degree_name, division_name, username));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return employees;
    }

    @Override
    public List<Position> position() {
        List<Position> position = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_POSITIONS)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int position_id = rs.getInt("positions_id");
                String position_name = rs.getString("positions_name");
                position.add(new Position(position_id,position_name));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return position;
    }

    @Override
    public List<Education> education() {
        List<Education> education = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FROM_EDUCATION_DEGREE)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int education_id = rs.getInt("education_degree_id");
                String education_name = rs.getString("education_degree_name");
                education.add(new Education(education_id,education_name));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return education;
    }

    @Override
    public List<Division> division() {
        List<Division> division = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FROM_DIVISION)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int division_id = rs.getInt("division_id");
                String division_name = rs.getString("division_name");
                division.add(new Division(division_id,division_name));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return division;
    }

    @Override
    public boolean insertEmployee(Employee employee) {
        boolean rowInsert = false;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_EMPLOYEE_)) {
            preparedStatement.setString(1, employee.getName());
            preparedStatement.setString(2, employee.getBirthday());
            preparedStatement.setString(3, employee.getIdCard());
            preparedStatement.setInt(4, employee.getSalary());
            preparedStatement.setString(5, employee.getPhone());
            preparedStatement.setString(6, employee.getEmail());
            preparedStatement.setString(7, employee.getAddress());
            preparedStatement.setInt(8,employee.getPositionId() );
            preparedStatement.setInt(9, employee.getEducationId());
            preparedStatement.setInt(10, employee.getDivisionId());
            preparedStatement.setString(11, employee.getUsername());
            rowInsert = preparedStatement.executeUpdate()>0;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return rowInsert;
    }

    @Override
    public boolean updateEmployee(Employee employee) {
        boolean rowInsert = false;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_EMPLOYEE)) {
            preparedStatement.setString(1, employee.getName());
            preparedStatement.setString(2, employee.getBirthday());
            preparedStatement.setString(3, employee.getIdCard());
            preparedStatement.setInt(4, employee.getSalary());
            preparedStatement.setString(5, employee.getPhone());
            preparedStatement.setString(6, employee.getEmail());
            preparedStatement.setString(7, employee.getAddress());
            preparedStatement.setInt(8,employee.getPositionId() );
            preparedStatement.setInt(9, employee.getEducationId());
            preparedStatement.setInt(10, employee.getDivisionId());
            preparedStatement.setInt(11,Integer.parseInt(employee.getId()));
            System.out.println(preparedStatement);
            rowInsert = preparedStatement.executeUpdate()>0;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return rowInsert;
    }


    @Override
    public boolean deleteEmployee(int id) {
        boolean rowInsert = false;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(DELETE_EMPLOYEE)) {
            preparedStatement.setInt(1,id);
            rowInsert = preparedStatement.executeUpdate()>0;
            System.out.println(preparedStatement);
            System.out.println(rowInsert);
        } catch (SQLException e) {
            printSQLException(e);
        }
        return rowInsert;
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
