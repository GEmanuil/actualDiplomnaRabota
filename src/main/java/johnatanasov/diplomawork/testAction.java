package johnatanasov.diplomawork;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Random;

@WebServlet(name = "testAction", value = "/testAction")
public class testAction extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        SQLJavaClass sqlJavaClass = new SQLJavaClass();
        String code = (String) session.getAttribute("code");
        Random random = new Random();

        ArrayList<Integer> ids = (ArrayList<Integer>) session.getAttribute("idsForQuestions");
        int size = ids.size();
        ArrayList<Integer> list = new ArrayList<Integer>(size);
        for (int i = 1; i <= size; i++) {
            list.add(i);
        }
//        while(list.size() > 0) {
//            int index = random.nextInt(list.size());
//            System.out.println("Selected: "+list.remove(index));
//        }
        if(list.size() < 1){
            getServletContext().getRequestDispatcher("/testResultServlet").forward(request, response);
        }
        else {

        int index = random.nextInt(list.size());
//        System.out.println("List size: " + list.size());
        int skl = list.remove(index);
        int questionID = skl - 1;
        int idResult = ids.get(questionID);
        session.setAttribute("idToSet", idResult);
        session.setAttribute("listIdUsed", questionID);
//        System.out.println("size: " +skl);
        String[] answers = new String[4];
        session.setAttribute("answers", answers);
        answers = sqlJavaClass.giveTestAnswers(idResult);
        String answerChecker = answers[3];

            if (answerChecker == null) {
                getServletContext().getRequestDispatcher("/actualTestAction.jsp").forward(request, response);
            } else {
                for (int i = 0; i < 4; i++) {
                    String answer = answers[i];
                    if (answer.startsWith("}")) {
                        char[] answerArr = answer.toCharArray();
                        char[] newanswerArr = new char[answerArr.length - 1];
                        for (int j = 0; j < newanswerArr.length; j++) {
                            newanswerArr[j] = answerArr[j + 1];
                        }
                        answer = String.valueOf(newanswerArr);
                        answers[i] = answer;
                    }
                }

                session.setAttribute("answers", answers);
                getServletContext().getRequestDispatcher("/actualTestAction.jsp").forward(request, response);
            }

        }
    }
}
