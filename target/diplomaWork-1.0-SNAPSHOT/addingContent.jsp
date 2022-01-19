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
<head>
    <link rel="stylesheet" href="/addingContent.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
    <title>My Relook</title>

</head>
<body>

</body>
<html>
<h1 id="mainTxt" draggable="true">
    Relook
</h1>
<ul id="lr" class="RL">
</ul>

<h1 id="RegBorder">
    <p class="MT">Add your information here </p>
    <form  action="/addContentServlet" method="post">
        <label class="title" for="title">Title</label><br>
        <textarea class="tTitle" id="title" name="title" placeholder="Title" draggable="true"  required></textarea><br><br>
        <label class="text" for="text">Text</label><br>
        <textarea class="textB" id="text" name="MainText" placeholder="Text" draggable="false"  required></textarea><br><br>

        <input class="add" type="submit" value="ADD CONTENT"><br>
    </form>
</h1>
</html>
