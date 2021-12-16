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
    <title>主页</title>
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


<div class="container">
    <div class="row">
        <div class="col-md-4">
            <h1 class="text-center">产品展示</h1>
        </div>
        <div class="col-md-2" style="margin-top: 20px">
            <%
                String info = (String) request.getAttribute("info");
                if (info == null) {
            %>
            <h5 class="text-danger" style="display: none;" id="inputTip">请输入要搜索的产品</h5>
            <%} else {%>
            <h5 class="text-danger" id="inputTip"><%=info%>
            </h5>
            <%}%>
        </div>
        <div class="col-md-6" style="margin-top: 20px;">
            <form action="SearchServlet" class="input-group" id="search_form">
                <input type="text" name="key" class="form-control" id="txtKey"/>
                <a id="aSubmit" href="javascript:void(0);" class="input-group-addon"><i
                        class="glyphicon glyphicon-search"></i></a>
            </form>
        </div>
    </div>

    <%--轮播--%>
    <%--<div class="row">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">

                <li data-target="#carousel-example-generic" data-slide-to="0" class=""></li>
                <li data-target="#carousel-example-generic" data-slide-to="1" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <div class="item">
                    <img data-src="holder.js/1140x500/auto/#777:#555/text:First slide" alt="First slide [1140x500]" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMTE0MCIgaGVpZ2h0PSI1MDAiIHZpZXdCb3g9IjAgMCAxMTQwIDUwMCIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+PCEtLQpTb3VyY2UgVVJMOiBob2xkZXIuanMvMTE0MHg1MDAvYXV0by8jNzc3OiM1NTUvdGV4dDpGaXJzdCBzbGlkZQpDcmVhdGVkIHdpdGggSG9sZGVyLmpzIDIuNi4wLgpMZWFybiBtb3JlIGF0IGh0dHA6Ly9ob2xkZXJqcy5jb20KKGMpIDIwMTItMjAxNSBJdmFuIE1hbG9waW5za3kgLSBodHRwOi8vaW1za3kuY28KLS0+PGRlZnM+PHN0eWxlIHR5cGU9InRleHQvY3NzIj48IVtDREFUQVsjaG9sZGVyXzE3ZGI4Y2M1MTIxIHRleHQgeyBmaWxsOiM1NTU7Zm9udC13ZWlnaHQ6Ym9sZDtmb250LWZhbWlseTpBcmlhbCwgSGVsdmV0aWNhLCBPcGVuIFNhbnMsIHNhbnMtc2VyaWYsIG1vbm9zcGFjZTtmb250LXNpemU6NTdwdCB9IF1dPjwvc3R5bGU+PC9kZWZzPjxnIGlkPSJob2xkZXJfMTdkYjhjYzUxMjEiPjxyZWN0IHdpZHRoPSIxMTQwIiBoZWlnaHQ9IjUwMCIgZmlsbD0iIzc3NyIvPjxnPjx0ZXh0IHg9IjM5MC41IiB5PSIyNzUuNSI+Rmlyc3Qgc2xpZGU8L3RleHQ+PC9nPjwvZz48L3N2Zz4=" data-holder-rendered="true">
                </div>
                <div class="item active">
                    <img data-src="holder.js/1140x500/auto/#666:#444/text:Second slide" alt="Second slide [1140x500]" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMTE0MCIgaGVpZ2h0PSI1MDAiIHZpZXdCb3g9IjAgMCAxMTQwIDUwMCIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+PCEtLQpTb3VyY2UgVVJMOiBob2xkZXIuanMvMTE0MHg1MDAvYXV0by8jNjY2OiM0NDQvdGV4dDpTZWNvbmQgc2xpZGUKQ3JlYXRlZCB3aXRoIEhvbGRlci5qcyAyLjYuMC4KTGVhcm4gbW9yZSBhdCBodHRwOi8vaG9sZGVyanMuY29tCihjKSAyMDEyLTIwMTUgSXZhbiBNYWxvcGluc2t5IC0gaHR0cDovL2ltc2t5LmNvCi0tPjxkZWZzPjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+PCFbQ0RBVEFbI2hvbGRlcl8xN2RiOGNjODFhMSB0ZXh0IHsgZmlsbDojNDQ0O2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1mYW1pbHk6QXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7Zm9udC1zaXplOjU3cHQgfSBdXT48L3N0eWxlPjwvZGVmcz48ZyBpZD0iaG9sZGVyXzE3ZGI4Y2M4MWExIj48cmVjdCB3aWR0aD0iMTE0MCIgaGVpZ2h0PSI1MDAiIGZpbGw9IiM2NjYiLz48Zz48dGV4dCB4PSIzMzUuNTkzNzUiIHk9IjI3NS41Ij5TZWNvbmQgc2xpZGU8L3RleHQ+PC9nPjwvZz48L3N2Zz4=" data-holder-rendered="true">
                </div>
                <div class="item">
                    <img data-src="holder.js/1140x500/auto/#555:#333/text:Third slide" alt="Third slide [1140x500]" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMTE0MCIgaGVpZ2h0PSI1MDAiIHZpZXdCb3g9IjAgMCAxMTQwIDUwMCIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+PCEtLQpTb3VyY2UgVVJMOiBob2xkZXIuanMvMTE0MHg1MDAvYXV0by8jNTU1OiMzMzMvdGV4dDpUaGlyZCBzbGlkZQpDcmVhdGVkIHdpdGggSG9sZGVyLmpzIDIuNi4wLgpMZWFybiBtb3JlIGF0IGh0dHA6Ly9ob2xkZXJqcy5jb20KKGMpIDIwMTItMjAxNSBJdmFuIE1hbG9waW5za3kgLSBodHRwOi8vaW1za3kuY28KLS0+PGRlZnM+PHN0eWxlIHR5cGU9InRleHQvY3NzIj48IVtDREFUQVsjaG9sZGVyXzE3ZGI4Y2NiMWZlIHRleHQgeyBmaWxsOiMzMzM7Zm9udC13ZWlnaHQ6Ym9sZDtmb250LWZhbWlseTpBcmlhbCwgSGVsdmV0aWNhLCBPcGVuIFNhbnMsIHNhbnMtc2VyaWYsIG1vbm9zcGFjZTtmb250LXNpemU6NTdwdCB9IF1dPjwvc3R5bGU+PC9kZWZzPjxnIGlkPSJob2xkZXJfMTdkYjhjY2IxZmUiPjxyZWN0IHdpZHRoPSIxMTQwIiBoZWlnaHQ9IjUwMCIgZmlsbD0iIzU1NSIvPjxnPjx0ZXh0IHg9IjM3Ny44NTkzNzUiIHk9IjI3NS41Ij5UaGlyZCBzbGlkZTwvdGV4dD48L2c+PC9nPjwvc3ZnPg==" data-holder-rendered="true">
                </div>
            </div>
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>--%>
    <div class="row" style="margin-top: 20px;">
        <div class="table-responsive">

            <table class="table table-bordered table-hover text-center" id="tab">

                <thead>
                <tr>
                    <th class="col-md-1">序号</th>
                    <th class="col-md-1">产品名称</th>
                    <th class="col-md-6">产品描述</th>
                    <th class="col-md-2">产品单价（￥）</th>
                    <th class="col-md-2">添加到购物车</th>
                </tr>
                </thead>
                <tbody>
                <% for (Product product : (List<Product>) request.getAttribute("list")) { %>
                <tr>
                    <td><%=product.getpId()%>
                    </td>
                    <td><%=product.getpName()%>
                    </td>
                    <td class="media text-left desc">
                        <a class="media-left" href="DetailsServlet?pid=<%=product.getpId()%>" target="_blank">
                            <img class="desc-img" src="<%=product.getpImage()%>" style="width: 100px; height: 100px;">
                        </a>
                        <div class="media-left media-middle">

                            <%=product.getpDescription()%>
                        </div>
                    </td>
                    <td><%=product.getpPrice()%>
                    </td>
                    <td>
                        <a href="AddToCart?pid=<%=product.getpId()%>" class="btn btn-danger">添加</a>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!--jQuery-->
<script type="text/javascript" src="static/js/jquery-3.6.0.js"></script>
<!--BootStrap JS-->
<script type="text/javascript" src="static/js/bootstrap-3.4.1-dist/js/bootstrap.js"></script>


<script>
    $(function () {
        $("#aSubmit").click(function () {
            let key = $("#txtKey").val();
            if (key == "") {
                $("#inputTip").slideDown();
                return;
            } else {
                $("#search_form").submit();
            }
        });
    });
</script>
</body>
</html>