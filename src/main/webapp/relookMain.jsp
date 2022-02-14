<%@ page import="johnatanasov.diplomawork.SQLJavaClass" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Iterator" %>
<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/relookMain.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Fira+Sans:wght@400&display=swap" rel="stylesheet">
    <title>My Relook</title>

</head>

<script type="text/javascript">
    window.history.forward();
    function noBack() {
        window.history.forward();
    }
</script>
<body>
<div id="divMain">



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
        session.setAttribute("titles", title);
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

</div>
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
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    if(session.getAttribute("email")==null && session.getAttribute("password")==null){
        response.sendRedirect("login.jsp");
    }
%>
</body>
</html>
