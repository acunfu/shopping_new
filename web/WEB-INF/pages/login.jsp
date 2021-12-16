<%@ page import="bean.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    /*设置页面链接路径*/
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登陆</title>
    <base href="<%=url%>">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="static/js/bootstrap-3.4.1-dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="static/css/style.css">
    <link rel="stylesheet" type="text/css" href="static/css/signin.css">
</head>

<body>
<%--导航条开始--%>
<header>
    <nav class="nav navbar-default">
        <div class="container">
            <div class="row">
                <div class="col-md-2">
                </div>
                <div class="col-md-6">
                    <a href="" class="btn btn-link">主页</a>
                </div>
                <%
                    User u = (User) session.getAttribute("user");
                %>
                <div class="col-md-4">
                    <%if (null == u) {%>
                    <a href="LoginServlet" class="btn btn-link">请登陆</a>
                    <%} else {%>
                    <span class="text-danger">你好，<%=u.getuName()%></span>
                    <a href="LogoutServlet" class="btn btn-link">退出</a>
                    <%}%>
                    <a href="CartServlet" class="btn btn-link">购物车</a>

                </div>
            </div>
        </div>
    </nav>
</header>
<%--导航条结束--%>

<div class="container">

    <div class="row">
        <%
            User u2 = (User) request.getAttribute("user");
        %>
        <form class="form-signin" action="LoginServlet" method="post">
            <h2 class="form-signin-heading">请登陆</h2>
            <span class="help-block"><%=request.getAttribute("msg") == null ? "" : request.getAttribute("msg")%></span>
            <input type="text" id="uname" name="uname" class="form-control" placeholder="用户名"
                   value="<%=null!=u2?u2.getuName():""%>" required autofocus>
            <br/>
            <input type="password" id="upwd" name="upwd" class="form-control" placeholder="密码"
                   value="<%=null!=u2?u2.getuPwd():""%>" required>

            <input type="hidden" name="return_uri" value="<%=request.getAttribute("return_uri")%>"/>
            <input type="hidden" name="pid" value="<%=request.getAttribute("pid")%>"/>

            <button class="btn btn-lg btn-primary btn-block" type="submit">登陆<tton>
        </form>

    </div>

    <!--jQuery-->
<script type="text/javascript" src="static/js/jquery-3.6.0.js"></script>
<!--BootStrap JS-->
<script type="text/javascript" src="static/js/bootstrap-3.4.1-dist/js/bootstrap.js"></script>
</body>
</html>