<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${product.title}</title>
    <link rel="stylesheet" href="/static/css/lib/swiper-3.4.2.min.css">
    <link rel="stylesheet" href="/static/css/lib/tooltipster.bundle.min.css">
    <link rel="stylesheet" href="/static/css/lib/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/style.css">
    <script src="/static/js/lib/vue.js"></script>
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

<div class="main container-s">
    <div class="bread-nav">
        您的位置：
        <a href="#" class="text-link">首页</a> &gt;
        <span>闲置详情</span> &gt;
        <span>${product.title}</span>
    </div>
    <div class="pro-top">
        <div class="pro-top-line"></div>
        <div class="pro-top-main clearfix">
            <div class="user-info html-tooltip" data-tooltip-content="#user-info-tooltiptpl">
                <img src="http://placehold.it/100/100" class="back-place">
                <p>
                    <a href="#" class="text-link">${product.salerUser}</a>
                    <span class="arrow_b"></span>
                </p>
            </div>
            <div id="user-info-tooltiptpl" class="tooltip-content user-info-tooltip">
                <p class="no-m">男</p>
                <p class="no-m">注册时间：2017-01-31</p>
                <div class="line" style="margin: 8px 0"></div>
                <p class="no-m">出售过 <strong>0</strong> 笔</p>
                <p class="no-m">信誉度：<span class="credits eq-100">100</span></p>
            </div>
            <div class="pro-info clearfix">
                <div class="visited-count text-center pro-info-item">
                    <p class="text-color">宝贝浏览次数</p>
                    <p>${product.watchCount}</p>
                </div>
                <div class="update-time text-center pro-info-item">
                    <p class="text-color">上次更新时间</p>
                    <p>${product.updateTime}</p>
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
                <div class="pro-tabs">
                    <div class="tabs-bar">
                        <div class="tabs-item active">留言</div>
                        <div class="tabs-item">宝贝详情</div>
                    </div>
                    <div class="tabs-panel">
                        <div class="tabs-panel-item active">
                            <ul class="comment-panel">
                                <li>
                                    <img src="http://placehold.it/40x40">
                                    <p class="no-m">
                                        <a href="#" class="text-link">卖家</a>：
                                        宝贝不错
                                    </p>
                                    <p class="no-m text-color">
                                        2017-01-23 11:34:45
                                        <a href="javascript:;" class="text-link" style="margin-left: 10px;">回复</a>
                                    </p>
                                </li>
                                <li>
                                    <img src="http://placehold.it/40x40">
                                    <p class="no-m">
                                        <a href="#" class="text-link">卖家1</a>
                                        <span>
                                            回复 <a href="#" class="text-link">卖家2</a>
                                        </span>：
                                        宝贝不错
                                    </p>
                                    <p class="no-m text-color">
                                        2017-01-23 11:34:45
                                        <a href="javascript:;" class="text-link" style="margin-left: 10px;">回复</a>
                                    </p>
                                </li>
                            </ul>
                            <div class="comment-control">
                                <div class="comment-tr">
                                    <textarea rows="4" placeholder="发表评论..." maxlength="120"></textarea>
                                </div>
                                <div class="comment-tr-btm">
                                    <span class="comment-submit pull-right">发表</span>
                                    <span class="comment-limit pull-right">
                                        <i style="color: orange" class="count">0</i> / <i>120</i>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="tabs-panel-item" style="font-size: 14px;text-align: justify">
                            宝贝详情：详情详情详情详情详情详情详情
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-5 no-pl pro-buy">
                <div class="pro-buy-top">
                    <h3 class="no-m" style="margin-bottom: 5px">${product.title}</h3>
                    <p class="pro-buy-p">
                        <span class="p-label" style="vertical-align: text-bottom">价&nbsp;格：</span>
                        <span class="p-value" style="font-size: 24px;font-weight: bold;color: red;vertical-align: inherit">
                            ¥<fmt:formatNumber type="number" value="${product.price}" pattern="0.00" maxFractionDigits="2"/>
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
                        <button class="btn btn-success" style="font-size: 12px;">获取联系方式</button>
                    </p>
                    <p class="pro-buy-p">
                        <span class="p-label">宝贝描述：</span>
                        <c:set var="descriptionSub" value="${fn:substring(product.desciption, 0, 50)}"/>
                        <span class="p-value"></span>
                    </p>
                    <div class="confirm-btn">立即购买</div>
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