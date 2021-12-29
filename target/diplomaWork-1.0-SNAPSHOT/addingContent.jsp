<%--
  Created by IntelliJ IDEA.
  User: em4o_
  Date: 27.12.2021 г.
  Time: 11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: em4o_
  Date: 14.12.2021 г.
  Time: 18:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <link rel="stylesheet" href="/addingContent.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
    <title>My Relook</title>

</head>
<body>

</body>
<html>
<h1 id="mainTxt">
    Relook
</h1>
<ul id="lr" class="RL">
</ul>
<h1 id="RegBorder">
    <p class="MT">Add your information here</p>
    <form  action="/regServ" method="get">
        <label class="title" for="title">Title</label><br>
        <input class="tTitle" type="text" id="title" name="title" required><br>
        <label class="text" for="text">Text</label><br>
        <textarea class="textB" id="text" name="MainText" placeholder="Text" required></textarea><br><br>

        <input class="add" type="submit" value="ADD CONTENT"><br>
    </form>
</h1>
</html>
