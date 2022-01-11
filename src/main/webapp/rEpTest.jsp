<%--
  Created by IntelliJ IDEA.
  User: em4o_
  Date: 14.12.2021 г.
  Time: 18:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <link rel="stylesheet" href="register.css">
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
    <li class="RL M L"><a href="login.jsp">Log In</a></li>
    <li class="RL M R"><a href="rEpTest.jsp">Register</a></li>
    <div style="padding-bottom:2000px"></div>
</ul>
<%
System.out.println("someone just clicked !!!!");
%>
<h1 id="RegBorder">
    <p class="MT">Start using Relook</p>
    <form  action="/regServ" method="post">
        <label class="Register FN" for="firstname">First name:</label><br>
        <input class="Register FN B" type="text" id="firstname" name="firstname" required><br><br>
        <label class="Register LN" for="lastname">Last name:</label><br>
        <input class="Register LN B" type="text" id="lastname" name="lastname" required><br><br>
        <label class="Register E" for="email">Email address:</label><br>
        <input class="Register E B" type="email" id="email" name="email" required><br><br>
        <label class="Register P" for="password">Password:</label><br>
        <input class="Register P B" type="password" id="password" name="password" required><br><br>

        <label class="Register RP" for="repeatPassword">Repeat Password:</label><br>
        <input class="Register RP B" type="password" id="repeatPassword" name="repeatPassword" required><br><br>

        <input checked class="CheckBox" type="radio" id="checkbox" name="checkbox" value="student">
        <label for="checkbox">You are a student</label> <br>

        <input class="CheckBox2" type="radio" id="checkbox2" name="checkbox" value="teacher">
        <label for="checkbox2">You are a teacher</label> <br>

        <input class="Register S" type="submit" value="Register"><br>
   </form>
</h1>
</html>
