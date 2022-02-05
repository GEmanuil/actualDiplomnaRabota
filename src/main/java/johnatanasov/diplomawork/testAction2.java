package johnatanasov.diplomawork;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Enumeration;

@WebServlet(name = "testAction2", value = "/testAction2")
public class testAction2 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        SQLJavaClass sqlJavaClass = new SQLJavaClass();
        String answerFromTextArea = request.getParameter("answerTATA");
        System.out.println("String on bg?: " + answerFromTextArea);
        String answerFromCheckBox = request.getParameter("checkBox");
        String email = (String) session.getAttribute("email");
        int idForAskedQuestion = (int) session.getAttribute("idToSet");
//        Enumeration<String> sesiq = session.getAttributeNames();
//        while(sesiq.hasMoreElements()){
//            System.out.println("In session: " + sesiq.nextElement());
//        }
        if(answerFromCheckBox == null){
            sqlJavaClass.insertanswersInfo(answerFromTextArea, session);

        }
        else{
            sqlJavaClass.insertanswersInfo(answerFromCheckBox, session);
        }
        getServletContext().getRequestDispatcher("/testAction").forward(request, response);
    }
}
