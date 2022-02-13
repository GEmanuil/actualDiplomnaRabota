<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<%@ page import="johnatanasov.diplomawork.*"  %>
<%@ page import="mail.*"  %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Objects" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/testResult.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Fira+Sans:wght@400&display=swap" rel="stylesheet">
    <title>My Relook</title>

</head>
    <body>
    <%
        String st = (String) session.getAttribute("st");

        if (Objects.equals(st, "teacher")){
    %>
    <div class="main-menu">
        <ul>
            <section class="home">
                <li class="menu-item" onclick="location.href='relookMain.jsp'"><i class="fa fa-home"></i>Home</li>
                <li class="menu-item" onclick="location.href='profile.jsp'" ><i class="fa fa-user" ></i>Profile</li>
                <%
                    HashMap<Integer, String> title2 = (HashMap<Integer, String>) session.getAttribute("titles");
                    Iterator<Integer> keySet2 = title2.keySet().iterator();
                    String tit;
                    while(keySet2.hasNext()){
                        int key1 = keySet2.next();
                        tit = title2.get(key1);
                %>
                <li class="menu-item" onclick="location.href='readyToViewContentServlet?id=<%=key1%>'"><i class="fa fa-minus"></i><%=tit%></li>
                <%
                    }
                %>
                <li class="menu-item" onclick="location.href='logout.jsp'" ><i class="fa fa-sign-out"></i>Log Out</li>
            </section>
        </ul>
    </div>

    <% }

        else{ %>
    <div class="main-menu">
        <ul>
            <section class="home">
                <li class="menu-item" onclick="location.href='StRelookMain.jsp'"><i class="fa fa-home"></i>Home</li>
                <li class="menu-item" onclick="location.href='profile.jsp'" ><i class="fa fa-user" ></i>Profile</li>
                <li class="menu-item" onclick="location.href='logout.jsp'" ><i class="fa fa-sign-out"></i>Log Out</li>
            </section>
        </ul>
    </div>

       <% } %>

    <div class="mainDiv">
    <h1 id="mainTxt" draggable="true">
        Relook
    </h1>
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
        <div class="questionAnswerBorder">
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

                if(answer.equals(answerPlaced)){/*Da dovursha tam zeleno cherveno za otgovorite*/}
                    %>


        <%=answer%> <br>
        Answer placed: <%=answerPlaced%>
        <br>
        <%
           }
  }
        } %>
        </div>
    <br><br>
        <% } %>

    </h1>
    </div>
</body>
</html>