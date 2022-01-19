package johnatanasov.diplomawork;

import johnatanasov.diplomawork.SQLJavaClass;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "servForTest", urlPatterns = "/servForTest")
public class servForTest extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SQLJavaClass sqlJavaClass = new SQLJavaClass();
        HttpSession session = request.getSession();
        request.setCharacterEncoding("WINDOWS-1251");
        String question = request.getParameter("Question");
        if(request.getParameter("answer") == null){
            String A =  request.getParameter("answerA");
            String B =  request.getParameter("answerB");
            String C =  request.getParameter("answerC");
            String D =  request.getParameter("answerD");
            System.out.println(A + " " + B + " " + " " + C + " " + D);
            session.getAttribute("id");
            sqlJavaClass.insertTest(question, session, A, B, C, D);
        }

        else{
        String answer = request.getParameter("answer");
        session.getAttribute("id");
        System.out.println(request.getParameter("Question") + " " + request.getParameter("answer") + " " + session.getAttribute("id"));
        sqlJavaClass.insertTest(question, answer, session);
        }

    }
}
