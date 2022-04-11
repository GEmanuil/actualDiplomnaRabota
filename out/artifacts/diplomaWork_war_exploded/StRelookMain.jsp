<%@ page import="johnatanasov.diplomawork.SQLJavaClass" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Iterator" %>
<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>

<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/relookMain.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Fira+Sans:wght@400&display=swap" rel="stylesheet">
    <title>My Relook</title>

</head>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    if(session.getAttribute("email")==null && session.getAttribute("password")==null){
        response.sendRedirect("index.jsp");
    }
%>
<body>
<div class="main-menu">
    <ul>
        <section class="home">
            <li class="menu-item" onclick="location.href='StRelookMain.jsp'"><i class="fa fa-home"></i>Home</li>
            <li class="menu-item" onclick="location.href='profile.jsp'" ><i class="fa fa-user" ></i>Profile</li>
            <li class="menu-item" onclick="location.href='logout.jsp'" ><i class="fa fa-sign-out"></i>Log Out</li>
        </section>
    </ul>
</div>
<div class="mainDiv">
<h1 id="mainTxt" draggable="true">
    Relook
</h1>
<ul id="lr" class="RL">
    <li class="RL M H"><a href="StRelookMain.jsp">Home</a></li>
    <li class="RL M L"><a href="logout.jsp">Log Out</a></li>
    <div style="padding-bottom:2000px"></div>
</ul>
<div class="codeSubmit">
    <p style="color: #100e0e">
        You should take a code from your teacher to have access to the content.
    </p>
<form  action="${pageContext.request.contextPath}/codeEnterServlet" method="post">
    <label id="codeTyped" for="code"></label><br>
    <input class="tTitle" type="text" id="code" name="code" placeholder="code" required><br><br>
    <input class="submitButt" type="submit" value="Submit"><br>
</form>
</div>
</div>
</body>
</html>
