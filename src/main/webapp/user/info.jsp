<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Info</title>
</head>
<body>
    <h3>Info about user</h3>
    <p>Login: <%=session.getAttribute("username")%>
    <br>isAuthorized: <%=session.getAttribute("isAuthorized")%>
    <%if ((boolean) session.getAttribute("isAuthorized"))
        session.setAttribute("isAuthorized", false); %>
</body>
</html>
