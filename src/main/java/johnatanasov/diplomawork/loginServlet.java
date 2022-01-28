package johnatanasov.diplomawork;

import java.io.*;
import java.util.Objects;
import javax.servlet.*;
import mail.randomGenerator;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
@WebServlet(name = "loginServlet", urlPatterns = "/logServe")
public class loginServlet extends HttpServlet{
    private final regInfoClass person = new regInfoClass();
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("WINDOWS-1251");
        String message = "Email or password are not correct!!!";
        String message2 = ":) Good job :)";
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        System.out.println(email + password);
        SQLJavaClass chek = new SQLJavaClass();
        person.setEmail(email);
        person.setPassword(password);

        if(chek.check(person)){
            String TorS = chek.checkForST(person);
            HttpSession session = request.getSession();
            session.setAttribute("email", email);
            session.setAttribute("password", password);
            session.setAttribute("userID", chek.givepersonId(session));
            if(Objects.equals(TorS, "teacher")){
                session.setAttribute("st", "teacher");
                response.sendRedirect("relookMain.jsp");
            }
            else if (Objects.equals(TorS, "student")){
                session.setAttribute("st", "student");
                response.sendRedirect("StRelookMain.jsp");
                randomGenerator random = new randomGenerator();
            }
        }
        else{
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<h1>" + message + "</h1>");
            out.println("</body></html>");
        }
    }

}
