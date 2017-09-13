<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <title>支付</title>
    <link rel="stylesheet" href="/static/css/lib/tooltipster.bundle.min.css">
    <link rel="stylesheet" href="/static/css/lib/iview.min.css">
    <link rel="stylesheet" href="/static/css/lib/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/style.css">
    <script src="/static/js/lib/vue.js"></script>
    <script src="/static/js/lib/iview.min.js"></script>
    <script src="/static/js/lib/jquery.min.js"></script>
    <script src="/static/js/lib/tooltipster.bundle.min.js"></script>
    <script src="/static/js/app.js"></script>
</head>
<body class="page-pay">
    <c:import url="./header.jsp">
        <c:param name="nav" value="search" />
    </c:import>

    <div class="main container-xs">
        <div class="bread-nav" style="margin-top: 10px;">
            您的位置：
            <a href="/" class="text-link">首页</a> &gt;
            <span>支付</span>
        </div>

        <div id="app-pay" v-cloak>
            <Alert show-icon style="padding-left: 80px;" >
                提示
                <Icon type="android-cart" size="44" slot="icon"></Icon>
                <template slot="desc">
                    请尽快完成支付，剩余有效时间：<span id="cd_text" style="font-size: 14px">30分00秒</span>
                </template>
            </Alert>

            <Alert style="padding: 12px;background-color: #fff;border-color: #e4e4e4" type="warning">
                <template>
                    <row :gutter="12">
                        <i-col :span="3">
                            <p class="no-m"></p>
                            <img src="http://placehold.it/100x100" style="background-color: #c4c4c4; width: 100%">
                        </i-col>
                        <i-col :span="21">
                            <p style="margin-bottom: 25px;"><a href="#" class="text-link" style="font-size: 14px;">标题标题</a></p>
                            <p class="no-m">卖家：${product.salerUser}</p>
                        </i-col>
                    </row>

                    <div class="line" style="background-color: #e4e4e4;margin: 10px 0"></div>
                    <p class="pay-panel-p">
                        <strong>商品成新:</strong>
                        <span>${product.quality} 成新</span>
                    </p>
                    <p class="pay-panel-p">
                        <strong>所属分类:</strong>
                        <span>${product.category1} ${product.category2}</span>
                    </p>
                    <p class="pay-panel-p">
                        <strong>商品描述:</strong>
                        <span>${product.desciption}</span>
                    </p>
                    <p class="pay-panel-p">
                        <strong>收货地址:</strong>
                        <span>${address.address}</span>
                    </p>
                    <p class="pay-panel-p">
                        <strong>收货电话:</strong>
                        <span>${address.tel}</span>
                    </p>

                    <p style="padding-left: 72px;margin-top: 25px;">
                        实付款: <span style="font-size: 20px;color: red;font-weight: bold">￥
                        <fmt:formatNumber type="number" value="${product.price}" pattern="0.00" maxFractionDigits="2"/>
                    </span>
                    </p>

                    <div style="padding-left: 72px;">
                        <i-button type="success">付款</i-button>
                    </div>
                </template>
            </Alert>
        </div>
    </div>
</body>
</html>
