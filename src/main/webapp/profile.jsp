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
  <link rel="stylesheet" href="/profile.css">
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
      <li class="menu-item" onclick="location.href='profile.jsp'" ><i class="fa fa-user" ></i>Profile</li>
      <%
        HashMap<Integer, String> title2 = (HashMap<Integer, String>) session.getAttribute("titles");
        Iterator<Integer> keySet2 = title2.keySet().iterator();
        String tit;
        while(keySet2.hasNext()){
          int key1 = keySet2.next();
          tit = title2.get(key1);
      %>
      <li class="menu-item" onclick="location.href='readyToViewContentServlet?id=<%=key1%>'"><i class="fa fa-minus"></i><%=tit%></li>
      <%
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
  <%
  SQLJavaClass sqlJavaClass = new SQLJavaClass();
    String st = (String) session.getAttribute("st");
    String email = (String) session.getAttribute("email");
    String[] firstLastnames = sqlJavaClass.givePesrsonFirstLastName(session);
  %>
  <div id="profIcon">
  <div class="fa fa-user-circle" ></div><br>
    <p class="pPosition">
      Position: <br> <%=st%>
    </p>
    <p class="pFirstName">
      First name: <br> <%=firstLastnames[0]%>
    </p>
    <p class="pLastName">
      Last name: <br> <%=firstLastnames[1]%>
    </p>
    <p class="pEmail">
      Email: <br> <%=email%>
    </p>
    <p style="font-size: 20px">
      <a class="forgottenPass" href="forgotenPassword1.jsp">Click here, if you want to change your password.</a>
    </p>

  </div>

</body>
</html>
