<%--
  Created by IntelliJ IDEA.
  User: em4o_
  Date: 27.12.2021 ã.
  Time: 11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<%@ page import="johnatanasov.diplomawork.*"  %>
<%@ page import="mail.*"  %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <link rel="stylesheet" href="/addingContent.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
    <title>My Relook</title>

</head>
<body>

</body>

<h1 id="mainTxt" draggable="true">
    Relook
</h1>

<ul id="lr" class="RL">
</ul>

<h1 id="makingTestText">

<%
    SQLJavaClass sqlJavaClass = new SQLJavaClass();
    String code = (String) session.getAttribute("code");
    ArrayList<Integer> questionIDS = sqlJavaClass.giveQuestionsIDs(code);

    for(int i = 0; i < questionIDS.size(); i++){

        int questioniD = questionIDS.get(i);
        String actualQuestion = sqlJavaClass.giveTestQuestion(questioniD);
        String[] answers = sqlJavaClass.giveTestAnswers(questioniD);
        String answerPlaced = sqlJavaClass.giveAnsweredAnswer(questioniD, session);
    %>

        Question: <%= actualQuestion%> <br>
    <% if(answers[3] == null) { %>
        Correct answer: <%= answers[0]%> <br>
        Answer placed: <%=answerPlaced%>
    <br>
    <% }
    else{ %>
    Correct answer: <%
        for(int j = 0; j < 4; j++){
            if (answers[j].startsWith("}")) {
                String answer = answers[j];
                char[] answerArr = answer.toCharArray();
                char[] newanswerArr = new char[answerArr.length - 1];
                System.arraycopy(answerArr, 1, newanswerArr, 0, newanswerArr.length);
                answer = String.valueOf(newanswerArr);

                    if (answerPlaced.startsWith("}")) {
                        String answer2 = answers[j];
                        char[] answerArr1 = answer2.toCharArray();
                        char[] newanswerArr2 = new char[answerArr1.length - 1];
                        System.arraycopy(answerArr1, 1, newanswerArr2, 0, newanswerArr2.length);
                        answerPlaced = String.valueOf(newanswerArr2);
                    }

                %>
    <%=answer%> <br>
    Answer placed: <%=answerPlaced%>
    <br>
    <%
    %>

    <%
        }

                %>
    <%
    %>

   <%

        }


     } %><br><br>
    <% }%>


    <form  action="/??" method="post">

    </form>


</h1>
</html>