<%--
  Created by IntelliJ IDEA.
  User: em4o_
  Date: 27.12.2021 ã.
  Time: 11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="johnatanasov.diplomawork.SQLJavaClass" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Iterator" %>
<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<%@ page import="johnatanasov.diplomawork.*"  %>
<%@ page import="mail.*"  %>
<html>
<head>
    <link rel="stylesheet" href="/addingContent.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
    <title>My Relook</title>

</head>
<body>

</body>

<h1 id="mainTxt" draggable="true">
    Relook
</h1>
<a href="makingTest2.jsp"><button type="button" id="addButton" name="addContent">ADD OPENED QUESTION</button></a>
<a href="makingTest3.jsp"><button type="button" id="addButton2" name="addContent">ADD CLOSED QUESTION</button></a>
<ul id="lr" class="RL">
</ul>

<h1 id="makingTestText">

    <p>
        <%
            SQLJavaClass sqlJavaClass = new SQLJavaClass();
            HashMap<Integer, String> title = sqlJavaClass.giveTestTitles(session);
            String a;
            Iterator<Integer> keySet = title.keySet().iterator();
            while(keySet.hasNext()){
                int key = keySet.next();
                a = title.get(key);
        %>
        <a href="ServForQuestionEdit?idForQuestion=<%=key%>"><button type="button" id="questionButton" name="addContent"><%=a%></button></a><br><br>
        <%
            }
        %>
    </p>
</h1>
</html>
