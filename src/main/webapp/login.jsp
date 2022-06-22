<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.apache.commons.text.*" %>
<%  String username = "";

    if (request.getParameter("username") != null
        && request.getParameter("password") != null) {//проверка на нулл, введены ли данные для входа вообще
        username = request.getParameter("username");
    if(request.getParameter("username").equals("<h1>hello</h1>")
            && request.getParameter("password").equals("1234")){
        //проверка совпадают ли данные которые мы задали с теми, которые ввел юзер
        session.setAttribute("username", StringEscapeUtils.escapeHtml4(request.getParameter("username")));
        //обработка значений благодаря StringEscapeUtils.escapeHtml4 воспринимаються как строка, а не как код
        session.setAttribute("isAuthorized", true);//отмечаем, что пользователь авторизирован
        response.sendRedirect("user/info.jsp");//перенаправление на страницу, где показаны данные юзера через фильтр
        return;
    }
    }%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
<form id ="login" method="post">
    <div>
        <h3>Enter your login and password: </h3>
        <label for="username">Login: </label>
        <input id="username" type="text" size="20" name="username" value="<%=username%>" required>
        <br><br>
        <label for="userPassword">Password:</label>
        <input id="userPassword" type="password" size="20" name="password" required>
        <p><input type="submit" value="Submit"></p>
    </div>
</form>
</body>
</html>