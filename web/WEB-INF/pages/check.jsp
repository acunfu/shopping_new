<%@ page import="bean.User" %>
<%@ page import="bean.Cart" %>
<%@ page import="bean.CartItem" %>
<%@ page import="java.util.ArrayList" %>
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
    <title>购物车</title>
    <base href="<%=url%>">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="static/js/bootstrap-3.4.1-dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="static/css/style.css">
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
        <h1>请核对订单信息</h1>
        <hr>
    </div>
    <div class="row">
        <div class="panel panel-danger">
            <div class="panel-heading">
                <h3 class="panel-title">收货地址</h3>
            </div>
            <div class="panel-body">
                <div class="checkbox">
                    <label>
                        <input name="address" type="radio" checked> 兰州市七里河区兰州理工大学（xxx 收) 13800000000
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input name="address" type="radio"> 兰州市城关区兰州大学(xxx  收） 13800000000
                    </label>
                </div>
                <div class="checkbox">
                    <label>
                        <input name="address" type="radio"> 兰州市安宁兰州交通大学 (xxx 收) 13800000000
                    </label>
                </div>
            </div>
        </div>

    </div>
    <div class="row">
        <div class="panel panel-danger">
            <div class="panel-heading">
                <h3 class="panel-title">支付方式</h3>
            </div>
            <div class="panel-body">
                <div class="centerbox">
                    <div class="buy clearfix">
                        <a class=" pay-choice" href="javascript:void(0);">在线支付</a>
                        <a href="javascript:void(0);">货到付款</a>
                        <a href="javascript:void(0);">公司转账</a>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="row">
        <div class="panel panel-danger">
            <div class="panel-heading">
                <h3 class="panel-title">送货清单</h3>
            </div>
            <div class="panel-body">
                <div class="shopping-car-container" style="padding: 0px;">
                    <div class="car-headers-menu">
                        <div class="row">
                            <div class="col-md-2 car-menu">
                                序号
                            </div>
                            <div class="col-md-2 car-menu">
                                产品
                            </div>
                            <div class="col-md-2 car-menu">
                                单价
                            </div>
                            <div class="col-md-3 car-menu">
                                数量
                            </div>
                            <div class="col-md-3 car-menu">
                                小计
                            </div>
                        </div>
                    </div>

                    <!--产品列表-->
                    <div class="goods-content">

                        <div class="goods-item">
                            <div class="panel panel-default">

                                <%
                                    Cart cart = (Cart) request.getAttribute("cart");
                                    for (int i = 0; i < cart.getList().size(); i++) {
                                %>
                                <div class="panel-body">

                                    <div class="col-md-2 car-goods-info">
                                        <span><%=i + 1%></span>
                                    </div>
                                    <div class="col-md-2 car-goods-info">

                                            <span id="goods-info">
                                                <a href="DetailsServlet?pid=1" target="_blank">
                                                    <img src="<%=cart.getList().get(i).getProduct().getpImage()%>"
                                                         style="width: 80px;height: 80px; margin-right: 10px;">
                                                        <span class="text-center"><%=cart.getList().get(i).getProduct().getpName()%></span>
                                                </a>
                                            </span>
                                    </div>
                                    <div class="col-md-2 car-goods-info goods-price">
                                        <span class="single-price"><%=cart.getList().get(i).getProduct().getpPrice()%></span>
                                    </div>
                                    <div class="col-md-3 car-goods-info goods-price">
                                        <span class="single-price">
                                        <%=cart.getList().get(i).getCount()%>
                                    </span>
                                    </div>

                                    <div class="col-md-3 car-goods-info goods-money-count">
                                        <span class="single-total">
                                            <%=cart.getList().get(i).getProduct().getpPrice() * cart.getList().get(i).getCount()%>
                                            </span>
                                    </div>

                                </div>
                                <%
                                    }
                                %>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">

        <div class="panel panel-default" style="position: relative;">
            <div class="panel-body bottom-menu-include">
                <div class="col-md-8 bottom-menu">
                </div>

                <div class="col-md-2 bottom-menu">
                                <span>
                                    付款：<span id="selectGoodsMoney"><%=cart.getTotalPrice()%></span>
                                </span>
                </div>
                <div class="col-md-2 bottom-menu submitData submitDis">
                    提交订单
                </div>
            </div>

        </div>
    </div>

</div>

<!--jQuery-->
<script type="text/javascript" src="static/js/jquery-3.6.0.js">
</script>
<!--BootStrap JS-->
<script type="text/javascript" src="static/js/bootstrap-3.4.1-dist/js/bootstrap.js">
</script>
<script>
    $(function () {
        $(".buy a").click(function () {
            $(".buy a").removeClass("pay-choice");
            $(this).addClass("pay-choice");
        });
    })
</script>
</body>

</html>