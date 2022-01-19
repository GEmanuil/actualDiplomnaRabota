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

<h1 id="makingTestText">

    <form  action="/servForTest" method="post">
        <label class="Register FN" for="Question">Question: </label><br>
        <input class="Register FN B" type="text" id="Question" name="Question" required><br><br>
        <label class="Register LN" for="answer">answer: </label><br>
        <input class="Register LN B" type="text" id="answer" name="answer" required><br><br>
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
