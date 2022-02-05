<%@ page import="johnatanasov.diplomawork.SQLJavaClass" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Iterator" %>
<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>

<head>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
    <link rel="stylesheet" href="/relookMain.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">--%>
<%--    <link href="https://fonts.googleapis.com/css2?family=Fira+Sans:wght@400&display=swap" rel="stylesheet">--%>
    <title>My Relook</title>

</head>
<body>

<%--<div class="main-menu">--%>
<%--    <ul>--%>
<%--        <section class="home">--%>
<%--            <li class="menu-item"><i class="fa fa-home"></i>Home</li>--%>
<%--            <li class="menu-item"><i class="fa fa-bell"></i>Notifications</li>--%>
<%--            <li class="menu-item"><i class="fa fa-paper-plane"></i>Messages</li>--%>
<%--        </section>--%>
<%--        <section class="links">--%>
<%--            <li class="menu-item"><i class="fa fa-gamepad"></i>Gaming</li>--%>
<%--            <li class="menu-item"><i class="fa fa-code"></i>Programming</li>--%>
<%--            <li class="menu-item"><i class="fa fa-motorcycle"></i>Travel</li>--%>
<%--            <li class="menu-item"><i class="fa fa-gears"></i>Technology</li>--%>
<%--            <li class="menu-item"><i class="fa fa-hashtag"></i>Mathematics</li>--%>
<%--            <li class="menu-item"><i class="fa fa-wrench"></i>Physics</li>--%>
<%--            <li class="menu-item"><i class="fa fa-globe"></i>Web Development</li>--%>
<%--            <li class="menu-item"><i class="fa fa-android"></i>Android Development</li>--%>
<%--        </section>--%>
<%--        <section class="social">--%>
<%--            <li class="menu-item"><i class="fa fa-facebook"></i>Facebook</li>--%>
<%--            <li class="menu-item"><i class="fa fa-twitter"></i>Twitter</li>--%>
<%--            <li class="menu-item"><i class="fa fa-github"></i>Github</li>--%>
<%--        </section>--%>
<%--    </ul>--%>
<%--</div>--%>
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        if(session.getAttribute("email")==null && session.getAttribute("password")==null){
            response.sendRedirect("login.jsp");
        }
    %>
</body>
<html>
<h1 id="mainTxt" draggable="true">
    Relook
</h1>
<ul id="lr" class="RL">
    <li class="RL M H"><a href="relookMain.jsp">Home</a></li>
    <li class="RL M L"><a href="logout.jsp">Log Out</a></li>
    <div style="padding-bottom:2000px"></div>
</ul>

<a href="addingContent.jsp"><button type="button" id="addButton" name="addContent">+</button></a>
<p>
    <%
        SQLJavaClass sqlJavaClass = new SQLJavaClass();
        HashMap<Integer, String> title = sqlJavaClass.giveContentTitle(session);
        String a;
            Iterator<Integer> keySet = title.keySet().iterator();
            while(keySet.hasNext()){
                int key = keySet.next();
                a = title.get(key);
    %>
        <a href="readyToViewContentServlet?id=<%=key%>"><button type="button" id="addButton1" name="addContent"><%=a%></button></a>
    <%
        }
    %>
</p>

</html>
