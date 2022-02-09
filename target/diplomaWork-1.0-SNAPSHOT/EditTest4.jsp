<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<%@ page import="johnatanasov.diplomawork.*"  %>
<%@ page import="mail.*"  %>
<html>
<head>
    <link rel="stylesheet" href="/EditTest4.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Fira+Sans:wght@400&display=swap" rel="stylesheet">


    <title>My Relook</title>

</head>
<body>
<div class="mainDiv">

<h1 id="mainTxt" draggable="true">
    Relook
</h1>
    <div class="main-menu">
        <ul>
            <section class="home">
                <li class="menu-item" onclick="location.href='relookMain.jsp'"><i class="fa fa-home"></i>Home</li>
                <li class="menu-item" onclick="location.href='logout.jsp'" ><i class="fa fa-sign-out"></i>Log Out</li>
            </section>
        </ul>
    </div>

    <form  action="/servForTestUpdate" method="post">
        <label class="Register FN" for="Question">Question: </label><br>
        <input class="Register FN B" type="text" id="Question" name="Question" value="<%=request.getAttribute("title")%>" required><br><br>
        <label class="Register LN" for="answer">answer: </label><br>
        <input class="Register LN B" type="text" id="answer" name="answer" value="<%=request.getAttribute("answer")%>" required><br><br>
        <input class="Register S" type="submit" value="UPDATE"><br>
    </form>
</div>
</body>
</html>
