<%--
  Created by IntelliJ IDEA.
  User: Louis
  Date: 2019/1/1
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>后台管理系统登录登陆界面</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">
    <link href="admin/public/css/base.css" rel="stylesheet" type="text/css">
    <link href="admin/public/css/login.css" rel="stylesheet" type="text/css">
</head>
<body>

<div class="login">
    <form action="${pageContext.request.contextPath}/adminlogin" method="post" id="form">
        <div class="logo"></div>
        <div class="login_form">
            <div class="user">
                <input class="text_value" value="" name="username" type="text" id="username">
                <input class="text_value" value="" name="password" type="password" id="password">
            </div>
            <button class="button" id="submit" type="submit">登录</button>
            <span style="color: red">${requestScope.info}</span>
        </div>
        <div class="foot">
        </div>
    </form>
</div>
<script src="public/ui/do.js"></script>
<script src="public/ui/config.js"></script>
</body>
</html>
