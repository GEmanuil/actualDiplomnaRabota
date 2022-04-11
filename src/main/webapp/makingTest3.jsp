<%--
  Created by IntelliJ IDEA.
  User: em4o_
  Date: 27.12.2021 ã.
  Time: 11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<%@ page import="johnatanasov.diplomawork.*"  %>
<%@ page import="mail.*"  %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/EditTest5.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Fira+Sans:wght@400&display=swap" rel="stylesheet">
    <title>My Relook</title>

</head>
<body>


<script type="text/javascript">
    function preback() {window.history.forward();}
    setTimeout("preback()", 0);
    window.onunload = function () {null};
</script>
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

<ul id="lr" class="RL">
</ul>

<h1 id="makingTestText">
    <div class="boxy">
        <form  action="${pageContext.request.contextPath}/servForTest" method="post">
            <label class="QuestionText" for="Question">Question: </label><br><hr>
            <textarea class="Register FN B" type="text" id="Question" name="Question" required></textarea><br><br>
            Answers:<br><hr>
            <label class="tt" for="answerA">A</label>
            <textarea class="Register LN B" type="text" id="answerA" name="answerA" required></textarea>
            <label><input checked id="1" type="radio" name="checkBox" value="A"></label><br><br>
            <label class="tt" for="answerB">B</label>
            <textarea class="Register LN B" type="text" id="answerB" name="answerB" required></textarea>
            <label><input  id="2" type="radio" name="checkBox" value="B"></label><br><br>
            <label class="tt" for="answerC">C</label>
            <textarea class="Register LN B" type="text" id="answerC" name="answerC" required></textarea>
            <label><input  id="3" type="radio" name="checkBox" value="C"></label><br><br>
            <label class="tt" for="answerD">D</label>
            <textarea class="Register LN B" type="text" id="answerD" name="answerD" required></textarea>
            <label><input  id="4" type="radio" name="checkBox" value="D"></label><br><br>
            <input class="UPDATEBUTT" type="submit" value="ADD"><br>
        </form>
    </div>

</h1>
</div>
</body>
</html>
