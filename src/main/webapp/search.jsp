<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="static/css/lib/tooltipster.bundle.min.css">
    <link rel="stylesheet" href="static/css/lib/bootstrap.min.css">
    <link rel="stylesheet" href="static/css/style.css">
    <script src="static/js/lib/vue.js"></script>
    <script src="static/js/lib/jquery.min.js"></script>
    <script src="static/js/lib/tooltipster.bundle.min.js"></script>
    <script src="static/js/app.js"></script>
</head>
<body class="page-search">

<c:import url="./header.jsp">
    <c:param name="from" value="/search"/>
    <c:param name="nav" value="search" />
</c:import>

<c:set var="rsLen" value="${totalPage}" />
<div class="main">
    <div class="container-s">
        <div class="bread-nav">
            您的位置：
            <a href="#" class="text-link">首页</a> &gt;
            <span>${isCate ? '分类' : '搜索'}</span>
            <span>&gt; ${keywords}</span>
            （共 ${rsLen} 条结果）
        </div>
        <div class="control clearfix">
            <div class="control-btns">
                <a href="/search?isCate=${isCate}&newOrHot=0&lowOrHigh=${lowOrHigh}"
                   class="${newOrHot == 0 ? 'active' : ''}">最新</a>
                <a href="/search?isCate=${isCate}&newOrHot=1&lowOrHigh=${lowOrHigh}"
                   class="${newOrHot == 1 ? 'active' : ''}">最热</a>
                <a href="/search?isCate=${isCate}&newOrHot=${newOrHot}&lowOrHigh=0"
                   class="${lowOrHigh == 0 ? 'active' : ''}">价格最低</a>
                <a href="/search?isCate=${isCate}&newOrHot=${newOrHot}&lowOrHigh=1"
                   class="${lowOrHigh == 1 ? 'active' : ''}">价格最高</a>
            </div>
            <div class="control-price" div="app-search-price">
                <div class="control-price-input-wrap">
                    <span>￥</span>
                    <input type="number" class="control-price-input" id="minPrice" value="${minPrice}">
                </div>
                -
                <div class="control-price-input-wrap">
                    <span>￥</span>
                    <input type="number" class="control-price-input" id="maxPrice" value="${maxPrice}">
                </div>


                <div class="control-price-confirm" style="display: inline-block">确定</div>
            </div>
        </div>
        <div class="cate-list">
            <div class="row">

                <c:if test="${totalPage == 0}">
                    <h3 class="no-m text-center" style="font-weight: normal;margin-top: 40px;">抱歉！没有任何您想要的东西。</h3>
                </c:if>

                <c:forEach items="${products}" var="product">
                    <c:if test="${totalPage != 0}">
                        <div class="col-xs-3">
                            <div class="cate-item">
                                <div class="cate-item-top clearfix">
                                    <img src="${product.avatarUrl}" class="pull-left">
                                    <p class="no-m cate-item-username">
                                        <a href="#" class="text-link">${product.salerUser}</a>
                                    </p>
                                </div>
                                <div class="cate-item-middle">
                                    <a href="/product/${product.id}">
                                        <c:set var="imgUrls" value="${fn:split(product.imgUrls, ',')}" />
                                        <img src="${imgUrls[0]}">
                                    </a>
                                </div>
                                <p style="margin-top: 8px;margin-bottom: 8px">
                            <span class="cate-item-time">
                                <fmt:formatDate value="${product.updateTime}" type="both" />
                            </span>
                                    <span class="cate-item-price  pull-right">￥${product.price}</span>
                                </p>
                                <div class="line"></div>
                                <div class="cate-item-bottom" style="margin-top: 8px;">
                                    <a href="/product/${product.id}" class="text-link">${product.title}</a>
                                </div>
                            </div>
                        </div>
                    </c:if>

                </c:forEach>
            </div>
        </div>

        <c:if test="${rsLen != 0}">
            <nav class="text-center">
                <ul class="pagination">
                    <fmt:formatNumber var="totalPage" type="number" value="${(rsLen-rsLen%pageSize)/pageSize + 1}" maxFractionDigits="0" pattern="#"/>

                    <c:if test="${currentPage != 1}">
                        <li>
                            <a href="/search?isCate=${isCate}&newOrHot=${newOrHot}&lowOrHigh=${lowOrHigh}&page=${currentPage - 1}">上一页</a>
                        </li>
                    </c:if>
                    <c:forEach begin="${1}" end="${totalPage}" var="i">
                        <li class="${i == currentPage ? 'active' : ''}">
                            <a href="/search?isCate=${isCate}&newOrHot=${newOrHot}&lowOrHigh=${lowOrHigh}&page=${i}">${i}</a>
                        </li>
                    </c:forEach>

                    <c:if test="${currentPage != totalPage}">
                        <li><a href="/search?isCate=${isCate}&newOrHot=${newOrHot}&lowOrHigh=${lowOrHigh}&page=${currentPage + 1}">下一页</a></li>
                    </c:if>
                </ul>
            </nav>
        </c:if>
    </div>
</div>
</div>

<script>
    $('.control-price-confirm').on('click', function () {
        console.log(1)
        var minPrice = $('#minPrice').val()
        var maxPrice = $('#maxPrice').val()
        location.href = '/search?isCate=${isCate}&newOrHot=${newOrHot}&lowOrHigh=${lowOrHigh}&page=${currentPage}&minPrice=' + minPrice + '&maxPrice=' + maxPrice
    })
</script>
</body>
</html>