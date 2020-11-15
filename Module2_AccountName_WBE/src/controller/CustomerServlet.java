package controller;

import Service.IServices;
import Service.ServicesImp;
import commons.Validation;
import models.Customer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IServices services;

    public void init() {
        services = new ServicesImp();
    }
    public Validation validation = new Validation();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "create":
                createNewCustomer(request, response);
                break;
            case "edit":
                editCustomer(request,response);
           break;
        }
    }


    private void editCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        String customer_type_id = (request.getParameter("customer_type"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String gender = request.getParameter("gender");
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Customer customer = new Customer(id,name,birthday,gender, idCard,phone,email,address,customer_type_id);
services.updateCustomer(customer);
response.sendRedirect("customer?action=show");
    }

    private void createNewCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String> listErr =new ArrayList<>();
        List<String> listIDCard = services.selectAllCustomerIDCard();
        List<String> listPhone = services.selectAllCustomerPhone();
        String flag = null;
        boolean check;
        String errMessageName = null;
        String errMessageIdCard = null;
        String errMessagePhone = null;
        String errMessageEmail = null;
        String errMessageIDCardDuplicate = null;
        String errMessagePhoneDuplicate = null;
        String name = request.getParameter("name");
        String id = services.randomID();
        String birthday = request.getParameter("birthday");
        String gender = request.getParameter("gender");
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String customer_type = request.getParameter("customer_type");
         check=validation.regexNameOfCustomer(name);
        if(!check){
            flag = "false";
            errMessageName="Wrong format of name, please try again!";
            listErr.add(errMessageName);
        }
        check = validation.regexIDCard(idCard);
        if(!check){
            errMessageIdCard = "Wrong format of ID Card, please try again!";
        }else{
            errMessageIDCardDuplicate=null;
            for (String Phone: listPhone) {
                if((Phone.equals(phone))){
                    errMessageIDCardDuplicate = "Your ID Card already Exist in we system, please try another ID Card !";
                    System.out.println(errMessageIDCardDuplicate);
                    listErr.add(errMessageIDCardDuplicate);
                    flag="false";
                    break;
                }
            }
        }

        check = validation.regexPhone(phone);
        if(!check){
            errMessagePhone = "Wrong format phone, please try enter 10 number 090xxx or 091xxx!";
        }else{
            errMessagePhoneDuplicate=null;
            for (String ID: listIDCard) {
                if((ID.equals(idCard))){
                    errMessagePhoneDuplicate = "Your Phone number already Exist in we system, please try another  !";
                    System.out.println(errMessagePhoneDuplicate);
                    listErr.add(errMessagePhoneDuplicate);
                    flag="false";
                    break;
                }
            }
        }
        if(!validation.regexEmail(email)){
            errMessageEmail = "Wrong format email, please try example@example.com !";
        }

        if(!listErr.isEmpty()){
            request.setAttribute("errMessageName",errMessageName);
            request.setAttribute("errMessageIdCard",errMessageIdCard);
            request.setAttribute("errMessagePhone",errMessagePhone);
            request.setAttribute("errMessageEmail",errMessageEmail);
            request.setAttribute("errMessageIDCardDuplicate",errMessageIDCardDuplicate);
            request.setAttribute("errMessagePhoneDuplicate",errMessagePhoneDuplicate);
            request.setAttribute("check",flag);
            RequestDispatcher dispatcher = request.getRequestDispatcher("furama/list.jsp");
            dispatcher.forward(request,response);
        }else{
            Customer customer = new Customer(id, name, birthday, gender, idCard, phone, email, address,customer_type);
            services.insertNewCustomer(customer);
            try {
                response.sendRedirect("/customer?action=show");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "show":
                showAllCustomer(request, response);
                break;
            case "edit":
                CallEditCustomerForm(request,response);
                break;
            case "delete":
                deleteCustomer(request,response);
        }
    }

    private void CallEditCustomerForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Customer customer = services.selectCustomer(id);
        request.setAttribute("customer",customer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("furama/form-edit.jsp");
        dispatcher.forward(request,response);
    }


    private void showAllCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> listCustomer = services.selectAllUserServices();
        request.setAttribute("listcustomer", listCustomer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("furama/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        services.deleteCustomer(id);
        response.sendRedirect("customer?action=show");
    }
}
