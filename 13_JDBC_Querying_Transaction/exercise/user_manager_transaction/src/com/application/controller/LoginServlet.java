package com.application.controller;

import dao.LoginDAO;
import model.Login;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginServlet",urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LoginDAO loginDao;


    public void init() {
        loginDao = new LoginDAO();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Login login = new Login();
        login.setUsername(username);
        login.setPassword(password);
        try {
            if (loginDao.validate(login)) {
                HttpSession session = request.getSession();
                 session.setAttribute("username",username);
                response.sendRedirect("/user");
            } else {
                String failed = "Wrong";
                String flag = "false";
                HttpSession session = request.getSession();
                session.setAttribute("failed", failed);
                session.setAttribute("flag", flag);
                response.sendRedirect("user/login.jsp");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch(action){
            case "login":
                callLoginForm(request, response);
                break;
            default:
                break;
        }
    }

    private void callLoginForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/login.jsp");
        dispatcher.forward(request, response);
    }
}
