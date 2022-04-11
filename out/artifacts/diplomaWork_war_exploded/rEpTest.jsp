<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="css/register.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Fira+Sans:wght@400&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <title>My Relook</title>

</head>
<body>

<h1 id="mainTxt" draggable="true">
    Relook
</h1>
<ul id="lr" class="RL">
    <li class="RL M L"><a href="index.jsp">Log In</a></li>
    <li class="RL M R"><a href="rEpTest.jsp">Register</a></li>
    <div style="padding-bottom:2000px"></div>
</ul>
<%
System.out.println("someone just clicked !!!!");
%>
<div id="RegBorder">
    <h1>
        <p class="MT">Start using Relook</p>
        <form action="${pageContext.request.contextPath}/regServ" method="post">
            <label class="Register FN" for="firstname"></label>
            <div class="fa">
                <input class="fa" type="text" id="firstname" name="firstname" placeholder="First name" required>
            </div>
            <label class="Register LN" for="lastname"></label><br><br>
            <div class="la">
                <input class="la" type="text" id="lastname" name="lastname" placeholder="Last name" required>
            </div>
            <label class="Register E" for="email"></label><br>
            <div class="ea">
                <input class="ea" type="email" id="email" name="email" placeholder="Email address" required>
            </div>
            <label class="Register P" for="password"></label><br>
            <div class="pa">
                <input class="pa" type="password" id="password" name="password" placeholder="Password" required>
            </div>
            <label class="Register RP" for="repeatPassword"></label><br>
            <div class="rpa">
                <input class="rpa" type="password" id="repeatPassword" name="repeatPassword" placeholder="Repeat Password" required>
            </div><br><hr>
            <p id="RegisterAs">Register as:</p>

            <input checked class="CheckBox" type="radio" id="checkbox" name="checkbox" value="student">
            <label class="CheckBox" for="checkbox">student</label>
            <input class="CheckBox" type="radio" id="checkbox2" name="checkbox" value="teacher">
            <label class="CheckBox" for="checkbox2">teacher</label> <br><br>
            <input class="Register S" type="submit" value="Register"><br>
        </form>
    </h1>
</div>
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
