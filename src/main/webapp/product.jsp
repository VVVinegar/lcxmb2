<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${product.title}</title>
    <link rel="stylesheet" href="/static/css/lib/iview.min.css">
    <link rel="stylesheet" href="/static/css/lib/swiper-3.4.2.min.css">
    <link rel="stylesheet" href="/static/css/lib/tooltipster.bundle.min.css">
    <link rel="stylesheet" href="/static/css/lib/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/style.css">
    <script src="/static/js/lib/vue.js"></script>
    <script src="/static/js/lib/iview.min.js"></script>
    <script src="/static/js/lib/jquery.min.js"></script>
    <script src="/static/js/lib/swiper-3.4.2.jquery.min.js"></script>
    <script src="/static/js/lib/tooltipster.bundle.min.js"></script>
    <script src="/static/js/app.js"></script>
</head>
<body class="page-product">

<c:import url="./header.jsp">
    <c:param name="from" value="/product/${product.id}"/>
    <c:param name="nav" value="search" />
</c:import>

<input type="hidden" id="productId" value="${product.id}">
<div class="main container-s">
    <div class="bread-nav">
        您的位置：
        <a href="/" class="text-link">首页</a> &gt;
        <span>闲置详情</span> &gt;
        <span>${product.title}</span>
    </div>
    <div class="pro-top">
        <div class="pro-top-line"></div>
        <div class="pro-top-main clearfix">
            <div class="user-info html-tooltip" data-tooltip-content="#user-info-tooltiptpl">
                <img src="${saler.avatarUrl}" class="back-place">
                <p>
                    <a href="#" class="text-link">${product.salerUser}</a>
                    <span class="arrow_b"></span>
                </p>
            </div>
            <div id="user-info-tooltiptpl" class="tooltip-content user-info-tooltip">
                <p class="no-m">男</p>
                <p class="no-m">注册时间：
                    <fmt:formatDate value="${saler.createTime}" type="both"/>
                </p>
                <div class="line" style="margin: 8px 0"></div>

                <c:if test="${saler.credits == 100}">
                    <c:set var="credits_class" value="eq-100" />
                </c:if>
                <c:if test="${saler.credits > 80}">
                    <c:set var="credits_class" value="gt-80" />
                </c:if>
                <c:if test="${saler.credits > 60}">
                    <c:set var="credits_class" value="gt-60" />
                </c:if>
                <c:if test="${saler.credits <= 60}">
                    <c:set var="credits_class" value="lt-60" />
                </c:if>

                <p class="no-m">信誉度：<span class="credits ${credits_class}">${saler.credits}</span></p>
            </div>
            <div class="pro-info clearfix">
                <div class="visited-count text-center pro-info-item">
                    <p class="text-color">宝贝浏览次数</p>
                    <p>${product.watchCount}</p>
                </div>
                <div class="update-time text-center pro-info-item">
                    <p class="text-color">上次更新时间</p>
                    <p><fmt:formatDate type="both"
                                       value="${product.updateTime}" /></p>
                </div>
            </div>
        </div>
    </div>
    <div class="pro-middle">
        <div class="row">
            <div class="col-xs-7">
                <c:set var="productsImgUrls" value="${product.imgUrls}" />
                <c:set var="productsImgUrlsArr" value="${fn:split(productsImgUrls, ',')}" />
                <div class="swiper-container gallery-top">
                    <div class="swiper-wrapper">
                        <c:forEach items="${productsImgUrlsArr}" var="img">
                            <div class="swiper-slide">
                                <img src="${img}">
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div style="padding: 0 50px">
                    <div class="gallery-thumbs-wrapper">
                        <div class="swiper-container gallery-thumbs">
                            <div class="swiper-wrapper">
                                <c:forEach items="${productsImgUrlsArr}" var="img">
                                    <div class="swiper-slide" style="background-image:url(${img})"></div>
                                </c:forEach>
                            </div>
                        </div>

                        <!-- Add Arrows -->
                        <div class="swiper-button-next swiper-button-white">
                            <div class="arrow arrow_r"></div>
                        </div>
                        <div class="swiper-button-prev swiper-button-white">
                            <div class="arrow arrow_l"></div>
                        </div>
                    </div>
                </div>
                <div class="pro-tabs" id="app-comments" v-cloak>
                    <div class="tabs-bar">
                        <div class="tabs-item" :class="{active: showPanel1 === true}" @click="togglePanel">留言</div>
                        <div class="tabs-item" :class="{active: showPanel1 === false}" @click="togglePanel">宝贝详情</div>
                    </div>
                    <div class="tabs-panel">
                        <div class="tabs-panel-item" :class="{active: showPanel1 === true}">
                            <ul class="comment-panel">
                                <c:if test="${fn:length(comments) == 0}">
                                    <p class="text-center no-m">暂无评论</p>
                                </c:if>
                                <c:forEach items="${comments}" var="item">
                                    <li>
                                        <img src="${item.commenterAvatar}">
                                        <p class="no-m">
                                            <a href="#" class="text-link">${item.commenter}</a>
                                            <c:if test="${item.replyer != ''}">
                                                回复 <a href="#" class="text-link">${item.replyer}</a>
                                            </c:if>：
                                            ${item.content}
                                        </p>
                                        <p class="no-m text-color">
                                            <fmt:formatDate type="both" value="${item.createTime}" />
                                            <a href="javascript:;" class="text-link" style="margin-left: 10px;" @click="setReplyer('${item.commenter}')">回复</a>
                                        </p>
                                    </li>
                                </c:forEach>
                            </ul>
                            <div class="comment-control">
                                <div class="alert alert-warning alert-dismissible" role="alert" v-show="replyer">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close" @click="setReplyer(null)">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                    <strong>正在回复</strong> {{replyer}}:
                                </div>

                                <div class="comment-tr">
                                    <textarea v-model="content" rows="4" placeholder="发表评论..." maxlength="120" id="comment-tr"></textarea>
                                </div>

                                <div class="comment-tr-btm">
                                    <span class="comment-submit pull-right" @click="submit">发表</span>
                                    <span class="comment-limit pull-right">
                                        <i style="color: orange" class="count">{{content.length}}</i> / <i>120</i>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="tabs-panel-item" style="font-size: 14px;text-align: justify" :class="{active: showPanel1 === false}" >
                            宝贝详情：${product.desciption}
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-5 no-pl pro-buy">
                <div class="pro-buy-top">
                    <h3 class="no-m" style="margin-bottom: 5px">${product.title}</h3>
                    <p class="pro-buy-p">
                        <span class="p-label" style="vertical-align: text-bottom">价&nbsp;格：</span>
                        <span class="p-value" style="font-size: 24px;font-weight: bold;color: red;vertical-align: inherit">¥
                            <fmt:formatNumber type="number" value="${product.price}" pattern="0.00" maxFractionDigits="2"/>
                            <i class="pull-right collect-btn">加入收藏</i>
                        </span>
                    </p>
                    <div class="line" style="margin-bottom: 10px;"></div>
                    <p class="pro-buy-p">
                        <span class="p-label">成色：</span>
                        <span>${product.quality} 成新</span>
                    </p>
                    <p class="pro-buy-p">
                        <span class="p-label">联系方式：</span>
                        <span class="p-value">${product.telNum}</span>
                    </p>
                    <p class="pro-buy-p">
                        <span class="p-label">宝贝描述：</span>
                        <span class="p-value">${fn:substring(product.desciption, 0, 50)}</span>
                    </p>
                    <c:if test="${sessionScope.username != null}">
                        <a href="/pay?p_id=${product.id}" class="confirm-btn">立即购买</a>
                    </c:if>

                    <c:if test="${sessionScope.username == null}">
                        <a href="/login?from=/product/${product.id}" class="confirm-btn">立即购买</a>
                    </c:if>

                    <p class="pro-warn">
                        如遇到以下情况可能是诈骗行为：
                        <span style="color: red">1.宝贝价格异常低；2.卖家要求QQ沟通；3.卖家要求直接汇款；</span>谨防上当受骗。
                    </p>
                </div>
                <div class="pro-buy-recommend" style="margin-top: 70px;">
                    <div class="recommend-top">
                        <a href="#" class="text-link pull-right">查看更多</a>
                        <h4 class="no-m">该卖家的其他出售(6)</h4>
                    </div>
                    <div class="recommend-body">
                        <div class="row">
                            <div class="col-xs-6">
                                <a href="#">
                                    <img src="http://placehold.it/100x100">
                                </a>
                                <p><a href="#" class="text-link">商品商品商品品商品商品</a></p>
                                <p class="price">¥134.00</p>
                            </div>
                            <div class="col-xs-6">
                                <a href="#">
                                    <img src="http://placehold.it/100x100">
                                </a>
                                <p><a href="#" class="text-link">商品商品商品商品商品品商品商品</a></p>
                                <p class="price">¥134.00</p>
                            </div>
                            <div class="col-xs-6">
                                <a href="#">
                                    <img src="http://placehold.it/100x100">
                                </a>
                                <p><a href="#" class="text-link">商品商品商品商品商品品商品商品</a></p>
                                <p class="price">¥134.00</p>
                            </div>
                            <div class="col-xs-6">
                                <a href="#">
                                    <img src="http://placehold.it/100x100">
                                </a>
                                <p><a href="#" class="text-link">商品商品商品商品商品品商品商品</a></p>
                                <p class="price">¥134.00</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="pro-buy-recommend">
                    <div class="recommend-top">
                        <a href="#" class="text-link pull-right">查看更多</a>
                        <h4 class="no-m">猜你喜欢</h4>
                    </div>
                    <div class="recommend-body">
                        <div class="row">
                            <div class="col-xs-6">
                                <a href="#">
                                    <img src="http://placehold.it/100x100">
                                </a>
                                <p><a href="#" class="text-link">商品商品商品品商品商品</a></p>
                                <p class="price">¥134.00</p>
                            </div>
                            <div class="col-xs-6">
                                <a href="#">
                                    <img src="http://placehold.it/100x100">
                                </a>
                                <p><a href="#" class="text-link">商品商品商品商品商品品商品商品</a></p>
                                <p class="price">¥134.00</p>
                            </div>
                            <div class="col-xs-6">
                                <a href="#">
                                    <img src="http://placehold.it/100x100">
                                </a>
                                <p><a href="#" class="text-link">商品商品商品商品商品品商品商品</a></p>
                                <p class="price">¥134.00</p>
                            </div>
                            <div class="col-xs-6">
                                <a href="#">
                                    <img src="http://placehold.it/100x100">
                                </a>
                                <p><a href="#" class="text-link">商品商品商品商品商品品商品商品</a></p>
                                <p class="price">¥134.00</p>
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
	// 商品页swipper
	const galleryTop = new Swiper('.gallery-top', {
		zoom: true,
		nextButton: '.swiper-button-next',
		prevButton: '.swiper-button-prev'
	})

	const galleryThumbs = new Swiper('.gallery-thumbs', {
		spaceBetween: 10,
		slidesPerView: 5,
		centeredSlides: true,
		touchRatio: 0.2,
		autoplay: 5000,
		slideToClickedSlide: true
	})

	galleryTop.params.control = galleryThumbs
	galleryThumbs.params.control = galleryTop
</script>
</body>
</html>