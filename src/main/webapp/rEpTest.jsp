<%--
  Created by IntelliJ IDEA.
  User: em4o_
  Date: 14.12.2021 ã.
  Time: 18:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="register.css">
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
    <li class="RL M L"><a href="login.jsp">Log In</a></li>
    <li class="RL M R"><a href="rEpTest.jsp">Register</a></li>
    <div style="padding-bottom:2000px"></div>
</ul>
<%
System.out.println("someone just clicked !!!!");
%>
<h1 id="RegBorder">
    <p class="MT">Start using Relook</p>
    <form  action="/regServ" method="post">
        <label class="Register FN" for="firstname"></label>
        <input class="Register FN B" type="text" id="firstname" name="firstname" placeholder="First name" required><br><br>
        <label class="Register LN" for="lastname"></label>
        <input class="Register LN B" type="text" id="lastname" name="lastname" placeholder="Last name" required><br><br>
        <label class="Register E" for="email"></label>
        <input class="Register E B" type="email" id="email" name="email" placeholder="Email address" required><br><br>
        <label class="Register P" for="password"></label>
        <input class="Register P B" type="password" id="password" name="password" placeholder="Password" required><br><br>

        <label class="Register RP" for="repeatPassword"></label>
        <input class="Register RP B" type="password" id="repeatPassword" name="repeatPassword" placeholder="Repeat Password" required><br><br>

        <input checked class="CheckBox" type="radio" id="checkbox" name="checkbox" value="student">
        <label for="checkbox">You are a student</label> <br>

        <input class="CheckBox2" type="radio" id="checkbox2" name="checkbox" value="teacher">
        <label for="checkbox2">You are a teacher</label> <br>

        <input class="Register S" type="submit" value="Register"><br>
   </form>
</h1>
<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="footer-col">
                <h4>company</h4>
                <ul>
                    <li><a href="#">about us</a></li>
                    <li><a href="#">our services</a></li>
                    <li><a href="#">privacy policy</a></li>
                    <li><a href="#">affiliate program</a></li>
                </ul>
            </div>
            <div class="footer-col">
                <h4>get help</h4>
                <ul>
                    <li><a href="#">FAQ</a></li>
                    <li><a href="#">shipping</a></li>
                    <li><a href="#">returns</a></li>
                    <li><a href="#">order status</a></li>
                    <li><a href="#">payment options</a></li>
                </ul>
            </div>
            <div class="footer-col">
                <h4>online shop</h4>
                <ul>
                    <li><a href="#">watch</a></li>
                    <li><a href="#">bag</a></li>
                    <li><a href="#">shoes</a></li>
                    <li><a href="#">dress</a></li>
                </ul>
            </div>
            <div class="footer-col">
                <h4>follow us</h4>
                <div class="social-links">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
        </div>
    </div>
</footer>
</body>
</html>
