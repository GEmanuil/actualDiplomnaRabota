<%--
  Created by IntelliJ IDEA.
  User: em4o_
  Date: 27.12.2021 �.
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

<h1 id="makingTestText">

    <form  action="/servForTest" method="post">
        <label class="Register FN" for="Question">Question: </label><br>
        <textarea class="Register FN B" type="text" id="Question" name="Question" required></textarea><br><br>
        Answers:<br>
        <label class="Register LN" for="answerA">A</label>
        <textarea class="Register LN B" id="answerA" name="answerA" required></textarea>
        <label><input checked id="1" type="radio" name="checkBox" value="A"></label><br><br>
        <label class="Register LN" for="answerB">B</label>
        <textarea class="Register LN B" id="answerB" name="answerB" required></textarea>
        <label><input  id="2" type="radio" name="checkBox" value="B"></label><br><br>
        <label class="Register LN" for="answerC">C</label>
        <textarea class="Register LN B" id="answerC" name="answerC" required></textarea>
        <label><input  id="3" type="radio" name="checkBox" value="C"></label><br><br>
        <label class="Register LN" for="answerD">D</label>
        <textarea class="Register LN B" id="answerD" name="answerD" required></textarea>
        <label><input  id="4" type="radio" name="checkBox" value="D"></label><br><br>
        <input class="Register S" type="submit" value="SUBMIT"><br>
    </form>

    <%--    <%--%>
    <%--        for(int i = 0; i < 100; i++){--%>
    <%--            %>--%>
    <%--    kak e--%>
    <%--    <%--%>
    <%--        }--%>
    <%--    %>--%>
</h1>
</html>
