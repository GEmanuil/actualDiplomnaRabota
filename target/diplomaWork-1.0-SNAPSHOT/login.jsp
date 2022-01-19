<%--
  Created by IntelliJ IDEA.
  User: em4o_
  Date: 19.12.2021 ã.
  Time: 12:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<head>
    <link rel="stylesheet" href="login.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
    <title>My Relook</title>

</head>
<body>
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        %>
</body>
<html>
<h1 id="mainTxt" draggable="true">
    Relook
</h1>
<ul id="lr" class="RL">
    <li class="RL M L"><a href="login.jsp">Log In</a></li>
    <li class="RL M R"><a href="rEpTest.jsp">Register</a></li>
    <div style="padding-bottom:2000px"></div>
</ul>
<h1 id="RegBorder">
    <p class="MT">Login to Relook</p>
    <form  action="/logServe" method="post">
        <label class="Register E" for="email">Email address:</label><br>
        <input class="Register E B" type="email" id="email" name="email" required><br><br>
        <label class="Register P" for="password">Password:</label><br>
        <input class="Register P B" type="password" id="password" name="password" required><br><br>

        <input class="Register S" type="submit" value="Login"><br>
    </form>
    <p><a href="forgotenPassword1.jsp">Click here, if you forgot your password!!!</a></p>
</html>