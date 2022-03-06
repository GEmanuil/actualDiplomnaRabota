<%@ page import="johnatanasov.diplomawork.SQLJavaClass" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Iterator" %>
<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<%@ page import="johnatanasov.diplomawork.*"  %>
<%@ page import="mail.*"  %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/addingContent.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
    <title>My Relook</title>

</head>
<body>

</body>

<h1 id="mainTxt" draggable="true">
    Relook
</h1>

<h1 id="makingTestText">

    <p id="textForMakeTestButton">
        <%
            SQLJavaClass sqlJavaClass = new SQLJavaClass();
            String code = session.getAttribute("code").toString();
            int numberOfQuestions = sqlJavaClass.giveNumberOfQuestions(code);
            ArrayList<Integer> ids = sqlJavaClass.giveQuestionsIDs(code);
            session.setAttribute("idsForQuestions", ids);
        %>
        The test has <%=numberOfQuestions%> questions. If you feel prepared click the start button to generate the test!!!
        
    </p>
    <form action="${pageContext.request.contextPath}/testAction" method="get">
        <input type="submit" value="START" id="addButton">
    </form>

</h1>
</html>
