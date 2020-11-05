package controller;

import model.Products;
import service.ProductService;
import service.ProductServiceImp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet",urlPatterns = "/products")
public class ProductServlet extends HttpServlet {
    ProductService productService = new ProductServiceImp();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action){
            case "create":
                createProduct(request, response);
                break;
            case "edit":
                editProduct(request, response);
                break;
            case "find":
                findProduct(request, response);
                break;
    }
    }
    private void findProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Products product = productService.findById(id);
        request.setAttribute("product",product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/detailProduct.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String code = request.getParameter("code") ;
        String date = request.getParameter("date");
        String origin = request.getParameter("origin") ;
        String company = request.getParameter("company") ;
        Products product = new Products(id,name,code,date,origin,company);
        productService.save(product);
        try {
            response.sendRedirect("/products?action=show");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) {
        int id =(int)(Math.random()*100);
        String name = request.getParameter("name");
        String code = request.getParameter("code") ;
        String date = request.getParameter("date");
        String origin = request.getParameter("origin") ;
        String company = request.getParameter("company") ;
        Products product = new Products(id,name,code,date,origin,company);
        productService.addProduct(id,product);
        try {
            response.sendRedirect("/products?action=show");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null) {
            action = "";
        }
        switch (action){
            case "show":
                showAll(request, response);
                break;
            case "create":
                callFormCreate(request, response);
                break;
            case "edit":
                callFormEdit(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            case "detail":
                callFormDetail(request, response);
                break;
            case"find":
                break;
        }
    }



    private void callFormDetail(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Products product = productService.findById(id);
        request.setAttribute("product",product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/detailProduct.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        productService.remove(id);
        try {
            response.sendRedirect("/products?action=show");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void callFormEdit(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/editProduct.jsp");
        int id = Integer.parseInt(request.getParameter("id"));
        Products product = productService.findById(id);
        request.setAttribute("product",product);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void callFormCreate(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/addProduct.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showAll(HttpServletRequest request, HttpServletResponse response) {
        List<Products> productsList = productService.showAll();
        request.setAttribute("productsList",productsList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/listProduct.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
