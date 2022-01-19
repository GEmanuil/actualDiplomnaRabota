package johnatanasov.diplomawork;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;

@WebServlet(name = "ServForQuestionEdit", urlPatterns = "/ServForQuestionEdit")
public class ServForQuestionEdit extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("WINDOWS-1251");
        HttpSession session = request.getSession();
        int id1 = Integer.parseInt(request.getParameter("idForQuestion"));
        int id2 = (int) session.getAttribute("id");
        session.setAttribute("idForQuestion", id1);
        SQLJavaClass sqlJavaClass = new SQLJavaClass();
        HashMap<Integer, String> titlesIds = sqlJavaClass.giveTestTitles(session);
        String title = titlesIds.get(id1);
        System.out.println("ID for content: " + id2 + " IDFOrQuestion: " + id1 + " "+ title + " ");
        String[] answers = sqlJavaClass.giveTestAnswers(session);
        String answerChecker = answers[3];
        if(answerChecker == null){
            request.setAttribute("title", title);
            request.setAttribute("answer", answers[0]);
            getServletContext().getRequestDispatcher("/EditTest4.jsp").forward(request, response);
        }
        else{
            request.setAttribute("title", title);
            request.setAttribute("answers", answers);
            getServletContext().getRequestDispatcher("/EditTest5.jsp").forward(request, response);
        }
    }
}
