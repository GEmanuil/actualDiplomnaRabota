package johnatanasov.diplomawork;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "testResultServlet", value = "/testResultServlet")
public class testResultServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("WINDOWS-1251");
        HttpSession session = request.getSession();
        SQLJavaClass sqlJavaClass = new SQLJavaClass();
        int userId = (int) session.getAttribute("userID");
        getServletContext().getRequestDispatcher("/testResult.jsp").forward(request, response);
    }
}
