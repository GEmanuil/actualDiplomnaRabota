<%--
  Created by IntelliJ IDEA.
  User: em4o_
  Date: 19.12.2021 �.
  Time: 12:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="forgotenPassword1.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
    <title>My Relook</title>

</head>
<body>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>


<h1 id="mainTxt" draggable="true">
    Relook
</h1>
<ul id="lr" class="RL">
    <li class="RL M L"><a href="login.jsp">Log In</a></li>
    <li class="RL M R"><a href="rEpTest.jsp">Register</a></li>
    <div style="padding-bottom:2000px"></div>
</ul>
<h1 id="RegBorder">
    <p class="MT">Enter your email.</p>
    <form  action="${pageContext.request.contextPath}/forgottenPassServlet1" method="post">
        <label class="Register E" for="email">Email address:</label><br>
        <input class="Register E B" type="email" id="email" name="email" required><br><br>

        <input class="Register S" type="submit" value="Submit"><br>
    </form>
</h1>
</body>
</html>