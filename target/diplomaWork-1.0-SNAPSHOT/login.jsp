<%--
  Created by IntelliJ IDEA.
  User: em4o_
  Date: 19.12.2021 ã.
  Time: 12:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="login.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Fira+Sans:wght@400&display=swap" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <title>My Relook</title>

</head>
<body>
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        %>


<h1 id="mainTxt" draggable="true">
    Relook
</h1>
<ul id="lr" class="RL">
    <li class="RL M L"><a href="login.jsp">Log In</a></li>
    <li class="RL M R"><a href="rEpTest.jsp">Register</a></li>
    <div style="padding-bottom:2000px"></div>
</ul>
<h1 id="RegBorder">
    <p class="MT">Login to Relook</p>
    <form  action="/logServe" method="post">
        <label class="Register E" for="email"></label>
        <div class="ea">
            <input class="ea" type="email" id="email" name="email" placeholder="Email address" required>
        </div><br>
        <label class="Register P" for="password"></label>
        <div class="pa">
            <input class="pa" type="password" id="password" name="password" placeholder="Password" required>
        </div><br>
        <hr>
        <input class="Register S" type="submit" value="Login"><br>
    </form>
    <p><a class="forgottenPass" href="forgotenPassword1.jsp">Click here, if you forgot your password.</a></p>
</h1>

    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="footer-col">
                    <h4>Development</h4>
                    <ul>
                        <li><a href="#">about</a></li>
                        <li><a href="#">functionality</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h4>get help</h4>
                    <ul>
                        <li><a href="https://mail.google.com/">Gmail</a></li>
                        <li><a href="https://discord.com/">Discord</a></li>
                    </ul>
                </div>
                <%--            <div class="footer-col">--%>
                <%--                <h4>online shop</h4>--%>
                <%--                <ul>--%>
                <%--                    <li><a href="#">watch</a></li>--%>
                <%--                    <li><a href="#">bag</a></li>--%>
                <%--                    <li><a href="#">shoes</a></li>--%>
                <%--                    <li><a href="#">dress</a></li>--%>
                <%--                </ul>--%>
                <%--            </div>--%>
                <div class="footer-col">
                    <h4>follow</h4>
                    <div class="social-links">
                        <a href="https://www.facebook.com/"><i class="fab fa-facebook-f"></i></a>
                        <a href="https://twitter.com/"><i class="fab fa-twitter"></i></a>
                        <a href="https://www.instagram.com/"><i class="fab fa-instagram"></i></a>
                        <a href="https://www.linkedin.com/"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>