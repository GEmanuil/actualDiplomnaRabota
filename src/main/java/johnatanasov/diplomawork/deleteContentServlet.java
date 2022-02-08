package johnatanasov.diplomawork;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Enumeration;

@WebServlet(name = "deleteContentServlet", value = "/deleteContentServlet")
public class deleteContentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("WINDOWS-1251");
        SQLJavaClass sqlJavaClass = new SQLJavaClass();
        HttpSession session = request.getSession();
//        Enumeration<String> sesiq = session.getAttributeNames();
//        sesiq = session.getAttributeNames();
//        while(sesiq.hasMoreElements()){
//            System.out.println("SEssion: " + sesiq.nextElement());
//        }
        int id = (int) session.getAttribute("id");
        sqlJavaClass.deleteContent(id);
        getServletContext().getRequestDispatcher("/relookMain.jsp").forward(request, response);

    }
}
