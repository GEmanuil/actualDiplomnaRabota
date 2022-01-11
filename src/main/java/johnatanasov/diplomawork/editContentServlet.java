package johnatanasov.diplomawork;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "editContentServlet", value = "/editContentServlet")
public class editContentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SQLJavaClass sqlJavaClass = new SQLJavaClass();
        HttpSession session = request.getSession();
        String title = request.getParameter("title");
        String text = request.getParameter("MainText");
        sqlJavaClass.updateContent(title, text, session);
        session.setAttribute("title", title);
        session.setAttribute("text", text);
        getServletContext().getRequestDispatcher("/readyToViewContent2.jsp").forward(request, response);
    }
}
