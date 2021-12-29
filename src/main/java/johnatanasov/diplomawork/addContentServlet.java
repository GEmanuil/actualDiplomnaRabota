package johnatanasov.diplomawork;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "addContentServlet", urlPatterns = "/addContentServlet")
public class addContentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
//        System.out.println(request.getParameter("MainText"));
//        System.out.println(session.getAttribute("email"));
//        System.out.println(session.getAttribute("password"));
        String a = request.getParameter("title");

        String b = request.getParameter("MainText");
        SQLJavaClass k = new SQLJavaClass();
        k.insertContent(a, b,session);

    }
}
