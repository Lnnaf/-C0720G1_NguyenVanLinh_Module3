package Service.employeeService;
import dao.employeeDAO.EmployeeDAO;
import dao.employeeDAO.IEmployeeDAO;
import models.Employee;
import models.other.Division;
import models.other.Education;
import models.other.Position;

import java.util.List;

public class EmployeeImp implements IEmployee {
   private IEmployeeDAO employees = new EmployeeDAO();
    @Override
    public List<Employee> showAllEmployee() {
        return employees.showAllEmployee();
    }

    @Override
    public List<Position> position() {
        return employees.position();
    }

    @Override
    public List<Education> education() {
        return employees.education();
    }

    @Override
    public List<Division> division() {
        return employees.division();
    }

    @Override
    public boolean insertEmployee(Employee employee) {
        return employees.insertEmployee(employee);
    }

    @Override
    public boolean updateEmployee(Employee employee) {
        return employees.updateEmployee(employee);
    }

    @Override
    public boolean deleteEmployee(int id) {
return employees.deleteEmployee(id);
    }
}
