package controller;

import Service.IServices;
import Service.ServicesImp;
import models.Service;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServiceServlet", urlPatterns = "/service")
public class ServiceServlet extends HttpServlet {
    private IServices services;

    public void init() {
        services = new ServicesImp();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");;
        switch (action) {
            case "create":
                createNewService(request, response);
                break;
            default:
                break;
        }

    }

    private void createNewService(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = services.randomServiceID();
        String name = request.getParameter("name");
        double service_area = Double.parseDouble(request.getParameter("service_area"));
        int service_cost = Integer.parseInt(request.getParameter("service_cost"));
        int service_max_people = Integer.parseInt(request.getParameter("service_max_people"));
        int rent_type_id = Integer.parseInt(request.getParameter("rent_type_id"));
        int service_type_id = Integer.parseInt(request.getParameter("service_type_id"));
        String standard_room = request.getParameter("standard_room");
        String description = request.getParameter("description");
        double area_pool = Double.parseDouble(request.getParameter("area_pool"));
        int number_of_floor = Integer.parseInt(request.getParameter("number_of_floor"));
        String status = request.getParameter("status");
        Service service = new Service(id,name,service_area,service_cost,service_max_people,rent_type_id
        ,service_type_id,standard_room,description,area_pool,number_of_floor,status);
        services.insertNewService(service);
        response.sendRedirect("/service");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = "";
        request.getParameter("action");
        switch (action) {
            case "1":
                break;
            default:
                showAllService(request, response);
                break;
        }
    }

    private void showAllService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Service> listService = services.showAllService();
        request.setAttribute("listService", listService);
        RequestDispatcher dispatcher = request.getRequestDispatcher("furama/list_service.jsp");
        dispatcher.forward(request, response);
    }
}
