package Service.employeeService;

import models.Employee;
import models.other.Division;
import models.other.Education;
import models.other.Position;

import java.util.List;

public interface IEmployee {
    public List<Employee> showAllEmployee();
    public List<Position>position();
    public List<Education>education();
    public List<Division>division();
    public boolean insertEmployee(Employee employee);
    public boolean updateEmployee(Employee employee);
    public boolean deleteEmployee(int id);
}
