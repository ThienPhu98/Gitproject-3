import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Process", value = "/count")
public class Process extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String product = (request.getParameter("Product Description"));
        double price = Double.parseDouble(request.getParameter("Price"));
        double discount = Double.parseDouble(request.getParameter("Percent Discount"));

        double discountPrice = (price * discount * 0.01);
        double finalPrice = price - discountPrice;

        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h1>Product: " + product + "</h1>");
        writer.println("<h1>Price: " + price + "</h1>");
        writer.println("<h1>Discount: " + discount + "</h1>");
        writer.println("<h1>Discount Price: " + discountPrice + "</h1>");
        writer.println("<h1>Final Price: " + finalPrice + "</h1>");
        writer.println("</html>");
    }

    protected void doGet (HttpServletRequest request, HttpServletResponse response) {

    }
}
