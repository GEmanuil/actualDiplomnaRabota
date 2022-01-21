<%--
  Created by IntelliJ IDEA.
  User: em4o_
  Date: 27.12.2021 ã.
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

</head>
<body>

</body>
<html>
<h1 id="mainTxt" draggable="true">
    Relook
</h1>
<form draggable="true" action="editContent.jsp">
    <input type="submit" id="editButton" name="editButton" value="EDIT">

</form>
<%
    String code = (String) session.getAttribute("code");
%>
<h2>
    Share with this code: <%=code%>
</h2>
<h1 id="RegBorder">
    <p class="MT"></p>
    <p class="MT"> <%
        SQLJavaClass sqlJavaClass = new SQLJavaClass();
        String title = session.getAttribute("title").toString();
    %>  <%= title %> </p>

</h1>
<h2 id="mainTxext">
    <%
        String text = session.getAttribute("text").toString();
    %>
    <%= text %>
</h2>
<form draggable="true" action="makingTest.jsp">
    <input type="submit" id="contentTest" name="contentTest" value="Make a test">

</form>
</html>
