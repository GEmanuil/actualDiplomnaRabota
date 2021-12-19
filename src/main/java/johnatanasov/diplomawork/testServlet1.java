package johnatanasov.diplomawork;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
@WebServlet(name = "testServlet1", urlPatterns = "/testi")
public class testServlet1 extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");

        StringBuilder error = new StringBuilder();
        if (firstname == null){
            error.append("No firstname");
        }
        else if(lastname == null){
            error.append("NO lastname");
        }
        if(error.length() > 0){
            request.setAttribute("error", error.toString());
        }
        else{
            request.setAttribute("firstname", firstname);
            request.setAttribute("lastname", lastname);
        }
        getServletContext().getRequestDispatcher("/test.jsp").forward(request, response);
    }

}
