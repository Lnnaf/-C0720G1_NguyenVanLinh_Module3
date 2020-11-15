package controller;

import Service.employeeService.EmployeeImp;
import Service.employeeService.IEmployee;
import models.Employee;
import models.other.Division;
import models.other.Education;
import models.other.Position;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EmployeeServlet", urlPatterns = "/employee")
public class EmployeeServlet extends HttpServlet {
    private IEmployee employees;

    public void init() {
        employees = new EmployeeImp();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "create":
                createNewEmployee(request,response);
                break;
            case "update":
                updateEmployee(request,response);
                break;
            case "delete":
                deleteEmployee(request,response);
                break;
            default:
                break;
        }
    }

    private void updateEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean check;
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String idCard = request.getParameter("idCard");
        int salary =Integer.parseInt(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int positionId = Integer.parseInt(request.getParameter("position"));
        int educationId = Integer.parseInt(request.getParameter("education"));
        int divisionId = Integer.parseInt(request.getParameter("division"));
        String username = request.getParameter("username");
        Employee employee = new Employee(id,name,birthday,idCard,phone,email,address,salary,positionId,educationId,divisionId,username);
        check = employees.updateEmployee(employee);
        request.setAttribute("check",check);
        System.out.println(check);
        RequestDispatcher dispatcher = request.getRequestDispatcher("furama/list_employee.jsp");
        dispatcher.forward(request,response);
    }

    private void createNewEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean check;
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String idCard = request.getParameter("idCard");
        int salary =Integer.parseInt(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int positionId = Integer.parseInt(request.getParameter("position"));
        int educationId = Integer.parseInt(request.getParameter("education"));
        int divisionId = Integer.parseInt(request.getParameter("division"));
        String username = request.getParameter("username");
       Employee employee = new Employee(name,birthday,idCard,phone,email,address,salary,positionId,educationId,divisionId,username);
       check = employees.insertEmployee(employee);
       request.setAttribute("check",check);
        System.out.println(check);
       RequestDispatcher dispatcher = request.getRequestDispatcher("furama/list_employee.jsp");
       dispatcher.forward(request,response);
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "edit":
                break;
            default:
                showAllEmployee(request, response);
                break;
        }
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean check;
        int id = Integer.parseInt(request.getParameter("id"));
        check=employees.deleteEmployee(id);
        System.out.println(check);
        request.setAttribute("check",check);
        RequestDispatcher dispatcher = request.getRequestDispatcher("furama/list_employee.jsp");
        dispatcher.forward(request, response);
    }

    private void showAllEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Employee> listEmployee = employees.showAllEmployee();
        List<Position> position = employees.position();
        List<Education> education = employees.education();
        List<Division> division = employees.division();
        request.setAttribute("listEmployee", listEmployee);
        request.setAttribute("position", position);
        request.setAttribute("education", education);
        request.setAttribute("division", division);
        String check = "back";
        request.setAttribute("check",check);
        RequestDispatcher dispatcher = request.getRequestDispatcher("furama/list_employee.jsp");
        dispatcher.forward(request, response);
    }
}
