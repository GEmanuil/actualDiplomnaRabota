package johnatanasov.diplomawork;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.io.OutputStream;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "register", urlPatterns = "/regServ")
public class register extends HttpServlet {
    private final regInfoClass person = new regInfoClass();
    private static final SQLJavaClass persons = new SQLJavaClass();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String firstName = request.getParameter("firstname");
    String lastName = request.getParameter("lastname");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String repeatedPass = request.getParameter("repeatPassword");
    String message2 = "The passwords do not match!!";
    String message1 = "You registered successfully";
        regInfoClass person = new regInfoClass();
        person.setFirstname(firstName);
        person.setLastname(lastName);
        person.setEmail(email);
        person.setPassword(password);
        if(password.equals(repeatedPass)){
            getServletContext().getRequestDispatcher("/successfulRegJ.jsp").forward(request, response);
            persons.insert(person);
//            response.setContentType("text/html");
//            PrintWriter out = response.getWriter();
//            out.println("<html><body>");
//            out.println("<h1>" + message1 + "</h1>");
//            out.println("</body></html>");
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



