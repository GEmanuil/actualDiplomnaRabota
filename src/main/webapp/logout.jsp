<%--
  Created by IntelliJ IDEA.
  User: em4o_
  Date: 29.12.2021 г.
  Time: 11:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        HttpSession ses = request.getSession();
        ses.removeAttribute("password");
        ses.removeAttribute("email");
        ses.invalidate();
        response.sendRedirect("login.jsp");
    %>
</body>
</html>
