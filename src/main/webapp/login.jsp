<%--
  Created by IntelliJ IDEA.
  User: Louis
  Date: 2018/12/17
  Time: 21:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en-US">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <title>Home</title>

    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" media="all" />
    <link rel="stylesheet" href="css/ionicons.min.css" type="text/css" media="all" />
    <link rel="stylesheet" href="css/owl.carousel.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/owl.theme.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/settings.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/custom.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/stylea.css">
    <link rel="stylesheet" href="css/googlefonts.css" media="all">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
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
                            <li><a href="#">登录</a></li>
                            <li><a href="#">注册</a></li>
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
                            <input type="search" class="top-search-input" name="s" placeholder="搜索" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <a href="${pageContext.request.contextPath}/index" id="logo">
                        <img class="logo-image" src="images/logo.png" alt="Organik Logo" />
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
                                                            <img src="goodsimg/${item.item.image}" alt=""/>
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
                            <img class="logo-image" src="images/logo.png" alt="Organik Logo" />
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
    <div class="m-t-60">
        <div class="container" style="background-image:url('images/loginbck.jpg');">
            <div class="position-left">
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3">
                        <div class="box p-40 p-xs-20 bg-white">
                            <form id="login_form" action="${pageContext.request.contextPath}/login" method="post">
                                <input type="hidden" value="Login" name="action">
                                <div class="form-group">
                                    <label class="control-label" for="username">用户名</label>
                                    <input type="text" value="" placeholder="用户名" name="username" id="username" class="form-control form-item">
                                    <span class="error_tip"></span>
                                </div>
                                <div class="form-group m-t-30">
                                    <label class="control-label" for="userpassword">密码</label>
                                    <input type="password"  value="" placeholder="密码" name="userpassword"
                                           id="userpassword" class="form-control form-item">
                                    <span class="error_tip"></span>
                                    <a class="m-b-30" href="#">忘记密码</a>
                                </div>
                                <button type="submit" class="btn ht-btn bg-6">登录</button>
                                <span style="color: red;font-size: 16px">${requestScope.error}</span>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer class="footer" style="margin-top: 50px">
        <div class="container">
            <div class="row">
                <div class="col-md-5">
                    <img src="images/footer_logo.png" class="footer-logo" alt="" />
                    <p>
                        Welcome to Organik. Our products are freshly harvested, washed ready for box and finally delivered from our family farm right to your doorstep.
                    </p>
                    <div class="footer-social">
                        <a href="#" data-toggle="tooltip" data-placement="top" title="Facebook"><i class="fa fa-facebook"></i></a>
                        <a href="#" data-toggle="tooltip" data-placement="top" title="Twitter"><i class="fa fa-twitter"></i></a>
                        <a href="#" data-toggle="tooltip" data-placement="top" title="Pinterest"><i class="fa fa-pinterest"></i></a>
                        <a href="#" data-toggle="tooltip" data-placement="top" title="Instagram"><i class="fa fa-instagram"></i></a>
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
                            <input type="email" name="EMAIL" placeholder="Your email address" required="" />
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
                    <img src="images/footer_payment.png" alt="" />
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
<script type="text/javascript" src="js/imagesloaded.pkgd.min.js"></script>
<script type="text/javascript" src="js/isotope.pkgd.min.js"></script>
<script type="text/javascript" src="js/jquery.isotope.init.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script src="js/login.js"></script>
<script type="text/javascript" src="js/cart.js"></script>
<script type="text/javascript" src="js/jquery.themepunch.tools.min.js"></script>
<script type="text/javascript" src="js/jquery.themepunch.revolution.min.js"></script>
<script type="text/javascript" src="js/extensions/revolution.extension.video.min.js"></script>
<script type="text/javascript" src="js/extensions/revolution.extension.slideanims.min.js"></script>
<script type="text/javascript" src="js/extensions/revolution.extension.actions.min.js"></script>
<script type="text/javascript" src="js/extensions/revolution.extension.layeranimation.min.js"></script>
<script type="text/javascript" src="js/extensions/revolution.extension.kenburn.min.js"></script>
<script type="text/javascript" src="js/extensions/revolution.extension.navigation.min.js"></script>
<script type="text/javascript" src="js/extensions/revolution.extension.migration.min.js"></script>
<script type="text/javascript" src="js/extensions/revolution.extension.parallax.min.js"></script>
</body>
</html>
