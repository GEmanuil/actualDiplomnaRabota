package johnatanasov.diplomawork;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import mail.randomGenerator;

@WebServlet(name = "addContentServlet", urlPatterns = "/addContentServlet")
public class addContentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        randomGenerator random = new randomGenerator();
        HttpSession session = request.getSession();
        request.setCharacterEncoding("WINDOWS-1251");
        String a = request.getParameter("title");
        String b = request.getParameter("MainText");
        String code = random.generateString();
        SQLJavaClass k = new SQLJavaClass();
        k.insertContent(a, b,session, code);
        getServletContext().getRequestDispatcher("/relookMain.jsp").forward(request, response);

    }
}
