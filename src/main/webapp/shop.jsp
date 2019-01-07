<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: Louis
  Date: 2018/12/25
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en-US">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <title>商品详情</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" media="all"/>
    <link rel="stylesheet" href="css/ionicons.min.css" type="text/css" media="all"/>
    <link rel="stylesheet" href="css/owl.carousel.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/owl.theme.css" type="text/css" media="all">
    <link rel='stylesheet' href='css/prettyPhoto.css' type='text/css' media='all'>
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/custom.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/googlefonts.css" media="all">
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
            <li><a href="about-us.html">关于我们</a></li>
            <li><a href="${pageContext.request.contextPath}/itemList?kind=FRU">购物</a></li>
            <li><a href="${pageContext.request.contextPath}/itemList?kind=FRU">产品列表</a></li>
            <li><a href="${pageContext.request.contextPath}/cart">购物车</a></li>
            <li><a href="${pageContext.request.contextPath}/checkout">去结算</a></li>
            <li><a href="contact-us.html">联系我们</a></li>
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
                                <li><a href="about-us.html">关于我们</a></li>
                                <li><a href="${pageContext.request.contextPath}/itemList?kind=FRU">购物</a></li>
                                <li><a href="${pageContext.request.contextPath}/itemList?kind=FRU">产品列表</a></li>
                                <li><a href="${pageContext.request.contextPath}/cart">购物车</a></li>
                                <li><a href="${pageContext.request.contextPath}/checkout">去结算</a></li>
                                <li><a href="contact-us.html">联系我们</a></li>
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
                            <a href="/cart">
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
                        <h2 class="page-title text-center">Shop</h2>
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
                            <li><a href="${pageContext.request.contextPath}/itemList?kind=VEG">Shop</a></li>
                            <li style="display: none" id="displaykind">${requestScope.kind}</li>
                            <c:choose>
                                <c:when test="${requestScope.kind eq 'FRU'}">
                                    <li>新鲜水果</li>
                                </c:when>
                                <c:when test="${requestScope.kind eq 'SEA'}">
                                    <li>海鲜水产</li>
                                </c:when>
                                <c:when test="${requestScope.kind eq 'PBM'}">
                                    <li>猪牛羊肉</li>
                                </c:when>
                                <c:when test="${requestScope.kind eq 'POU'}">
                                    <li>禽类蛋品</li>
                                </c:when>
                                <c:when test="${requestScope.kind eq 'VEG'}">
                                    <li>新鲜蔬菜</li>
                                </c:when>
                                <c:when test="${requestScope.kind eq 'FRO'}">
                                    <li>速冻食品</li>
                                </c:when>
                                <c:when test="${requestScope.kind eq 'CAK'}">
                                    <li>乳品糕点</li>
                                </c:when>
                            </c:choose>

                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="section pt-7 pb-7">
            <div class="container">
                <div class="row">
                    <div class="col-md-9 col-md-push-3">
                        <div class="category-carousel-2 mb-3" data-auto-play="true" data-desktop="3" data-laptop="3"
                             data-tablet="2" data-mobile="1">
                            <div class="cat-item">
                                <div class="cats-wrap" data-bg-color="#f8c9c2">
                                    <a href="${pageContext.request.contextPath}/itemList?kind=FRU">
                                        <img src="images/category/cate_7.png" alt=""/>
                                        <h2 class="category-title">
                                            新鲜水果
                                            <mark class="count">(${requestScope.countlist[0]})</mark>
                                        </h2>
                                    </a>
                                </div>
                            </div>
                            <div class="cat-item">
                                <div class="cats-wrap" data-bg-color="#ebd3c3">
                                    <a href="${pageContext.request.contextPath}/itemList?kind=SEA">
                                        <img src="images/category/cate_5.png" alt=""/>
                                        <h2 class="category-title">
                                            海鲜水产
                                            <mark class="count">(${requestScope.countlist[1]})</mark>
                                        </h2>
                                    </a>
                                </div>
                            </div>
                            <div class="cat-item">
                                <div class="cats-wrap" data-bg-color="#c6e6f6">
                                    <a href="${pageContext.request.contextPath}/itemList?kind=PBM">
                                        <img src="images/category/cate_9.png" alt=""/>
                                        <h2 class="category-title">
                                            猪牛羊肉
                                            <mark class="count">(${requestScope.countlist[2]})</mark>
                                        </h2>
                                    </a>
                                </div>
                            </div>
                            <div class="cat-item">
                                <div class="cats-wrap" data-bg-color="#e0d1a1">
                                    <a href="${pageContext.request.contextPath}/itemList?kind=POU">
                                        <img src="images/category/cate_6.png" alt=""/>
                                        <h2 class="category-title">
                                            禽类蛋品
                                            <mark class="count">(${requestScope.countlist[3]})</mark>
                                        </h2>
                                    </a>
                                </div>
                            </div>
                            <div class="cat-item">
                                <div class="cats-wrap" data-bg-color="#e0d1a1">
                                    <a href="${pageContext.request.contextPath}/itemList?kind=VEG">
                                        <img src="images/category/cate_6.png" alt=""/>
                                        <h2 class="category-title">
                                            新鲜蔬菜
                                            <mark class="count">(${requestScope.countlist[4]})</mark>
                                        </h2>
                                    </a>
                                </div>
                            </div>
                            <div class="cat-item">
                                <div class="cats-wrap" data-bg-color="#e0d1a1">
                                    <a href="${pageContext.request.contextPath}/itemList?kind=FRO">
                                        <img src="images/category/cate_6.png" alt=""/>
                                        <h2 class="category-title">
                                            速冻食品
                                            <mark class="count">(${requestScope.countlist[5]})</mark>
                                        </h2>
                                    </a>
                                </div>
                            </div>
                            <div class="cat-item">
                                <div class="cats-wrap" data-bg-color="#e0d1a1">
                                    <a href="${pageContext.request.contextPath}/itemList?kind=CAK">
                                        <img src="images/category/cate_6.png" alt=""/>
                                        <h2 class="category-title">
                                            乳品蛋糕
                                            <mark class="count">(${requestScope.countlist[6]})</mark>
                                        </h2>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="product-grid">
                            <c:forEach items="${requestScope.indexitems}" var="item">
                                <div class="col-md-4 col-sm-6 product-item text-center mb-3">
                                    <div class="product-thumb">
                                        <a href="${pageContext.request.contextPath}/item?itemid=${item.id}">
                                            <c:if test="${item.stock==0}">
                                                <span class="outofstock"><span>已</span>售罄</span>
                                            </c:if>
                                            <c:if test="${item.ishot eq '1'}">
                                                <div class="badges">
                                                    <span class="hot">Hot</span>
                                                </div>
                                            </c:if>
                                            <img src="http://localhost/img/goodsimg/${item.image}" alt=""/>
                                        </a>
                                        <div class="product-action">
									<span class="add-to-cart">
										<a href="#" data-toggle="tooltip" data-placement="top" title="Add to cart"></a>
									</span>
                                            <span class="wishlist">
										<a href="#" data-toggle="tooltip" data-placement="top"
                                           title="Add to wishlist"></a>
									</span>
                                            <span class="quickview">
										<a href="#" data-toggle="tooltip" data-placement="top" title="Quickview"></a>
									</span>
                                            <span class="compare">
										<a href="#" data-toggle="tooltip" data-placement="top" title="Compare"></a>
									</span>
                                        </div>
                                    </div>
                                    <div class="product-info">
                                        <a href="${pageContext.request.contextPath}/item?itemid=${item.id}">
                                            <h2 class="title">${item.name}</h2>
                                            <span class="price">
										<ins>${item.value}</ins>
									</span>
                                        </a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="pagination">
                            <a class="prev page-numbers" href="javascript:void(0);">Prev</a>
                            <span class="page-numbers current">1</span>
                            <c:forEach begin="2" end="${requestScope.pages}" var="i">
                                <a class="page-numbers num" href="javascript:void(0);">${i}</a>
                            </c:forEach>
                            <a class="next page-numbers" href="javascript:void(0);">Next</a>
                        </div>
                    </div>
                    <div class="col-md-3 col-md-pull-9">
                        <div class="sidebar">
                            <div class="widget widget-product-search">
                                <form class="form-search">
                                    <input type="text" class="search-field" placeholder="Search products…" value=""
                                           name="s"/>
                                    <input type="submit" value="Search"/>
                                </form>
                            </div>
                            <div class="widget widget-product-categories">
                                <h3 class="widget-title">产品分类</h3>
                                <ul class="product-categories">
                                    <li><a href="${pageContext.request.contextPath}/itemList?kind=FRU">新鲜水果</a> <span
                                            class="count">${requestScope.countlist[0]}</span></li>
                                    <li><a href="${pageContext.request.contextPath}/itemList?kind=SEA">海鲜水产</a> <span
                                            class="count">${requestScope.countlist[1]}</span></li>
                                    <li><a href="${pageContext.request.contextPath}/itemList?kind=PBM">猪牛羊肉</a> <span
                                            class="count">${requestScope.countlist[2]}</span></li>
                                    <li><a href="${pageContext.request.contextPath}/itemList?kind=POU">禽类蛋品</a> <span
                                            class="count">${requestScope.countlist[3]}</span></li>
                                    <li><a href="${pageContext.request.contextPath}/itemList?kind=VEG">新鲜蔬菜</a> <span
                                            class="count">${requestScope.countlist[4]}</span></li>
                                    <li><a href="${pageContext.request.contextPath}/itemList?kind=FRO">速冻食品</a> <span
                                            class="count">${requestScope.countlist[5]}</span></li>
                                    <li><a href="${pageContext.request.contextPath}/itemList?kind=CAK">乳品糕点</a> <span
                                            class="count">${requestScope.countlist[6]}</span></li>
                                </ul>
                            </div>
                            <div class="widget widget-products">
                                <h3 class="widget-title">产品</h3>
                                <ul class="product-list-widget">
                                    <c:forEach items="${requestScope.items}" var="item">
                                        <li><a href="${pageContext.request.contextPath}/item?itemid=${item.id}">
                                            <img src="http://localhost/img/goodsimg/${item.image}" alt=""/>
                                            <span class="product-title">${item.name}</span>
                                        </a>
                                            <ins>${item.value}</ins>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
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
                            <li><a href="#">Our Team</a></li>
                            <li><a href="#">Our Blog</a></li>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Secure Shopping</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="widget">
                        <h3 class="widget-title">Subscribe</h3>
                        <p>
                            Enter your email address for our mailing list to keep yourself updated.
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
<script type="text/javascript" src="js/core.min.js"></script>
<script type="text/javascript" src="js/widget.min.js"></script>
<script type="text/javascript" src="js/mouse.min.js"></script>
<script type="text/javascript" src="js/slider.min.js"></script>
<script type="text/javascript" src="js/jquery.ui.touch-punch.js"></script>
<script type="text/javascript" src="js/price-slider.js"></script>
<script src="js/pagnition.js"></script>
<script type="text/javascript" src="js/cartinshop.js"></script>
</body>
</html>
