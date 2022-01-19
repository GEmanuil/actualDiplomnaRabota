package johnatanasov.diplomawork;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "readyToViewContentServlet", value = "/readyToViewContentServlet")
public class readyToViewContentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("WINDOWS-1251");
        SQLJavaClass sqlJavaClass = new SQLJavaClass();
        HttpSession session = request.getSession();
        int id = Integer.parseInt(request.getParameter("id"));
        session.setAttribute("id", id);
        String title = sqlJavaClass.giveContentTitle(id);
        String text = sqlJavaClass.giveContentText(id);
//        System.out.println("In servlet: " + title + text + "id: " + id);
        session.setAttribute("title", title);
        session.setAttribute("text", text);
        getServletContext().getRequestDispatcher("/readyToViewContent2.jsp").forward(request, response);

    }
}
