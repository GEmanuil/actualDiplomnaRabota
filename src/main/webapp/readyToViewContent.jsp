<%--
  Created by IntelliJ IDEA.
  User: em4o_
  Date: 27.12.2021 г.
  Time: 11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="johnatanasov.diplomawork.SQLJavaClass" %>
<%@ page import="mail.*" %>
<head>
    <link rel="stylesheet" href="/addingContent.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
    <title>My Relook</title>
<body>

</body>
<html>
<h1 id="mainTxt" draggable="true">

</head>
    Relook
</h1>
<ul id="lr" class="RL">
</ul>
<h1 id="RegBorder">
    <p class="MT"></p>
    <p class="MT"> <%
        SQLJavaClass sqlJavaClass = new SQLJavaClass();
        String title = sqlJavaClass.giveLastContentTitle(session);
    %>  <%= title %> </p>

</h1>
<h2 id="mainTxext">
    <%
        String text = sqlJavaClass.giveLastContentText(session);
    %>
    <%= text %>
</h2>
</html>
