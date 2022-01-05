package johnatanasov.diplomawork;

import mail.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "forgottenPassServlet1", value = "/forgottenPassServlet1")
public class forgottenPassServlet1 extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SQLJavaClass sql = new SQLJavaClass();
        regInfoClass oemail = new regInfoClass();
        HttpSession session = request.getSession();
        forMail mailSend = new forMail();
        randomGenerator randomGenerator = new randomGenerator();
        String message = "email doesnt exist";
        String message2 = "email exist";
        String code = randomGenerator.generateString();
        String email = request.getParameter("email");
        session.setAttribute("email", email);
        session.setAttribute("code", code);
        oemail.setEmail(email);
        if (sql.checkOnlyForEmail(oemail)) {
            mailSend.mailSend(email, code);
            getServletContext().getRequestDispatcher("/forgottenPassword2.jsp").forward(request, response);
        } else {
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<h1>" + message + "</h1>");
            out.println("</body></html>");
        }
    }
}
