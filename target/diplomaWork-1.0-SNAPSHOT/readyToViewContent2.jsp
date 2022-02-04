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
<%@ page import="java.util.Objects" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Iterator" %>
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
<%
    String st = (String) session.getAttribute("st");
    String code = (String) session.getAttribute("code");

    if(Objects.equals(st, "teacher")){%>
<form draggable="true" action="editContent.jsp">
    <input type="submit" id="editButton" name="editButton" value="EDIT">

</form>
<h2>
    Share with this code: <%=code%>
</h2>
<%} %>
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
</h2><hr/>
<%

    if(Objects.equals(st, "teacher")){

%>

    <%
        if(sqlJavaClass.checkForHasTest(session)){
    %>


        <form draggable="true" action="makingTest.jsp">
        <input type="submit" id="contentTest" name="contentTest" value="Edit test">
        </form>
        <p>People who made the test: </p>
    <% }

    else{
    %>
        <form draggable="true" action="makingTest.jsp">
            <input type="submit" id="contentTest2" name="contentTest" value="Create a test">
        </form>

        <% }
            HashMap<Integer, String> idNamesOftestMakers = sqlJavaClass.giveNamesOfTestMakers(session);

            String a;
            Iterator<Integer> keySet = idNamesOftestMakers.keySet().iterator();
            while(keySet.hasNext()){
                int key = keySet.next();
                a = idNamesOftestMakers.get(key);
        %>
<a href="/testResultServlet?id=<%=key%>"><button type="button" id="addButton1" name="addContent"><%=a%></button></a>
<%
    }

  }
else if (Objects.equals(st, "student")){
    //session.setAttribute("id", );
  if(!sqlJavaClass.checkForMadeTest(session)){

  %>
      <form draggable="true" action="testAction.jsp">
    <input type="submit" id="addButton" name="makeingTest" value="Make the test">
</form>
  <% }
  else{%>
<form draggable="true" action="/testResultServlet" method="get">
    <input type="submit" id="addButton2" name="makeingTest2" value="See results">

<%
  }
}
%>

</html>
