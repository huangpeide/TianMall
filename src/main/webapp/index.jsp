<%--
  Created by IntelliJ IDEA.
  User: Louis
  Date: 2018/12/14
  Time: 11:11
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
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" media="all"/>
    <link rel="stylesheet" href="css/ionicons.min.css" type="text/css" media="all"/>
    <link rel="stylesheet" href="css/owl.carousel.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/owl.theme.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/settings.css" type="text/css" media="all">
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
                                                            <img src="http://localhost/img/goodsimg/${item.item.image}"
                                                                 alt=""/>
                                                                ${item.item.name}
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
        <div class="section">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-12 p-0">
                        <div id="rev_slider" class="rev_slider fullscreenbanner">
                            <ul>
                                <li data-transition="fade" data-slotamount="default" data-hideafterloop="0"
                                    data-hideslideonmobile="off" data-easein="default" data-easeout="default"
                                    data-masterspeed="300" data-rotate="0" data-saveperformance="off"
                                    data-title="Slide">
                                    <img src="images/slider/slide_bg_4.jpg" alt="" data-bgposition="center center"
                                         data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="off"
                                         class="rev-slidebg"/>
                                    <div class="tp-caption rs-parallaxlevel-2"
                                         data-x="center" data-hoffset=""
                                         data-y="center" data-voffset="-80"
                                         data-width="['none','none','none','none']"
                                         data-height="['none','none','none','none']"
                                         data-type="image" data-responsive_offset="on"
                                         data-frames='[{"delay":0,"speed":300,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]'
                                         data-textAlign="['inherit','inherit','inherit','inherit']"
                                         data-paddingtop="[0,0,0,0]" data-paddingright="[0,0,0,0]"
                                         data-paddingbottom="[0,0,0,0]"
                                         data-paddingleft="[0,0,0,0]">
                                        <img src="images/slider/slide_6.png" alt=""/>
                                    </div>
                                    <div class="tp-caption rs-parallaxlevel-1"
                                         data-x="center" data-hoffset=""
                                         data-y="center" data-voffset="-80"
                                         data-width="['none','none','none','none']"
                                         data-height="['none','none','none','none']"
                                         data-type="image" data-responsive_offset="on"
                                         data-frames='[{"delay":0,"speed":300,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]'
                                         data-textAlign="['inherit','inherit','inherit','inherit']"
                                         data-paddingtop="[0,0,0,0]" data-paddingright="[0,0,0,0]"
                                         data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]">
                                        <img src="images/slider/slide_7.png" alt=""/>
                                    </div>
                                    <a class="tp-caption btn-2 hidden-xs" href="#"
                                       data-x="['center','center','center','center']"
                                       data-y="['center','center','center','center']"
                                       data-voffset="['260','260','260','260']"
                                       data-width="['auto']" data-height="['auto']"
                                       data-type="button" data-responsive_offset="on"
                                       data-responsive="off"
                                       data-frames='[{"delay":0,"speed":300,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"},{"frame":"hover","speed":"300","ease":"Power0.easeIn","to":"o:1;rX:0;rY:0;rZ:0;z:0;","style":"c:rgb(95,189,116);bg:rgba(51, 51, 51, 0);"}]'
                                       data-textAlign="['inherit','inherit','inherit','inherit']"
                                       data-paddingtop="[16,16,16,16]" data-paddingright="[30,30,30,30]"
                                       data-paddingbottom="[16,16,16,16]" data-paddingleft="[30,30,30,30]">Shop Now
                                    </a>
                                </li>
                                <li data-transition="fade" data-slotamount="default" data-hideafterloop="0"
                                    data-hideslideonmobile="off" data-easein="default" data-easeout="default"
                                    data-masterspeed="300" data-rotate="0" data-saveperformance="off"
                                    data-title="Slide">
                                    <img src="images/slider/slide_bg_5.jpg" alt="" data-bgposition="center center"
                                         data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="off"
                                         class="rev-slidebg"/>
                                    <div class="tp-caption rs-parallaxlevel-1"
                                         data-x="center" data-hoffset=""
                                         data-y="center" data-voffset="-120"
                                         data-width="['none','none','none','none']"
                                         data-height="['none','none','none','none']"
                                         data-type="image" data-responsive_offset="on"
                                         data-frames='[{"delay":0,"speed":1500,"frame":"0","from":"z:0;rX:0;rY:0;rZ:0;sX:0.9;sY:0.9;skX:0;skY:0;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]'
                                         data-textAlign="['inherit','inherit','inherit','inherit']"
                                         data-paddingtop="[0,0,0,0]" data-paddingright="[0,0,0,0]"
                                         data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]">
                                        <img src="images/slider/slide_8.png" alt=""/>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="section section-bg-1 section-cover pt-17 pb-3">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="mt-3 mb-3">
                            <img src="images/oranges.png" alt=""/>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="mb-1 section-pretitle default-left">Welcome to</div>
                        <h2 class="section-title mtn-2 mb-3">Organik 商店</h2>
                        <p class="mb-4">
                            Organik商店于1990年开业，RenéeElliott的梦想是提供最好和最广泛的有机食品，她的使命是促进社区健康，并为食品购物带来探索和冒险感。
                        </p>
                        <a class="organik-btn arrow" href="#">我们的产品</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="section border-bottom mt-6 mb-5">
            <div class="container">
                <div class="row">
                    <div class="organik-process">
                        <div class="col-md-3 col-sm-6 organik-process-small-icon-step">
                            <div class="icon">
                                <i class="organik-delivery"></i>
                            </div>
                            <div class="content">
                                <div class="title">免费送货</div>
                                <div class="text">所有订单满66元免运费</div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 organik-process-small-icon-step">
                            <div class="icon">
                                <i class="organik-hours-support"></i>
                            </div>
                            <div class="content">
                                <div class="title">服务支持</div>
                                <div class="text">7*24全天候支持</div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 organik-process-small-icon-step">
                            <div class="icon">
                                <i class="organik-credit-card"></i>
                            </div>
                            <div class="content">
                                <div class="title">安全支付</div>
                                <div class="text">安全有保障</div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 organik-process-small-icon-step">
                            <div class="icon">
                                <i class="organik-lettuce"></i>
                            </div>
                            <div class="content">
                                <div class="title">用心制作</div>
                                <div class="text">最好的服务</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="section pt-12 pb-9">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="text-center mb-1 section-pretitle">发现</div>
                        <h2 class="text-center section-title mtn-2">我们的产品</h2>
                        <div class="organik-seperator center">
                            <span class="sep-holder"><span class="sep-line"></span></span>
                            <div class="sep-icon"><i class="organik-flower"></i></div>
                            <span class="sep-holder"><span class="sep-line"></span></span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12 p-0">
                        <div class="text-center">
                            <ul class="masonry-filter">
                                <li><a href="#" data-filter="" class="active">所有商品</a></li>
                                <li><a href="#" data-filter=".FRU">新鲜水果</a></li>
                                <li><a href="#" data-filter=".SEA">海鲜水产</a></li>
                                <li><a href="#" data-filter=".PBM">猪牛羊肉</a></li>
                                <li><a href="#" data-filter=".POU">禽类蛋品</a></li>
                                <li><a href="#" data-filter=".VEG">新鲜蔬菜</a></li>
                                <li><a href="#" data-filter=".FRO">速冻食品</a></li>
                                <li><a href="#" data-filter=".CAK">乳品糕点</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="product-grid masonry-grid-post">
                        <c:forEach items="${requestScope.indexitems}" var="item">
                            <c:choose>
                                <c:when test="${item.kind eq 'FRU'}">
                                    <div class="col-md-3 col-sm-6 product-item masonry-item text-center FRU">
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
                                </c:when>
                                <c:when test="${item.kind eq 'SEA'}">
                                    <div class="col-md-3 col-sm-6 product-item masonry-item text-center SEA">
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
                                </c:when>
                                <c:when test="${item.kind eq 'PBM'}">
                                    <div class="col-md-3 col-sm-6 product-item masonry-item text-center PBM">
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
                                            <a href="${pageContext.request.contextPath}/item?itemid=?${item.id}">
                                                <h2 class="title">${item.name}</h2>
                                                <span class="price">
										<ins>${item.value}</ins>
									</span>
                                            </a>
                                        </div>
                                    </div>
                                </c:when>
                                <c:when test="${item.kind eq 'POU'}">
                                    <div class="col-md-3 col-sm-6 product-item masonry-item text-center POU">
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
                                            <a href="${pageContext.request.contextPath}/item?itemid${item.id}">
                                                <h2 class="title">${item.name}</h2>
                                                <span class="price">
										<ins>${item.value}</ins>
									</span>
                                            </a>
                                        </div>
                                    </div>
                                </c:when>
                                <c:when test="${item.kind eq 'VEG'}">
                                    <div class="col-md-3 col-sm-6 product-item masonry-item text-center VEG">
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
                                </c:when>
                                <c:when test="${item.kind eq 'FRO'}">
                                    <div class="col-md-3 col-sm-6 product-item masonry-item text-center FRO">
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
                                </c:when>
                                <c:when test="${item.kind eq 'CAK'}">
                                    <div class="col-md-3 col-sm-6 product-item masonry-item text-center CAK">
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
                                </c:when>
                            </c:choose>
                        </c:forEach>
                    </div>
                    <div class="loadmore-contain">
                        <a class="organik-btn small" href="#"> Load more </a>
                    </div>
                </div>
            </div>
        </div>
        <%--<div class="section pt-12">--%>
            <%--<div class="container">--%>
                <%--<div class="row">--%>
                    <%--<div class="col-sm-12">--%>
                        <%--<div class="text-center mb-1 section-pretitle">Latest</div>--%>
                        <%--<h2 class="text-center section-title mtn-2">From our blog</h2>--%>
                        <%--<div class="organik-seperator center mb-6">--%>
                            <%--<span class="sep-holder"><span class="sep-line"></span></span>--%>
                            <%--<div class="sep-icon"><i class="organik-flower"></i></div>--%>
                            <%--<span class="sep-holder"><span class="sep-line"></span></span>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="row">--%>
                    <%--<div class="col-md-4">--%>
                        <%--<div class="blog-grid-item">--%>
                            <%--<div class="post-thumbnail">--%>
                                <%--<a href="#">--%>
                                    <%--<img src="images/blog/blog_1.jpg" alt=""/>--%>
                                <%--</a>--%>
                            <%--</div>--%>
                            <%--<div class="post-content">--%>
                                <%--<div class="entry-meta">--%>
									<%--<span class="posted-on">--%>
										<%--<i class="ion-calendar"></i>--%>
										<%--<span>August 9, 2016</span>--%>
									<%--</span>--%>
                                    <%--<span class="comment">--%>
										<%--<i class="ion-chatbubble-working"></i> 0--%>
									<%--</span>--%>
                                <%--</div>--%>
                                <%--<a href="#">--%>
                                    <%--<h1 class="entry-title">How to steam &amp; purée your sugar pie pumkin</h1>--%>
                                <%--</a>--%>
                                <%--<div class="entry-content">--%>
                                    <%--Cut the halves into smaller pieces and place in a large pot of water with a steam--%>
                                    <%--basket to keep the pumpkin pieces from touching…--%>
                                <%--</div>--%>
                                <%--<div class="entry-more">--%>
                                    <%--<a href="#">Read more</a>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="col-md-4">--%>
                        <%--<div class="blog-grid-item">--%>
                            <%--<div class="post-thumbnail">--%>
                                <%--<a href="#">--%>
                                    <%--<img src="images/blog/blog_2.jpg" alt=""/>--%>
                                <%--</a>--%>
                            <%--</div>--%>
                            <%--<div class="post-content">--%>
                                <%--<div class="entry-meta">--%>
									<%--<span class="posted-on">--%>
										<%--<i class="ion-calendar"></i>--%>
										<%--<span>August 9, 2016</span>--%>
									<%--</span>--%>
                                    <%--<span class="comment">--%>
										<%--<i class="ion-chatbubble-working"></i> 0--%>
									<%--</span>--%>
                                <%--</div>--%>
                                <%--<a href="#">--%>
                                    <%--<h1 class="entry-title">Great bulk recipes to help use all your organic--%>
                                        <%--vegetables</h1>--%>
                                <%--</a>--%>
                                <%--<div class="entry-content">--%>
                                    <%--A fridge full of organic vegetables purchased or harvested with the best of--%>
                                    <%--intentions, and then life gets busy, leaving no time to peel,--%>
                                <%--</div>--%>
                                <%--<div class="entry-more">--%>
                                    <%--<a href="#">Read more</a>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="col-md-4">--%>
                        <%--<div class="blog-grid-item">--%>
                            <%--<div class="post-thumbnail">--%>
                                <%--<a href="#">--%>
                                    <%--<img src="images/blog/blog_1.jpg" alt=""/>--%>
                                <%--</a>--%>
                            <%--</div>--%>
                            <%--<div class="post-content">--%>
                                <%--<div class="entry-meta">--%>
									<%--<span class="posted-on">--%>
										<%--<i class="ion-calendar"></i>--%>
										<%--<span>August 9, 2016</span>--%>
									<%--</span>--%>
                                    <%--<span class="comment">--%>
										<%--<i class="ion-chatbubble-working"></i> 0--%>
									<%--</span>--%>
                                <%--</div>--%>
                                <%--<a href="#">--%>
                                    <%--<h1 class="entry-title">How can salmon be raised organically in fish farms?</h1>--%>
                                <%--</a>--%>
                                <%--<div class="entry-content">--%>
                                    <%--Organic food consumption is rapidly increasing. The heightened interest in the--%>
                                    <%--global environment and a willingness to look--%>
                                <%--</div>--%>
                                <%--<div class="entry-more">--%>
                                    <%--<a href="#">Read more</a>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="row">--%>
                    <%--<div class="col-sm-12">--%>
                        <%--<hr class="mt-7 mb-3"/>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="section pt-2 pb-4">--%>
            <%--<div class="container">--%>
                <%--<div class="row">--%>
                    <%--<div class="col-sm-12">--%>
                        <%--<div class="client-carousel" data-auto-play="true" data-desktop="5" data-laptop="3"--%>
                             <%--data-tablet="3" data-mobile="2">--%>
                            <%--<div class="client-item">--%>
                                <%--<a href="#" target="_blank">--%>
                                    <%--<img src="images/client/client_1.png" alt=""/>--%>
                                <%--</a>--%>
                            <%--</div>--%>
                            <%--<div class="client-item">--%>
                                <%--<a href="#" target="_blank">--%>
                                    <%--<img src="images/client/client_2.png" alt=""/>--%>
                                <%--</a>--%>
                            <%--</div>--%>
                            <%--<div class="client-item">--%>
                                <%--<a href="#" target="_blank">--%>
                                    <%--<img src="images/client/client_3.png" alt=""/>--%>
                                <%--</a>--%>
                            <%--</div>--%>
                            <%--<div class="client-item">--%>
                                <%--<a href="#" target="_blank">--%>
                                    <%--<img src="images/client/client_4.png" alt=""/>--%>
                                <%--</a>--%>
                            <%--</div>--%>
                            <%--<div class="client-item">--%>
                                <%--<a href="#" target="_blank">--%>
                                    <%--<img src="images/client/client_5.png" alt=""/>--%>
                                <%--</a>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
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
<script type="text/javascript" src="js/imagesloaded.pkgd.min.js"></script>
<script type="text/javascript" src="js/isotope.pkgd.min.js"></script>
<script type="text/javascript" src="js/jquery.isotope.init.js"></script>
<script type="text/javascript" src="js/script.js"></script>
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
