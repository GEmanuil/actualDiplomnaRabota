package johnatanasov.diplomawork;

import mail.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

@WebServlet(name = "register", urlPatterns = "/regServ")
public class register extends HttpServlet {
    private final regInfoClass person = new regInfoClass();
    private static final SQLJavaClass persons = new SQLJavaClass();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("WINDOWS-1251");
    String firstName = request.getParameter("firstname");
    String lastName = request.getParameter("lastname");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String repeatedPass = request.getParameter("repeatPassword");
    String teachStudy = request.getParameter("checkbox");
    String message2 = "The passwords do not match!!";
    forMail mail = new forMail();
    randomGenerator randomGenerator = new randomGenerator();

    //    regInfoClass person = new regInfoClass();
        person.setFirstname(firstName);
        person.setLastname(lastName);
        person.setEmail(email);
        person.setPassword(password);
        person.setTeachStud(teachStudy);

        if(password.equals(repeatedPass)){
            String code = randomGenerator.generateString();
            HttpSession session = request.getSession();
            session.setAttribute("email", email);
            session.setAttribute("code", code);
            session.setAttribute("personOb", person);
            mail.mailSend(email, code);
            System.out.println("In reg: " + email + ", " + code + ", " + password);
            getServletContext().getRequestDispatcher("/successfulRegJ.jsp").forward(request, response);
        }
        else{
            // response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<h1>" + message2 + "</h1>");
            out.println("</body></html>");

        }
        //response.setContentType("text/html");
        //                try{
//                    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo", "root", "c6gkjN9ELV7ZQQxE");
//                    Statement statement = connection.createStatement();
//                    ResultSet resultSet = statement.executeQuery("select * from regtb");
//                    while(resultSet.next()){
//                        System.out.println(resultSet.getString("firstname"));
//                    }
//                }
//                catch (Exception e){
//                    e.printStackTrace();
//                }
            }

        }



