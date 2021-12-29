<%--
  Created by IntelliJ IDEA.
  User: em4o_
  Date: 14.12.2021 г.
  Time: 18:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <link rel="stylesheet" href="/relookMain.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
    <title>My Relook</title>

</head>
<body>
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        if(session.getAttribute("email")==null && session.getAttribute("password")==null){
            response.sendRedirect("login.jsp");
        }
    %>
</body>
<html>
<h1 id="mainTxt">
    Relook
</h1>
<ul id="lr" class="RL">
    <li class="RL M H"><a href="relookMain.jsp">Home</a></li>
    <li class="RL M L"><a href="logout.jsp">Log Out</a></li>
    <div style="padding-bottom:2000px"></div>
</ul>

<a href="addingContent.jsp"><button type="button" id="addButton" name="addContent">+</button></a>

</html>
