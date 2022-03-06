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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/makingTest.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Fira+Sans:wght@400&display=swap" rel="stylesheet">
    <title>My Relook</title>

</head>
<script>
    function my_onkeydown_handler( event ) {
        switch (event.keyCode) {
            case 116 : // 'F5'
                event.preventDefault();
                event.keyCode = 0;
                window.status = "F5 disabled";
                break;
        }
    }
    document.addEventListener("keydown", my_onkeydown_handler);
</script>
<body>
<div class="main-menu">
    <ul>
        <section class="home">
            <li class="menu-item" onclick="location.href='relookMain.jsp'"><i class="fa fa-home"></i>Home</li>
            <li class="menu-item" onclick="location.href='profile.jsp'" ><i class="fa fa-user" ></i>Profile</li>
            <%
                HashMap<Integer, String> title2 = (HashMap<Integer, String>) session.getAttribute("titles");
                Iterator<Integer> keySet2 = title2.keySet().iterator();
                String tit;
                int counter = 0;
                while(keySet2.hasNext()){
                    if(counter >= 11){
                        break;
                    }
                    int key1 = keySet2.next();
                    tit = title2.get(key1);
            %>
            <li class="menu-item" onclick="location.href='readyToViewContentServlet?id=<%=key1%>'"><i class="fa fa-minus"></i><%=tit%></li>
            <%
                    counter++;
                }
            %>
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
            <a href="ServForQuestionDelete?idForQuestion=<%=key%>"><button class="fa fa-trash-o" type="button" id="deleteButton" name="delteButton"></button></a>
            <a href="ServForQuestionEdit?idForQuestion=<%=key%>"><button type="button" id="questionButton" name="addContent"><%=a%></button></a>
                <br><br>
            <%
                }
            %>
        </p>
    </h1>
</div>
</body>
</html>
