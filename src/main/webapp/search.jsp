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

<div class="main">
    <div class="container-s">
        <div class="bread-nav">
            您的位置：
            <a href="#" class="text-link">首页</a> &gt;
            <span>搜索闲置</span> &gt;
            <a href="#" class="text-link">xxx</a>
            （共123条搜索结果）
        </div>
        <div class="control clearfix">
            <div class="control-btns">
                <a href="#" class="active">最新</a>
                <a href="#">最热</a>
                <a href="#">价格最低</a>
                <a href="#">价格最高</a>
            </div>
            <div class="control-price" div="app-search-price">
                <div class="control-price-input-wrap">
                    <span>￥</span>
                    <input type="number" class="control-price-input">
                </div>
                -
                <div class="control-price-input-wrap">
                    <span>￥</span>
                    <input type="number" class="control-price-input">
                </div>
                <div class="control-price-confirm">确定</div>
            </div>
        </div>
        <div class="cate-list">
            <div class="row">
                <c:forEach items="${products}" var="product">
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
                </c:forEach>
            </div>
        </div>

        <nav class="text-center">
            <ul class="pagination">
                <li><a href="#">上一页</a></li>
                <li class="active"><a href="#">1</a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">...</a></li>
                <li><a href="#">下一页</a></li>
            </ul>
        </nav>
    </div>
</div>
</div>
</body>
</html>