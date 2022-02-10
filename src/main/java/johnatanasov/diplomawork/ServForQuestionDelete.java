package johnatanasov.diplomawork;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServForQuestionDelete", value = "/ServForQuestionDelete")
public class ServForQuestionDelete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("WINDOWS-1251");
        HttpSession session = request.getSession();
        SQLJavaClass sqlJavaClass = new SQLJavaClass();
        int idOfQuestion = Integer.parseInt(request.getParameter("idForQuestion"));
        System.out.println("In servlet GET delete id: " + idOfQuestion);
        sqlJavaClass.deleteQuestion(idOfQuestion);
        getServletContext().getRequestDispatcher("/makingTest.jsp").forward(request, response);
    }
}
