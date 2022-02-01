package johnatanasov.diplomawork;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Objects;

@WebServlet(name = "testResultServlet", value = "/testResultServlet")
public class testResultServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("WINDOWS-1251");
        HttpSession session = request.getSession();
        SQLJavaClass sqlJavaClass = new SQLJavaClass();
        String st = (String) session.getAttribute("st");
        if(Objects.equals(st, "teacher")){
            Integer studenId = Integer.parseInt(request.getParameter("id"));
            session.setAttribute("userID", studenId);
            System.out.println("      !!!     IAM A TEACHER        /              /?????? ");
        }

        getServletContext().getRequestDispatcher("/testResult.jsp").forward(request, response);
    }
}
