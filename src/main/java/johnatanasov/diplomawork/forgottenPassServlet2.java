package johnatanasov.diplomawork;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "forgottenPassServlet2", value = "/forgottenPassServlet2")
public class forgottenPassServlet2 extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = session.getAttribute("email").toString();
        String code = session.getAttribute("code").toString();
        String message = "code is not valid!!";
        if(code.equals(request.getParameter("code"))){
            getServletContext().getRequestDispatcher("/forgotenPassword3.jsp").forward(request, response);
        }
        else {
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<h1>" + message + "</h1>");
            out.println("</body></html>");
        }
    }
}
