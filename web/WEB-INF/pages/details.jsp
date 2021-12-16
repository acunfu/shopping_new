<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="bean.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="bean.User" %>

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
    <title>详情</title>
    <base href="<%=url%>">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="static/js/bootstrap-3.4.1-dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="static/css/style.css">
</head>
<body>

<%--导航条毒开始--%>
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
<%--导航条毒结束--%>

<%
    Product product = (Product) request.getAttribute("product");
%>
<div class="container">
    <div class="row" style="margin-top:20px;">
        <div class="col-md-6">
            <img src="<%=product.getpImage()%>" class="image">
        </div>
        <div class="col-md-6 centerbox">
            <p class="imgname"><%=product.getpName()%>
            </p>
            <p class="Aprice">价格：<samp>￥<%=product.getpPrice() + 10%>
            </samp></p>
            <p class="price">促销价：<samp>￥<%=product.getpPrice()%>
            </samp></p>
            <p class="youhui">店铺优惠：<samp>购物满两件打八折</samp></p>
            <p class="kefu">客服：</p>
            <p class="buy">
                <a href="CheckServlet?pid=<%=product.getpId()%>" id="firstbuy">立即购买</a>
                <a href="AddToCart?pid=<%=product.getpId()%>">加入购物车</a>
            </p>
            <div class="clearfix"></div>
            <div class="fenx"><a href="#"><img src="static/img/details/tell07.png"></a></div>
            <p class="fuwu">服务承诺：</p>
            <p class="pay">支付方式：</p>
        </div>
    </div>

</div>
<!--jQuery-->
<script type="text/javascript" src="static/js/jquery-3.6.0.js"></script>
<!--BootStrap JS-->
<script type="text/javascript" src="static/js/bootstrap-3.4.1-dist/js/bootstrap.js"></script>

</body>
</html>