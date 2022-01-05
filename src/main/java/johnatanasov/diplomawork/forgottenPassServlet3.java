package johnatanasov.diplomawork;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "forgottenPassServlet3", value = "/forgottenPassServlet3")
public class forgottenPassServlet3 extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SQLJavaClass sqlJavaClass = new SQLJavaClass();
        HttpSession session = request.getSession();
        String message = "The password does not match";
        String password = request.getParameter("password");
        String repeatedPassword = request.getParameter("repeated");
        if(password.equals(repeatedPassword)){
            sqlJavaClass.updatePassword(password, session.getAttribute("email").toString());
            getServletContext().getRequestDispatcher("/successfulPassChangeServlet.jsp").forward(request, response);
        }
        else {
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<h1>" + message + "</h1>");
            out.println("</body></html>");
        }
    }
}
