<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%--
  Created by IntelliJ IDEA.
  User: Louis
  Date: 2018/12/30
  Time: 15:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en-US">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <title>Checkout</title>

    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" media="all"/>
    <link rel="stylesheet" href="css/ionicons.min.css" type="text/css" media="all"/>
    <link rel="stylesheet" href="css/owl.carousel.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/owl.theme.css" type="text/css" media="all">
    <link rel='stylesheet' href='css/prettyPhoto.css' type='text/css' media='all'>
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/custom.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/googlefonts.css" type="text/css" media="all">
</head>
<body>


<div class="noo-spinner">
    <div class="spinner">
        <div class="cube1"></div>
        <div class="cube2"></div>
    </div>
</div>
<div id="menu-slideout" class="slideout-menu hidden-md-up">
    <div class="mobile-menu">
        <ul id="mobile-menu" class="menu">
            <li><a href="${pageContext.request.contextPath}/index">主页</a></li>
            <li><a href="javascript:void(0)">关于我们</a></li>
            <li><a href="${pageContext.request.contextPath}/wishList">收藏夹</a></li>
            <li><a href="${pageContext.request.contextPath}/itemList?kind=FRU">产品列表</a></li>
            <li><a href="${pageContext.request.contextPath}/cart">购物车</a></li>
            <li><a href="${pageContext.request.contextPath}/checkout">去结算</a></li>
            <li><a href="javascript:void(0)">联系我们</a></li>
        </ul>
    </div>
</div>
<div class="site">
    <div class="topbar">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="topbar-text">
                        <span>服务时间:周一 - 周五: 08AM-06PM</span>
                        <span>周六 - 周日: 10AM-06PM</span>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="topbar-menu">
                        <ul class="topbar-menu">
                            <c:if test="${sessionScope.user!=null}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/account">${sessionScope.user.userName}</a>
                                </li>
                            </c:if>
                            <c:if test="${sessionScope.user==null}">
                                <li><a href="${pageContext.request.contextPath}/login">登录</a></li>
                            </c:if>
                            <li><a href="${pageContext.request.contextPath}/register">注册</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <header id="header" class="header header-desktop header-2">
        <div class="top-search">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <form>
                            <input type="search" class="top-search-input" name="s" placeholder="搜索"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <a href="#" id="logo">
                        <img class="logo-image" src="images/logo.png" alt="Organik Logo"/>
                    </a>
                </div>
                <div class="col-md-9">
                    <div class="header-right">
                        <nav class="menu">
                            <ul class="main-menu">
                                <li><a href="${pageContext.request.contextPath}/index">主页</a></li>
                                <li><a href="javascript:void(0)">关于我们</a></li>
                                <li><a href="${pageContext.request.contextPath}/wishList">收藏夹</a></li>
                                <li><a href="${pageContext.request.contextPath}/itemList?kind=FRU">产品列表</a></li>
                                <li><a href="${pageContext.request.contextPath}/cart">购物车</a></li>
                                <li><a href="${pageContext.request.contextPath}/checkout">去结算</a></li>
                                <li><a href="javascript:void(0)">联系我们</a></li>
                            </ul>
                        </nav>
                        <div class="btn-wrap">
                            <div class="mini-cart-wrap">
                                <div class="mini-cart">
                                    <c:if test="${requestScope.cartitem!=null}">
                                        <div class="mini-cart-icon" data-count="${fn:length(requestScope.cartitem)}">
                                            <i class="ion-bag"></i>
                                        </div>
                                        <div class="widget-shopping-cart-content">
                                            <ul class="cart-list">
                                                <c:forEach items="${requestScope.cartitem}" var="item">
                                                    <li>
                                                        <a href="javascript:void(0)" class="remove">×</a>
                                                        <a href="${pageContext.request.contextPath}/item?itemid=${item.item.id}">
                                                            <img src="http://localhost/img/goodsimg/${item.item.image}" alt=""/>
                                                                ${item.item.name}&nbsp;
                                                        </a>
                                                        <span class="quantity">${item.num}×${item.item.value}</span>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                            <p class="total">
                                                <strong>共计</strong>
                                                <span class="amount">${requestScope.total}</span>
                                            </p>
                                            <p class="buttons">
                                                <a href="${pageContext.request.contextPath}/cart" class="view-cart">浏览购物车</a>
                                                <a href="${pageContext.request.contextPath}/checkout" class="checkout">去结算</a>
                                            </p>
                                        </div>
                                    </c:if>
                                    <c:if test="${requestScope.cartitem==null}">
                                        <div class="mini-cart-icon" data-count="0">
                                            <i class="ion-bag"></i>
                                        </div>
                                    </c:if>
                                </div>

                            </div>
                            <div class="top-search-btn-wrap">
                                <div class="top-search-btn">
                                    <a href="javascript:void(0);">
                                        <i class="ion-search"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <header class="header header-mobile">
        <div class="container">
            <div class="row">
                <div class="col-xs-2">
                    <div class="header-left">
                        <div id="open-left"><i class="ion-navicon"></i></div>
                    </div>
                </div>
                <div class="col-xs-8">
                    <div class="header-center">
                        <a href="#" id="logo-2">
                            <img class="logo-image" src="images/logo.png" alt="Organik Logo"/>
                        </a>
                    </div>
                </div>
                <div class="col-xs-2">
                    <div class="header-right">
                        <div class="mini-cart-wrap">
                            <a href="${pageContext.request.contextPath}/cart">
                                <div class="mini-cart">
                                    <div class="mini-cart-icon" data-count="2">
                                        <i class="ion-bag"></i>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <div id="main">
        <div class="section section-bg-10 pt-11 pb-17">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <h2 class="page-title text-center">Checkout</h2>
                    </div>
                </div>
            </div>
        </div>
        <div class="section border-bottom pt-2 pb-2">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <ul class="breadcrumbs">
                            <li><a href="${pageContext.request.contextPath}/index">Home</a></li>
                            <li><a href="${pageContext.request.contextPath}/itemList?kind=FRU">Shop</a></li>
                            <li>Checkout</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="section section-checkout pt-7 pb-7">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <h3>配送地址</h3>
                        <address>
                            <p><strong>${requestScope.address.shippingname}</strong></p>
                            <p>${requestScope.address.address}</p>
                            <p>${requestScope.address.phoneNum}</p>
                        </address>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <h3 class="mt-3">Your order</h3>
                        <div class="order-review">
                            <table class="checkout-review-order-table">
                                <thead>
                                <tr>
                                    <th class="product-name">产品</th>
                                    <th class="product-total">价格</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${requestScope.cartitem}" var="item">
                                    <tr>
                                        <td class="product-name">
                                                ${item.item.name}&nbsp;<strong
                                                class="product-quantity">× ${item.num}</strong>
                                        </td>
                                        <td class="product-total">
                                            <fmt:formatNumber type="number" value="${(item.item.value)*(item.num)}"
                                                              pattern="0.00" maxFractionDigits="2"></fmt:formatNumber>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr>
                                    <th>小结</th>
                                    <td>${requestScope.total}</td>
                                </tr>
                                <tr>
                                    <th>运费</th>
                                    <c:if test="${requestScope.total>=66}">
                                        <td>免运费</td>
                                    </c:if>
                                    <c:if test="${requestScope.total<66}">
                                        <td>运费:15元</td>
                                    </c:if>
                                </tr>
                                <tr class="order-total">
                                    <th>总计</th>
                                    <c:if test="${requestScope.total>=66}">
                                        <td><strong>${requestScope.total}</strong></td>
                                    </c:if>
                                    <c:if test="${requestScope.total<66}">
                                        <td><strong>${requestScope.total+15}</strong></td>
                                    </c:if>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="text-right text-center-sm">
                            <a class="organik-btn mt-6" href="${pageContext.request.contextPath}/pay">去 支 付</a>
                            <span style="color: red">${requestScope.info}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-5">
                    <img src="images/footer_logo.png" class="footer-logo" alt=""/>
                    <p>
                        Welcome to Organik. Our products are freshly harvested, washed ready for box and finally
                        delivered from our family farm right to your doorstep.
                    </p>
                    <div class="footer-social">
                        <a href="#" data-toggle="tooltip" data-placement="top" title="Facebook"><i
                                class="fa fa-facebook"></i></a>
                        <a href="#" data-toggle="tooltip" data-placement="top" title="Twitter"><i
                                class="fa fa-twitter"></i></a>
                        <a href="#" data-toggle="tooltip" data-placement="top" title="Pinterest"><i
                                class="fa fa-pinterest"></i></a>
                        <a href="#" data-toggle="tooltip" data-placement="top" title="Instagram"><i
                                class="fa fa-instagram"></i></a>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="widget">
                        <h3 class="widget-title">信息</h3>
                        <ul>
                            <li><a href="#">新产品</a></li>
                            <li><a href="#">销量最高</a></li>
                            <li><a href="#">我们的博客</a></li>
                            <li><a href="#">关于我们</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="widget">
                        <h3 class="widget-title">Useful Link</h3>
                        <ul>
                            <li><a href="#">我们的团队</a></li>
                            <li><a href="#">我们的博客</a></li>
                            <li><a href="#">关于我们</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="widget">
                        <h3 class="widget-title">Subscribe</h3>
                        <p>
                            输入您的邮箱，我们有更新信息会第一时间通知您
                        </p>
                        <form class="newsletter">
                            <input type="email" name="EMAIL" placeholder="Your email address" required=""/>
                            <button><i class="fa fa-paper-plane"></i></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <div class="copyright">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    Copyright &copy; 2017.Company name All rights reserved.
                </div>
                <div class="col-md-4">
                    <img src="images/footer_payment.png" alt=""/>
                </div>
            </div>
        </div>
        <div class="backtotop" id="backtotop"></div>
    </div>
</div>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-migrate.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/modernizr-2.7.1.min.js"></script>
<script type="text/javascript" src="js/owl.carousel.min.js"></script>
<script type="text/javascript" src="js/jquery.countdown.min.js"></script>
<script type='text/javascript' src='js/jquery.prettyPhoto.js'></script>
<script type='text/javascript' src='js/jquery.prettyPhoto.init.min.js'></script>
<script type="text/javascript" src="js/script.js"></script>
</body>
</html>
