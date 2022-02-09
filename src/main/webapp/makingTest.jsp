<%--
  Created by IntelliJ IDEA.
  User: em4o_
  Date: 27.12.2021 �.
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
    <link rel="stylesheet" href="/makingTest.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Fira+Sans:wght@400&display=swap" rel="stylesheet">
    <title>My Relook</title>

</head>
<body>
<div class="main-menu">
    <ul>
        <section class="home">
            <li class="menu-item" onclick="location.href='relookMain.jsp'"><i class="fa fa-home"></i>Home</li>
            <li class="menu-item" onclick="location.href='logout.jsp'" ><i class="fa fa-sign-out"></i>Log Out</li>
        </section>
    </ul>
</div>
<div class="mainDiv">
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
</div>
</body>
</html>
