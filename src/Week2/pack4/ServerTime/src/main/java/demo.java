import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.util.Date;

@WebServlet(name = "demo", urlPatterns = "/index")
public class demo extends HttpServlet {
    protected void doPost (HttpServletRequest request, HttpServletResponse response) {
    }

    protected void doGet (HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        Date today = new Date();
        writer.println("<h1>" + today + "</h1>");
        writer.println("</html>");
    }

}
