<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
                                            style="background-image: url(${cate.img_url})"></span>
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
                                     style="background-image: url(http://ow408mv5t.bkt.clouddn.com/a44cffed805b5e8982a40090fd4695f6.jpg)">
                                    <a href="#"></a>
                                </div>
                                <div class="swiper-slide"
                                     style="background-image: url(http://ow408mv5t.bkt.clouddn.com/0ca2bd29afb3d7c1d92afeeb2bff8869.jpg)">
                                    <a href="#"></a>
                                </div>
                                <div class="swiper-slide"
                                     style="background-image: url(http://ow408mv5t.bkt.clouddn.com/254c961ec98a78fd7fb2ad7c413d513c.jpg)">
                                    <!--轮播链接-->
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
                    <c:forEach items="${newCates}" var="n_cate" varStatus="st">
                        <div class="pro-cate-item">
                            <div class="title">
                                <span class="title-text">${category[st.index].value}</span>
                                <c:forEach items="${category[st.index].children}" var="item">
                                    <c:if test="${item.value != '其他'}">
                                        <a href="#" class="link-btn">${item.value}</a>
                                    </c:if>
                                </c:forEach>
                            </div>
                            <div class="pro-img">
                                <c:forEach items="${n_cate}" var="n_cate_1">
                                    <div class="pro-img-item">
                                        <a href="#">
                                            <c:set var="imgurl" value="${fn:split(n_cate_1.imgUrls, ',')}" />
                                            <img src="${imgurl[0]}">
                                        </a>
                                        <p class="no-m text-right pro-item-title">
                                            <a href="#" class="text-link">${fn:substring(n_cate_1.title, 0, 12)}</a>
                                        </p>
                                        <h5 class="no-m text-right pro-item-price">
                                            <fmt:formatNumber type="number" value="${n_cate_1.price}" pattern="0.00" maxFractionDigits="2"/>
                                        </h5>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </c:forEach>
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
                            <p @click="requestData('new')">最新</p>
                            <p @click="requestData('hot')">最热</p>
                            <p @click="requestData('desc')">降幅最大</p>
                        </div>
                    </div>
                    <div class="rank">
                        <div class="rank-item" v-for="(item, index) in list" :key="Math.random() + index">
                            <div class="rank-item-visible">
                                <span class="rank-item-index">{{index}}</span>
                                <div class="rank-item-link">
                                    <p class="text-ellipsis">
                                        <a href="#" class="text-link">{{item.title}}</a>
                                    </p>
                                </div>
                                <div class="rank-item-price">￥{{item.price.toFixed(2)}}</div>
                            </div>
                            <div class="rank-item-hidden clearfix">
                                <div class="rank-item-img pull-left">
                                    <a :href="'/product/'+item.id">
                                        <img :src="item.imgUrls.split(',')[0]" style="width: 100%">
                                    </a>
                                </div>
                                <div class="rank-item-desc">
                                    {{item.desciption.substring(0, 26)}}
                                    <p v-if="type=='new'" class="ab_item text-color">{{item.updateTime | fromNow}}</p>
                                    <p v-else-if="type == 'hot'" class="ab_item">
                                        <span style="padding: 1px 5px;color: #fff;background-color: orangered">热度：{{item.watchCount}}</span>
                                    </p>
                                    <p v-else class="ab_item">
                                        <span style="padding: 1px 5px;color: #fff;background-color: orange">降价：{{item.priceChanged}} 元</span>
                                    </p>
                                </div>
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