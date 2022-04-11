package johnatanasov.diplomawork;

import mail.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Objects;


@WebServlet(name = "regForCodeServlet", urlPatterns = "/regForCodeServlet")
public class regForCodeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        SQLJavaClass persons = new SQLJavaClass();
        String message = "You registered successfully.";
        String code = session.getAttribute("code").toString();
        String codeFromJSP = request.getParameter("code");
        String email = session.getAttribute("email").toString();
        System.out.println("In regFOrServ: " + email + ", " + code);
        if(code.equals(codeFromJSP)){
            regInfoClass per = (regInfoClass) session.getAttribute("personOb");
            persons.insert(per);
            getServletContext().getRequestDispatcher("/successfulRegistreation.jsp").forward(request, response);
//            PrintWriter out = response.getWriter();
//            out.println("<html><body>");
//            out.println("<h1>" + message + "</h1>");
//            out.println("</body></html>");
        }
        else {
            System.out.println(":(");
            session.setAttribute("nah", "nah");
        }
    }
}
