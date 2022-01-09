<%@ page import="johnatanasov.diplomawork.SQLJavaClass" %><%--
  Created by IntelliJ IDEA.
  User: em4o_
  Date: 15.12.2021 г.
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Testinggg :)</title>
</head>
<body>
    <h1>
        <p>:)</p>
        <hr>
       <p>Registration name: <%= (String) request.getAttribute("firstname")%> <%= (String) request.getAttribute("lastname")%> </p>
        <p> ${error}</p>


    </h1>
<h2>
    <p>
    <%
        SQLJavaClass sqlJavaClass = new SQLJavaClass();
        String tit;
        for(int i = 0; i < 3; i++){
            a = arr[i];
    %>  <%=a%>
        <%
            }
        %>
     </p>

</h2>
</body>
</html>
