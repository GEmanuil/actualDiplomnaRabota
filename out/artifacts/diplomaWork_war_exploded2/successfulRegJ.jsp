<%--
  Created by IntelliJ IDEA.
  User: em4o_
  Date: 19.12.2021 �.
  Time: 9:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
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
    <li class="RL M R"><a href="register.html">Register</a></li>
    <div style="padding-bottom:2000px"></div>
</ul>
<h1 id="RegBorder"> One more step. Please enter the verification code which was sent to you.
    <br><br>
    <form   action="${pageContext.request.contextPath}/regForCodeServlet" method="post">
        <label><input id="tb1" type="text" name="code"><br><br><input type="submit"></label>
    </form></h1>
</html>
