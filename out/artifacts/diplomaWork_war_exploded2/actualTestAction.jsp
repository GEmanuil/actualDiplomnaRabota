<%@ page import="johnatanasov.diplomawork.SQLJavaClass" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/addingContent.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Fira+Sans:wght@400&display=swap" rel="stylesheet">
    <title>My Relook</title>

</head>
<body>
<script type="text/javascript">
    function preback() {window.history.forward();}
    setTimeout("preback()", 0);
    window.onunload = function () {null};
</script>
</body>

<h1 id="mainTxt" draggable="true">
    Relook
</h1>

<h1 id="makingTestText">

    <p id="textForMakeTestButton">
        <%
            int idToSet = (int) session.getAttribute("idToSet");
            SQLJavaClass sqlJavaClass = new SQLJavaClass();
            String code = session.getAttribute("code").toString();
            String question = sqlJavaClass.giveTestQuestion(idToSet);
            ArrayList<Integer> idsList = (ArrayList<Integer>) session.getAttribute("idsForQuestions");
            int listIdUsed = (int) session.getAttribute("listIdUsed");
            idsList.remove(listIdUsed);
            session.setAttribute("idsForQuestions", idsList);
        %>
        <%=question%>
    </p>
    <p>
        <%
            String[] answers = (String[]) session.getAttribute("answers");
            String answer1 = answers[0];
            String answer2 = answers[1];
            String answer3 = answers[2];
            String answer4 = answers[3];


            if(answer3 == null){ %>
        <form action="${pageContext.request.contextPath}/testAction2" method="get">
        <label for="answerTATA"></label>
        <textarea id="answerTATA" name="answerTATA" required></textarea><br><br>

        <%   }

        else{ %>

    <form action="${pageContext.request.contextPath}/testAction2" method="get">
    <label><input id="1" type="radio" name="checkBox" value="answer1" required></label>
    <label class="Register LN">A) <%=answer1%></label><br><br>

    <label><input  id="2" type="radio" name="checkBox" value="answer2"></label>
    <label class="Register LN">B) <%=answer2%></label><br><br>


    <label><input  id="3" type="radio" name="checkBox" value="answer3"></label>
    <label class="Register LN">C) <%=answer3%></label><br><br>


    <label><input  id="4" type="radio" name="checkBox" value="answer4"></label>
    <label class="Register LN">D) <%=answer4%></label><br><br>

    </p>
    <% } %>

        <input type="submit" value="Next Question" id="addButton">
    </form>

</h1>
</html>
