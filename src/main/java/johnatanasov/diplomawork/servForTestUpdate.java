package johnatanasov.diplomawork;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "servForTestUpdate", urlPatterns = "/servForTestUpdate")
public class servForTestUpdate extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("WINDOWS-1251");
        SQLJavaClass sqlJavaClass = new SQLJavaClass();
        HttpSession session = request.getSession();
        String answerChecker = request.getParameter("answer");
        String question = request.getParameter("Question");
        if(answerChecker == null){
            String answer1 = request.getParameter("answerA");
            String answer2 = request.getParameter("answerB");
            String answer3 = request.getParameter("answerC");
            String answer4 = request.getParameter("answerD");
            sqlJavaClass.updateQuestions(question, answer1, answer2, answer3, answer4, session);
            getServletContext().getRequestDispatcher("/makingTest.jsp?contentTest=Make+a+test").forward(request, response);
        }
        else {
            sqlJavaClass.updateQuestion(question, answerChecker,session);
            getServletContext().getRequestDispatcher("/makingTest.jsp?contentTest=Make+a+test").forward(request, response);
        }
    }
}
