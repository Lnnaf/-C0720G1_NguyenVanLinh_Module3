import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DiscountServlet",urlPatterns = "/discount_calculation")
public class DiscountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nameProduct = request.getParameter("description");
        double listPrice = Double.parseDouble(request.getParameter("listPrice"));
        double discount = Double.parseDouble(request.getParameter("discount"));

        double amount = listPrice * discount*0.01;
        double discountPrice = listPrice-amount;

        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h1>Name Product: "+nameProduct+"</h1>");
        writer.println("<h1>List Price: "+listPrice+" USD</h1>");
        writer.println("<h1>Price Decreased: -"+amount+" USD</h1>");
        writer.println("<h1>Discount: "+discount+" %<h1>");
        writer.println("<h1>Price After Discount : "+discountPrice+" USD</h1>");
        writer.println("</html>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
