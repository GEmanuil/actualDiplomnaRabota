package johnatanasov.diplomawork;

import mail.randomGenerator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "codeEnterServlet", value = "/codeEnterServlet")
public class codeEnterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        request.setCharacterEncoding("WINDOWS-1251");
        SQLJavaClass sqlJavaClass = new SQLJavaClass();
        String code = request.getParameter("code");
        String title = sqlJavaClass.giveContentTitle(code, session);
        String text = sqlJavaClass.giveContentText(code);
        session.setAttribute("title", title);
        session.setAttribute("text", text);
        session.setAttribute("code", code);
        boolean checkIfMade = sqlJavaClass.checkForMadeTest(session);
        System.out.println("In servlet check of made: " + checkIfMade);
        getServletContext().getRequestDispatcher("/readyToViewContent2.jsp").forward(request, response);


    }
}
