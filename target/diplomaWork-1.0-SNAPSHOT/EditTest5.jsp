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
<%
    String[] answers = (String[]) request.getAttribute("answers");
    String answer1 = answers[0];
    String answer2 = answers[1];
    String answer3 = answers[2];
    String answer4 = answers[3];
%>
<h1 id="makingTestText">

    <form  action="/servForTestUpdate" method="post">
        <label class="Register FN" for="Question">Question: </label><br>
        <textarea class="Register FN B" type="text" id="Question" name="Question" required><%=request.getAttribute("title")%></textarea><br><br>
        Answers:<br>
        <label class="Register LN" for="answerA">A</label>
        <textarea class="Register LN B" type="text" id="answerA" name="answerA" required><%=answer1%></textarea>
        <label><input checked id="1" type="radio" name="checkBox" value="A"></label><br><br>
        <label class="Register LN" for="answerB">B</label>
        <textarea class="Register LN B" type="text" id="answerB" name="answerB" required><%=answer2%></textarea>
        <label><input  id="2" type="radio" name="checkBox" value="B"></label><br><br>
        <label class="Register LN" for="answerC">C</label>
        <textarea class="Register LN B" type="text" id="answerC" name="answerC" required><%=answer3%></textarea>
        <label><input  id="3" type="radio" name="checkBox" value="C"></label><br><br>
        <label class="Register LN" for="answerD">D</label>
        <textarea class="Register LN B" type="text" id="answerD" name="answerD" required><%=answer4%></textarea>
        <label><input  id="4" type="radio" name="checkBox" value="D"></label><br><br>
        <input class="Register S" type="submit" value="UPDATE"><br>
    </form>


</h1>
</html>
