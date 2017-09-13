<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>首页</title>
    <link rel="stylesheet" href="static/css/lib/tooltipster.bundle.min.css">
    <link rel="stylesheet" href="static/css/lib/bootstrap.min.css">
    <link rel="stylesheet" href="static/css/lib/swiper-3.4.2.min.css">
    <link rel="stylesheet" href="static/css/style.css">
    <script src="static/js/lib/vue.js"></script>
    <script src="static/js/lib/jquery.min.js"></script>
    <script src="static/js/lib/tooltipster.bundle.min.js"></script>
    <script src="static/js/lib/swiper-3.4.2.jquery.min.js"></script>
    <script src="static/js/app.js"></script>
</head>
<body class="page-index">

<c:import url="./header.jsp">
    <c:param name="nav" value="index"/>
</c:import>

<div class="main">
    <div class="container">
        <div class="row">
            <div class="col-xs-9 no-pr">
                <div class="row">
                    <div class="col-xs-4">
                        <ul class="category">
                            <c:forEach items="${category}" var="cate">
                                <c:if test="${cate.children != null}">
                                    <li class="clearfix">
                                        <span class="category-icon pull-left"
                                            style="background-image: url(http://placehold.it/40x40)"></span>
                                        <span class="pull-left category-title">${cate.value}</span>
                                        <c:forEach items="${cate.children}" var="cate2" end="${1}">
                                            <a href="#" class="pull-left text-link">${cate2.value}</a>
                                        </c:forEach>
                                        <div class="category-detail">
                                            <div class="row">
                                                <c:forEach items="${cate.children}" var="cate3">
                                                    <c:if test="${cate3.keywords != null}">
                                                        <div class="col-xs-6">
                                                            <p class="category-detail-title">${cate3.value}</p>
                                                            <c:forEach items="${cate3.keywords}" var="cate4">
                                                                <a href="#" class="text-link">${cate4}</a>
                                                            </c:forEach>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="col-xs-8 no-pl" style="height: 242px;">
                        <div class="swiper-container h_100">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide"
                                     style="background-image: url(http://placehold.it/600x400/red)">
                                    <!--轮播链接-->
                                    <a href="#"></a>
                                </div>
                                <div class="swiper-slide"
                                     style="background-image: url(http://placehold.it/600x400/#ff0000)">
                                    <a href="#"></a>
                                </div>
                                <div class="swiper-slide"
                                     style="background-image: url(http://placehold.it/600x400/slide3)">
                                    <a href="#"></a>
                                </div>
                            </div>
                            <!-- 如果需要分页器 -->
                            <div class="swiper-pagination"></div>

                            <!-- 如果需要导航按钮 -->
                            <div class="swiper-button-prev swiper-button"></div>
                            <div class="swiper-button-next swiper-button"></div>
                        </div>
                    </div>
                </div>

                <div class="pro-list">
                    <div class="pro-cate-item">
                        <div class="title">
                            <span class="title-text">数码产品</span>
                            <a href="#" class="link-btn">手机</a>
                            <a href="#" class="link-btn">平板</a>
                            <a href="#" class="link-btn">电脑</a>
                            <a href="#" class="link-btn">查看更多</a>
                        </div>
                        <div class="pro-img">
                            <!--只有五条-->
                            <%--<c:forEach items="${数码产品}" var="item">--%>
                            <div class="pro-img-item">
                                <a href="#">
                                    <img src="${item.imgUrl}">
                                </a>
                                <p class="no-m text-right pro-item-title">
                                    <a href="#" class="text-link">${item.title}</a>
                                </p>
                                <h5 class="no-m text-right pro-item-price">${item.price}</h5>
                            </div>
                            <%--</c:forEach>--%>
                            <div class="pro-img-item">
                                <a href="#">
                                    <img src="http://placehold.it/200x200">
                                </a>
                                <p class="no-m text-right pro-item-title">
                                    <a href="#" class="text-link">商品商品商品商品</a>
                                </p>
                                <h5 class="no-m text-right pro-item-price">￥25.00</h5>
                            </div>
                            <div class="pro-img-item">
                                <a href="#">
                                    <img src="http://placehold.it/200x200">
                                </a>
                                <p class="no-m text-right pro-item-title">
                                    <a href="#" class="text-link">商品商品商品商品</a>
                                </p>
                                <h5 class="no-m text-right pro-item-price">￥25.00</h5>
                            </div>
                            <div class="pro-img-item">
                                <a href="#">
                                    <img src="http://placehold.it/200x200">
                                </a>
                                <p class="no-m text-right pro-item-title">
                                    <a href="#" class="text-link">商品商品商品商品</a>
                                </p>
                                <h5 class="no-m text-right pro-item-price">￥25.00</h5>
                            </div>
                            <div class="pro-img-item">
                                <a href="#">
                                    <img src="http://placehold.it/200x200">
                                </a>
                                <p class="no-m text-right pro-item-title">
                                    <a href="#" class="text-link">商品商品商品商品</a>
                                </p>
                                <h5 class="no-m text-right pro-item-price">￥25.00</h5>
                            </div>
                        </div>
                    </div>
                    <div class="pro-cate-item">
                        <div class="title">
                            <span class="title-text">数码产品</span>
                            <a href="#" class="link-btn">手机</a>
                            <a href="#" class="link-btn">平板</a>
                            <a href="#" class="link-btn">电脑</a>
                            <a href="#" class="link-btn">查看更多</a>
                        </div>
                        <div class="pro-img">
                            <!--只有五条-->
                            <div class="pro-img-item">
                                <a href="#">
                                    <img src="http://placehold.it/200x200">
                                </a>
                                <p class="no-m text-right pro-item-title">
                                    <a href="#" class="text-link">商品商品商品商品</a>
                                </p>
                                <h5 class="no-m text-right pro-item-price">￥25.00</h5>
                            </div>
                            <div class="pro-img-item">
                                <a href="#">
                                    <img src="http://placehold.it/200x200">
                                </a>
                                <p class="no-m text-right pro-item-title">
                                    <a href="#" class="text-link">商品商品商品商品</a>
                                </p>
                                <h5 class="no-m text-right pro-item-price">￥25.00</h5>
                            </div>
                            <div class="pro-img-item">
                                <a href="#">
                                    <img src="http://placehold.it/200x200">
                                </a>
                                <p class="no-m text-right pro-item-title">
                                    <a href="#" class="text-link">商品商品商品商品</a>
                                </p>
                                <h5 class="no-m text-right pro-item-price">￥25.00</h5>
                            </div>
                            <div class="pro-img-item">
                                <a href="#">
                                    <img src="http://placehold.it/200x200">
                                </a>
                                <p class="no-m text-right pro-item-title">
                                    <a href="#" class="text-link">商品商品商品商品</a>
                                </p>
                                <h5 class="no-m text-right pro-item-price">￥25.00</h5>
                            </div>
                            <div class="pro-img-item">
                                <a href="#">
                                    <img src="http://placehold.it/200x200">
                                </a>
                                <p class="no-m text-right pro-item-title">
                                    <a href="#" class="text-link">商品商品商品商品</a>
                                </p>
                                <h5 class="no-m text-right pro-item-price">￥25.00</h5>
                            </div>
                        </div>
                    </div>
                    <div class="pro-cate-item">
                        <div class="title">
                            <span class="title-text">数码产品</span>
                            <a href="#" class="link-btn">手机</a>
                            <a href="#" class="link-btn">平板</a>
                            <a href="#" class="link-btn">电脑</a>
                            <a href="#" class="link-btn">查看更多</a>
                        </div>
                        <div class="pro-img">
                            <!--只有五条-->
                            <div class="pro-img-item">
                                <a href="#">
                                    <img src="http://placehold.it/200x200">
                                </a>
                                <p class="no-m text-right pro-item-title">
                                    <a href="#" class="text-link">商品商品商品商品</a>
                                </p>
                                <h5 class="no-m text-right pro-item-price">￥25.00</h5>
                            </div>
                            <div class="pro-img-item">
                                <a href="#">
                                    <img src="http://placehold.it/200x200">
                                </a>
                                <p class="no-m text-right pro-item-title">
                                    <a href="#" class="text-link">商品商品商品商品</a>
                                </p>
                                <h5 class="no-m text-right pro-item-price">￥25.00</h5>
                            </div>
                            <div class="pro-img-item">
                                <a href="#">
                                    <img src="http://placehold.it/200x200">
                                </a>
                                <p class="no-m text-right pro-item-title">
                                    <a href="#" class="text-link">商品商品商品商品</a>
                                </p>
                                <h5 class="no-m text-right pro-item-price">￥25.00</h5>
                            </div>
                            <div class="pro-img-item">
                                <a href="#">
                                    <img src="http://placehold.it/200x200">
                                </a>
                                <p class="no-m text-right pro-item-title">
                                    <a href="#" class="text-link">商品商品商品商品</a>
                                </p>
                                <h5 class="no-m text-right pro-item-price">￥25.00</h5>
                            </div>
                            <div class="pro-img-item">
                                <a href="#">
                                    <img src="http://placehold.it/200x200">
                                </a>
                                <p class="no-m text-right pro-item-title">
                                    <a href="#" class="text-link">商品商品商品商品</a>
                                </p>
                                <h5 class="no-m text-right pro-item-price">￥25.00</h5>
                            </div>
                        </div>
                    </div>
                    <div class="pro-cate-item">
                        <div class="title">
                            <span class="title-text">数码产品</span>
                            <a href="#" class="link-btn">手机</a>
                            <a href="#" class="link-btn">平板</a>
                            <a href="#" class="link-btn">电脑</a>
                            <a href="#" class="link-btn">查看更多</a>
                        </div>
                        <div class="pro-img">
                            <!--只有五条-->
                            <div class="pro-img-item">
                                <a href="#">
                                    <img src="http://placehold.it/200x200">
                                </a>
                                <p class="no-m text-right pro-item-title">
                                    <a href="#" class="text-link">商品商品商品商品</a>
                                </p>
                                <h5 class="no-m text-right pro-item-price">￥25.00</h5>
                            </div>
                            <div class="pro-img-item">
                                <a href="#">
                                    <img src="http://placehold.it/200x200">
                                </a>
                                <p class="no-m text-right pro-item-title">
                                    <a href="#" class="text-link">商品商品商品商品</a>
                                </p>
                                <h5 class="no-m text-right pro-item-price">￥25.00</h5>
                            </div>
                            <div class="pro-img-item">
                                <a href="#">
                                    <img src="http://placehold.it/200x200">
                                </a>
                                <p class="no-m text-right pro-item-title">
                                    <a href="#" class="text-link">商品商品商品商品</a>
                                </p>
                                <h5 class="no-m text-right pro-item-price">￥25.00</h5>
                            </div>
                            <div class="pro-img-item">
                                <a href="#">
                                    <img src="http://placehold.it/200x200">
                                </a>
                                <p class="no-m text-right pro-item-title">
                                    <a href="#" class="text-link">商品商品商品商品</a>
                                </p>
                                <h5 class="no-m text-right pro-item-price">￥25.00</h5>
                            </div>
                            <div class="pro-img-item">
                                <a href="#">
                                    <img src="http://placehold.it/200x200">
                                </a>
                                <p class="no-m text-right pro-item-title">
                                    <a href="#" class="text-link">商品商品商品商品</a>
                                </p>
                                <h5 class="no-m text-right pro-item-price">￥25.00</h5>
                            </div>
                        </div>
                    </div>
                    <div class="pro-cate-item">
                        <div class="title">
                            <span class="title-text">数码产品</span>
                            <a href="#" class="link-btn">手机</a>
                            <a href="#" class="link-btn">平板</a>
                            <a href="#" class="link-btn">电脑</a>
                            <a href="#" class="link-btn">查看更多</a>
                        </div>
                        <div class="pro-img">
                            <!--只有五条-->
                            <div class="pro-img-item">
                                <a href="#">
                                    <img src="http://placehold.it/200x200">
                                </a>
                                <p class="no-m text-right pro-item-title">
                                    <a href="#" class="text-link">商品商品商品商品</a>
                                </p>
                                <h5 class="no-m text-right pro-item-price">￥25.00</h5>
                            </div>
                            <div class="pro-img-item">
                                <a href="#">
                                    <img src="http://placehold.it/200x200">
                                </a>
                                <p class="no-m text-right pro-item-title">
                                    <a href="#" class="text-link">商品商品商品商品</a>
                                </p>
                                <h5 class="no-m text-right pro-item-price">￥25.00</h5>
                            </div>
                            <div class="pro-img-item">
                                <a href="#">
                                    <img src="http://placehold.it/200x200">
                                </a>
                                <p class="no-m text-right pro-item-title">
                                    <a href="#" class="text-link">商品商品商品商品</a>
                                </p>
                                <h5 class="no-m text-right pro-item-price">￥25.00</h5>
                            </div>
                            <div class="pro-img-item">
                                <a href="#">
                                    <img src="http://placehold.it/200x200">
                                </a>
                                <p class="no-m text-right pro-item-title">
                                    <a href="#" class="text-link">商品商品商品商品</a>
                                </p>
                                <h5 class="no-m text-right pro-item-price">￥25.00</h5>
                            </div>
                            <div class="pro-img-item">
                                <a href="#">
                                    <img src="http://placehold.it/200x200">
                                </a>
                                <p class="no-m text-right pro-item-title">
                                    <a href="#" class="text-link">商品商品商品商品</a>
                                </p>
                                <h5 class="no-m text-right pro-item-price">￥25.00</h5>
                            </div>
                        </div>
                    </div>
                    <div class="pro-cate-item">
                        <div class="title">
                            <span class="title-text">数码产品</span>
                            <a href="#" class="link-btn">手机</a>
                            <a href="#" class="link-btn">平板</a>
                            <a href="#" class="link-btn">电脑</a>
                            <a href="#" class="link-btn">查看更多</a>
                        </div>
                        <div class="pro-img">
                            <!--只有五条-->
                            <div class="pro-img-item">
                                <a href="#">
                                    <img src="http://placehold.it/200x200">
                                </a>
                                <p class="no-m text-right pro-item-title">
                                    <a href="#" class="text-link">商品商品商品商品</a>
                                </p>
                                <h5 class="no-m text-right pro-item-price">￥25.00</h5>
                            </div>
                            <div class="pro-img-item">
                                <a href="#">
                                    <img src="http://placehold.it/200x200">
                                </a>
                                <p class="no-m text-right pro-item-title">
                                    <a href="#" class="text-link">商品商品商品商品</a>
                                </p>
                                <h5 class="no-m text-right pro-item-price">￥25.00</h5>
                            </div>
                            <div class="pro-img-item">
                                <a href="#">
                                    <img src="http://placehold.it/200x200">
                                </a>
                                <p class="no-m text-right pro-item-title">
                                    <a href="#" class="text-link">商品商品商品商品</a>
                                </p>
                                <h5 class="no-m text-right pro-item-price">￥25.00</h5>
                            </div>
                            <div class="pro-img-item">
                                <a href="#">
                                    <img src="http://placehold.it/200x200">
                                </a>
                                <p class="no-m text-right pro-item-title">
                                    <a href="#" class="text-link">商品商品商品商品</a>
                                </p>
                                <h5 class="no-m text-right pro-item-price">￥25.00</h5>
                            </div>
                            <div class="pro-img-item">
                                <a href="#">
                                    <img src="http://placehold.it/200x200">
                                </a>
                                <p class="no-m text-right pro-item-title">
                                    <a href="#" class="text-link">商品商品商品商品</a>
                                </p>
                                <h5 class="no-m text-right pro-item-price">￥25.00</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-3" id="app-rank" v-cloak>
                <div class="rank-wrap" id="rank-wrap">
                    <div class="rank-title">
                        TOP 10 排行
                        <span class="rank-select html-tooltip pull-right" data-tooltip-content="#rank-select-panel">
                            最新
                            <i class="rank-select-arrow"></i>
                        </span>
                        <div class="rank-select-panel tooltip-content" id="rank-select-panel">
                            <p>最新</p>
                            <p>最热</p>
                            <p>降幅最大</p>
                        </div>
                    </div>
                    <div class="rank">
                        <div class="rank-item" v-for="i in 10">
                            <div class="rank-item-visible">
                                <span class="rank-item-index">{{i}}</span>
                                <div class="rank-item-link">
                                    <p class="text-ellipsis">
                                        <a href="#" class="text-link" title="全名">商品商品商品商品商品商品商品商品</a>
                                    </p>
                                </div>
                                <div class="rank-item-price">￥125767.00</div>
                            </div>
                            <div class="rank-item-hidden clearfix">
                                <div class="rank-item-img pull-left"
                                     style="background-image: url(http://placehold.it/60x60)"></div>
                                <div class="rank-item-desc">述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="footer">
    <div class="footer-top">
        <div class="container">
            footer
        </div>
    </div>
    <div class="footer-bottom">

    </div>
</div>
<script>
    var mySwiper = new Swiper('.swiper-container', {
        loop: true,
        autoplay: 4000,
        paginationClickable: true,

        // 如果需要分页器
        pagination: '.swiper-pagination',

        // 如果需要前进后退按钮
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev'

    })
</script>
</body>
</html>