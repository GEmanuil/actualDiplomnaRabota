<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello Emanuil :>)!" %>
</h1>
<br/>
<a href="${pageContext.request.contextPath}/hello">Hello Servlet</a>
<p></p>
<a href="${pageContext.request.contextPath}/test.jsp">testing</a>
<p></p>
<a href="rEpTest.jsp">Reelook register page</a>
</body>
</html>