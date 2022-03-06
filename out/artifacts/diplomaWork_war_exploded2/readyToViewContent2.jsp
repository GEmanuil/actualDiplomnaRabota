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
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/readyToViewContent2.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Fira+Sans:wght@400&display=swap" rel="stylesheet">
    <title>My Relook</title>

</head>


<script type="text/javascript">
    function preback() {window.history.forward();}
    setTimeout("preback()", 0);
    window.onunload = function () {null};
</script>
<body>
<%
    String st = (String) session.getAttribute("st");
    if(Objects.equals(st, "teacher")){

%>
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
<%
    }
%>
<div class="mainDiv">
<h1 id="mainTxt" draggable="true">
    Relook
</h1>
<%
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
<div class="mainTextDiv">
<pre id="mainText">
    <%
        String text = session.getAttribute("text").toString();
    %>
    <%= text %>
</pre></div>
    <hr/>
<%

if(Objects.equals(st, "teacher")){

%>
<style>
    #overlay {
        position: fixed;
        display: none;
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: rgba(0,0,0,0.5);
        z-index: 2;
        cursor: pointer;
    }

</style>

<div id="overlay" onclick="off()">

    <div class="form-popup" id="myForm">
        <div class="form-container">
            <h1>Are you sure you want to delete this content!!!</h1>

          <a href="${pageContext.request.contextPath}/deleteContentServlet"><button type="submit" class="btn" >Yes</button></a>
            <button type="button" class="btn cancel" onclick="off()"> Close</button>
        </div>
    </div>

</div>




<script>
    function on() {
        document.getElementById("overlay").style.display = "block";
        document.getElementById("myForm").style.display = "block";
    }

    function off() {
        document.getElementById("overlay").style.display = "none";
        document.getElementById("myForm").style.display = "none";
    }
</script>

    <%
        if(sqlJavaClass.checkForHasTest(session)){
    %>


        <form draggable="true" action="makingTest.jsp">
        <input type="submit" id="contentTest" name="contentTest" value="Edit test">
        </form>
        <input type="submit" class="deleteContent" name="deleteContent" value="Delete" onclick="on()">
        <p>People who made the test: </p>
    <% }

    else{
    %>
        <form draggable="true" action="makingTest.jsp">
            <input type="submit" id="contentTest2" name="contentTest" value="Create a test">
        </form>
        <input type="submit" class="deleteContent" name="deleteContent" value="Delete" onclick="on()">
        <% }
            HashMap<Integer, String> idNamesOftestMakers = sqlJavaClass.giveNamesOfTestMakers(session);

            String a;
            Iterator<Integer> keySet = idNamesOftestMakers.keySet().iterator();
            while(keySet.hasNext()){
                int key = keySet.next();
                a = idNamesOftestMakers.get(key);
        %>
<a href="${pageContext.request.contextPath}/testResultServlet?id=<%=key%>"><button type="button" id="addButton1" name="addContent"><%=a%></button></a>
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
    <div class="main-menu">
        <ul>
            <section class="home">
                <li class="menu-item" onclick="location.href='StRelookMain.jsp'"><i class="fa fa-home"></i>Home</li>
                <li class="menu-item" onclick="location.href='profile.jsp'" ><i class="fa fa-user" ></i>Profile</li>
                <li class="menu-item" onclick="location.href='logout.jsp'" ><i class="fa fa-sign-out"></i>Log Out</li>
            </section>
        </ul>
    </div>
<form draggable="true" action="${pageContext.request.contextPath}/testResultServlet" method="get">
    <input type="submit" id="addButton2" name="makeingTest2" value="See results">

<%
  }
}
%>
    </div>
</body>
</html>
