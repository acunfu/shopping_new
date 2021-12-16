<%@ page import="bean.User" %>
<%@ page import="bean.Cart" %>
<%@ page import="bean.CartItem" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
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
        <div class="shopping-car-container">
            <div class="car-headers-menu">
                <div class="row">
                    <div class="col-md-1 car-menu">
                        序号
                    </div>
                    <div class="col-md-2 car-menu">
                        产品
                    </div>
                    <div class="col-md-4 car-menu">
                        产品描述
                    </div>
                    <div class="col-md-1 car-menu">
                        产品单价
                    </div>
                    <div class="col-md-2 car-menu">
                        数量
                    </div>
                    <div class="col-md-1 car-menu">
                        金额
                    </div>
                    <div class="col-md-1 car-menu">
                        操作
                    </div>
                </div>
            </div>

            <!--产品列表-->
            <div class="goods-content">
                <%
                    /*获取购物车*/
                    Cart cart = (Cart) request.getAttribute("cart");
                    if (cart.getList().size() > 0) {
                        List<CartItem> list = cart.getList();
                        /*遍历输出*/
                        for (int i = 0; i < list.size(); i++) {
                %>
                <div class="goods-item">
                    <div class="panel panel-default">

                        <div class="panel-body">

                            <div class="col-md-1 car-goods-info">
                                <span><%=i + 1%></span>
                            </div>
                            <div class="col-md-2 car-goods-info">

                        <span id="goods-info">
                            <a href="DetailsServlet?pid=<%=list.get(i).getProduct().getpId()%>" target="_blank">
                            <img src="<%=list.get(i).getProduct().getpImage()%>" style="width: 80px;height: 80px;"/>
									<h4 class="text-center"><%=list.get(i).getProduct().getpName()%></h4>
                            </a>
						</span>
                            </div>
                            <div class="col-md-4 car-goods-info goods-params">
                                <%=list.get(i).getProduct().getpDescription()%>
                            </div>
                            <div class="col-md-1 car-goods-info goods-price">
								<span>
									￥
								</span>
                                <span class="single-price">
									<%=list.get(i).getProduct().getpPrice()%>
								</span>
                            </div>
                            <div class="col-md-2 car-goods-info">
                                <div class="input-group">
                                    <div class="input-group-btn">
                                        <a href="PopProductFromCart?pid=<%=list.get(i).getProduct().getpId()%>"
                                           class="btn btn-default car-decrease">
                                            -
                                        </a>
                                    </div>
                                    <input type="text" class="form-control goods-count"
                                           value="<%=list.get(i).getCount()%>" readonly>
                                    <div class="input-group-btn">
                                        <a href="PushProductToCart?pid=<%=list.get(i).getProduct().getpId()%>"
                                           class="btn btn-default car-add">
                                            +
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-1 car-goods-info goods-money-count">
								<span>
									￥
								</span>
                                <span class="single-total">
									<%=list.get(i).getPrice()%>
								</span>
                            </div>
                            <div class="col-md-1 car-goods-info goods-operate">
                                <a class="btn btn-danger item-delete"
                                   href="DeleteFromCart?pid=<%=list.get(i).getProduct().getpId()%>">
                                    删除
                                </a>
                            </div>
                        </div>

                    </div>
                </div>
                <%
                        }
                    }
                %>
            </div>
            <div class="panel panel-default">
                <div class="panel-body bottom-menu-include">
                    <div class="col-md-5 bottom-menu">
                    </div>
                    <div class="col-md-3 bottom-menu">
						<span>
							已选商品
							<span id="selectGoodsCount">
                                <%=cart.getList().size()%>
							</span>
							件
						</span>
                    </div>
                    <div class="col-md-2 bottom-menu">
						<span>
							合计：<span id="selectGoodsMoney"><%=cart.getTotalPrice()%></span>
						</span>
                    </div>
                    <div class="col-md-1 bottom-menu submitData submitDis" id="submit">
                        结算
                    </div>
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
        $("#submit").click(function () {
            if (<%=cart.getList().size()%>>0){
                window.location="CheckServlet";
            }else{
                alert("购物车为空");
            }
        });
    });
</script>
</body>

</html>