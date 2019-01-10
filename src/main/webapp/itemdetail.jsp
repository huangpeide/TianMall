<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: Louis
  Date: 2018/12/24
  Time: 9:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en-US">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <title>Shop Detail</title>

    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" media="all"/>
    <link rel="stylesheet" href="css/ionicons.min.css" type="text/css" media="all"/>
    <link rel="stylesheet" href="css/owl.carousel.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/owl.theme.css" type="text/css" media="all">
    <link rel='stylesheet' href='css/prettyPhoto.css' type='text/css' media='all'>
    <link rel='stylesheet' href='css/slick.css' type='text/css' media='all'>
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/custom.css" type="text/css" media="all">
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
                            <a href="cart.html">
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
                        <h2 class="page-title text-center">商品详情</h2>
                    </div>
                </div>
            </div>
        </div>
        <div class="section border-bottom pt-2 pb-2">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <ul class="breadcrumbs">
                            <li><a href="/index">主页</a></li>
                            <li><a href="#">Shop</a></li>
                            <li>商品详情</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="section pt-7 pb-7">
            <div class="container">
                <div class="row">
                    <div class="col-md-9 col-md-push-3">
                        <div class="single-product">
                            <div class="col-md-6">
                                <div class="image-gallery">
                                    <div class="image-gallery-inner">
                                        <div>
                                            <div class="image-thumb">
                                                <a href="http://localhost/img/goodsimg/${requestScope.item.image}"
                                                   data-rel="prettyPhoto[gallery]">
                                                    <img src="http://localhost/img/goodsimg/${requestScope.item.image}" alt=""/>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="summary">
                                    <h1 class="product-title">${requestScope.item.name}</h1>
                                    <div class="product-price">
                                        <ins>${requestScope.item.value}</ins>
                                    </div>
                                    <div class="mb-3">
                                        <p>${requestScope.item.info}</p>
                                    </div>
                                    <form class="cart">
                                        <div class="quantity-chooser">
                                            <div class="quantity">
                                                <span class="qty-minus" data-min="1"><i
                                                        class="ion-ios-minus-outline"></i></span>
                                                <input type="text" name="quantity" value="1" title="Qty"
                                                       class="input-text qty text" size="4">
                                                <span class="qty-plus" data-max=""><i class="ion-ios-plus-outline"></i></span>
                                            </div>
                                        </div>
                                        <p style="display: none">${requestScope.item.id}</p>
                                        <button type="button" class="single-add-to-cart">添加到购物车</button>
                                    </form>
                                    <div class="product-tool">
                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Add to wishlist">添加到心愿清单 </a>
                                    </div>
                                    <div class="product-meta">
                                        <table>
                                            <tbody>
                                            <tr>
                                                <td class="label">分类</td>
                                                <td><a href="#">Juice</a></td>
                                            </tr>
                                            <tr>
                                                <td class="label">Share</td>
                                                <td class="share">
                                                    <a target="_blank" href="#"><i class="fa fa-weibo"></i></a>
                                                    <a target="_blank" href="#"><i class="fa fa-instagram"></i></a>
                                                    <a target="_blank" href="#"><i class="fa fa-wechat"></i></a>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="commerce-tabs tabs classic">
                                    <ul class="nav nav-tabs tabs">
                                        <li class="active">
                                            <a data-toggle="tab" href="#tab-description" aria-expanded="true">描述</a>
                                        </li>
                                        <li class="">
                                            <a data-toggle="tab" href="#tab-reviews" aria-expanded="false">评论</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content">
                                        <div class="tab-pane fade active in" id="tab-description">
                                            <p>
                                                ${requestScope.item.info}
                                            </p>
                                        </div>
                                        <div id="tab-reviews" class="tab-pane fade">
                                            <div class="single-comments-list mt-0">
                                                <div class="mb-2">
                                                    <h2 class="comment-title">2 reviews for Orange Juice</h2>
                                                </div>
                                                <ul class="comment-list">
                                                    <li>
                                                        <div class="comment-container">
                                                            <div class="comment-author-vcard">
                                                                <img alt="" src="images/avatar/avatar.png"/>
                                                            </div>
                                                            <div class="comment-author-info">
                                                                <span class="comment-author-name">admin</span>
                                                                <a href="#" class="comment-date">July 27, 2016</a>
                                                                <p>Far far away, behind the word mountains, far from the
                                                                    countries Vokalia and Consonantia, there live the
                                                                    blind texts. Separated they live in Bookmarksgrove
                                                                    right at the coast of the Semantics, a large
                                                                    language ocean. A small river named Duden flows by
                                                                    their place and supplies it with the necessary
                                                                    regelialia.</p>
                                                            </div>
                                                            <div class="reply">
                                                                <a class="comment-reply-link" href="#">Reply</a>
                                                            </div>
                                                        </div>
                                                        <ul class="children">
                                                            <li>
                                                                <div class="comment-container">
                                                                    <div class="comment-author-vcard">
                                                                        <img alt="" src="images/avatar/avatar.png"/>
                                                                    </div>
                                                                    <div class="comment-author-info">
                                                                        <span class="comment-author-name">admin</span>
                                                                        <a href="#" class="comment-date">July 27,
                                                                            2016</a>
                                                                        <p>Far far away, behind the word mountains, far
                                                                            from the countries Vokalia and Consonantia,
                                                                            there live the blind texts. Separated they
                                                                            live in Bookmarksgrove right at the coast of
                                                                            the Semantics, a large language ocean. A
                                                                            small river named Duden flows by their place
                                                                            and supplies it with the necessary
                                                                            regelialia.</p>
                                                                    </div>
                                                                    <div class="reply">
                                                                        <a class="comment-reply-link" href="#">Reply</a>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <div class="comment-container">
                                                            <div class="comment-author-vcard">
                                                                <img alt="" src="images/avatar/avatar.png"/>
                                                            </div>
                                                            <div class="comment-author-info">
                                                                <span class="comment-author-name">admin</span>
                                                                <a href="#" class="comment-date">July 27, 2016</a>
                                                                <p>Far far away, behind the word mountains, far from the
                                                                    countries Vokalia and Consonantia, there live the
                                                                    blind texts. Separated they live in Bookmarksgrove
                                                                    right at the coast of the Semantics, a large
                                                                    language ocean. A small river named Duden flows by
                                                                    their place and supplies it with the necessary
                                                                    regelialia.</p>
                                                            </div>
                                                            <div class="reply">
                                                                <a class="comment-reply-link" href="#">Reply</a>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="single-comment-form mt-0">
                                                <div class="mb-2">
                                                    <h2 class="comment-title">LEAVE A REPLY</h2>
                                                </div>
                                                <form class="comment-form">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <textarea id="comment" name="comment" cols="45" rows="5"
                                                                      placeholder="Message *"></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <input id="author" name="author" type="text" value=""
                                                                   size="30" placeholder="Name *" class="mb-2">
                                                        </div>
                                                        <div class="col-md-4">
                                                            <input id="email" name="email" type="email" value=""
                                                                   size="30" placeholder="Email *" class="mb-2">
                                                        </div>
                                                        <div class="col-md-4">
                                                            <input id="url" name="url" type="text" value=""
                                                                   placeholder="Website">
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-2">
                                                            <input name="submit" type="submit" id="submit"
                                                                   class="btn btn-alt btn-border" value="Submit">
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="related">
                                    <div class="related-title">
                                        <div class="text-center mb-1 section-pretitle fz-34">相关</div>
                                        <h2 class="text-center section-title mtn-2 fz-24">产品</h2>
                                    </div>
                                    <div class="product-carousel p-0" data-auto-play="true" data-desktop="3"
                                         data-laptop="2" data-tablet="2" data-mobile="1">
                                        <c:forEach items="${requestScope.itemkind}" var="item">
                                            <div class="product-item text-center">
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
                                                        <img src="http://localhost/img/goodsimg/${item.image}" alt="" style=""/>
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
                                                        <span class="price">${item.value}</span>
                                                    </a>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-md-pull-9">
                        <div class="sidebar">
                            <div class="widget widget-product-search">
                                <form class="form-search">
                                    <input type="text" class="search-field" placeholder="搜索产品" value=""
                                           name="s"/>
                                    <input type="submit" value="Search"/>
                                </form>
                            </div>
                            <div class="widget widget-product-categories">
                                <h3 class="widget-title">产品列表</h3>
                                <ul class="product-categories">
                                    <li><a href="#">新鲜水果</a> <span class="count">${requestScope.countlist[0]}</span>
                                    </li>
                                    <li><a href="#">海鲜水产</a> <span class="count">${requestScope.countlist[1]}</span>
                                    </li>
                                    <li><a href="#">猪牛羊肉</a> <span class="count">${requestScope.countlist[2]}</span>
                                    </li>
                                    <li><a href="#">禽类蛋品</a> <span class="count">${requestScope.countlist[3]}</span>
                                    </li>
                                    <li><a href="#">新鲜蔬菜</a> <span class="count">${requestScope.countlist[4]}</span>
                                    </li>
                                    <li><a href="#">速冻食品</a> <span class="count">${requestScope.countlist[5]}</span>
                                    </li>
                                    <li><a href="#">乳品糕点</a> <span class="count">${requestScope.countlist[6]}</span>
                                    </li>
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
<script type="text/javascript" src="js/cart.js"></script>
<script type="text/javascript" src="js/jquery.countdown.min.js"></script>
<script type='text/javascript' src='js/jquery.prettyPhoto.js'></script>
<script type='text/javascript' src='js/jquery.prettyPhoto.init.min.js'></script>
<script type='text/javascript' src='js/slick.min.js'></script>
<script type="text/javascript" src="js/script.js"></script>
</body>
</html>
