<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人中心</title>
    <link rel="stylesheet" href="/static/css/lib/iview.min.css">
    <link rel="stylesheet" href="/static/css/lib/tooltipster.bundle.min.css">
    <link rel="stylesheet" href="/static/css/lib/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/style.css">
    <script src="/static/js/lib/vue.js"></script>
    <script src="/static/js/lib/iview.min.js"></script>
    <script src="/static/js/lib/jquery.min.js"></script>
    <script src="/static/js/lib/tooltipster.bundle.min.js"></script>
    <script src="/static/js/app.js"></script>
    <style>
        .ivu-rate{
            font-size: 14px;
        }
    </style>
</head>
<body class="page-me">

<c:import url="./header.jsp">
    <c:param name="nav" value="me"/>
</c:import>

<div class="main container-s">
    <div class="bread-nav">
        您的位置：
        <a href="/" class="text-link">首页</a> &gt;
        <span>个人中心</span> &gt;
        <c:choose>
            <c:when test="${subsite == 'product'}">已发布商品</c:when>
            <c:when test="${subsite == 'order'}">订单管理</c:when>
            <c:when test="${subsite == 'message'}">我的消息</c:when>
            <c:when test="${subsite == 'collect'}">我的收藏</c:when>
            <%--<c:when test="${subsite == 'setting'}">个人资料设置</c:when>--%>
        </c:choose>
    </div>

    <div class="row">
        <div class="col-xs-2 menu">
            <h4 class="no-m">全部功能</h4>
            <p class="menu-item ${subsite == 'product' ? 'active' : ''}">
                <a href="/me/product" class="text-link">上架中商品</a>
            </p>
            <p class="menu-item ${subsite == 'order' ? 'active' : ''}">
                <a href="/me/order" class="text-link">订单管理</a>
            </p>
            <p class="menu-item ${subsite == 'message' ? 'active' : ''}">
                <a href="/me/message" class="text-link">我的消息</a>
            </p>
            <p class="menu-item ${subsite == 'collect' ? 'active' : ''}">
                <a href="/me/collect" class="text-link">我的收藏</a>
            </p>
            <%--<p class="menu-item ${subsite == 'setting' ? 'active' : ''}">--%>
                <%--<a href="/me/setting" class="text-link">个人资料设置</a>--%>
            <%--</p>--%>
        </div>
        <div class="col-xs-10">
            <div class="detail-top flex-container">
                <div class="avatar">
                    <img src="${user.avatarUrl}">
                </div>
                <div class="info">
                    <p class="no-m">
                        账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：${user.username}</p>
                    <p class="no-m">
                        账户余额：<span class="balance">¥
                        <fmt:formatNumber type="number" value="${user.virtualCurrency}" pattern="0.00" maxFractionDigits="2"/>
                        </span>
                    </p>

                    <c:if test="${user.credits <= 60}">
                        <c:set var="credits_class" value="lt-60" />
                    </c:if>

                    <c:if test="${user.credits > 60}">
                        <c:set var="credits_class" value="gt-60" />
                    </c:if>
                    <c:if test="${user.credits > 80}">
                        <c:set var="credits_class" value="gt-80" />
                    </c:if>

                    <c:if test="${user.credits > 100}">
                        <c:set var="credits_class" value="eq-100" />
                    </c:if>

                    <p class="no-m">
                        信&nbsp;&nbsp;誉&nbsp;&nbsp;度：<span class="credits ${credits_class}">${user.credits}</span>
                    </p>
                </div>
                <div class="address flex1">
                    <div style="margin-bottom: 3px;">
                        <strong class="pull-left">【收货地址】:</strong>
                        <p style="margin-left: 80px;margin-bottom: 0">
                            <c:if test="${address.address != null}">
                                ${address.address}
                            </c:if>

                            <c:if test="${address.address == null}">
                                <a href="/me/setting" class="text-link">未设置</a>
                            </c:if>
                        </p>
                    </div>
                    <div style="margin-bottom: 3px;">
                        <strong class="pull-left">【收货地址】:</strong>
                        <p style="margin-left: 80px;margin-bottom: 0">
                            <c:if test="${address.tel != null}">
                                ${address.tel}
                            </c:if>

                            <c:if test="${address.tel == null}">
                                <a href="/me/setting" class="text-link">未设置</a>
                            </c:if>
                        </p>
                    </div>
                </div>
            </div>
            <div class="detail-body">
                <c:if test="${subsite == 'product'}">
                    <div class="product-manager">
                        <div class="i-tabs clearfix">
                            <div class="i-tabs-item active">上架中商品</div>
                        </div>
                        <div class="i-tabs-panel">
                            <div class="i-tabs-panel-item active" style="padding: 10px;">
                                <div class="row" style="margin: 0 -7px;">
                                    <c:if test="${fn:length(products) == 0}">
                                        <p class="text-center no-m">暂无上架商品</p>
                                    </c:if>
                                    <c:forEach items="${products}" var="item">
                                        <div class="col-xs-6 collect-list">
                                            <c:set var="productsImgUrls" value="${item.imgUrls}" />
                                            <c:set var="productsImgUrlsArr" value="${fn:split(productsImgUrls, ',')}" />
                                            <a href="/product/${item.id}">
                                                <img src="${productsImgUrlsArr[0]}" class="pull-left">
                                            </a>
                                            <p style="margin-bottom: 5px;">
                                                <c:set var="productTitle" value="${item.title}" />
                                                <a href="/product/${item.id}" class="text-link">${fn:substring(productTitle, 0, 20)}...</a>
                                            </p>
                                            <p class="no-m">
                                                <span style="color: red;font-size: 14px;">¥
                                                <fmt:formatNumber type="number" value="${item.price}" pattern="0.00" maxFractionDigits="2"/>
                                                </span>
                                            </p>
                                            <p class="no-m">
                                                <a style="background-color: orange;color: #fff;padding: 1px 5px;" href="/product/${item.id}/#app-comments">
                                                    ${item.commentsNum} 评论
                                                </a>

                                                <a href="/publish?p_id=${item.id}" style="background-color: limegreen;color: #fff;padding: 1px 5px;margin-left: 10px;" >修改</a>
                                            </p>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>

                <c:if test="${subsite == 'order'}">
                    <div id="app" v-cloak>
                        <Modal v-model="modal" width="300">
                            <p class="no-m" slot="header">
                                <span>评分</span>
                            </p>
                            <div style="text-align:center">
                                <rate v-model="score"></rate> <span>{{score}} 分</span>
                            </div>
                            <div slot="footer">
                                <i-button type="primary" long @click="doGrade">确定</i-button>
                            </div>
                        </Modal>
                        <div class="i-tabs clearfix">
                            <div class="i-tabs-item active">全部记录${fn:length(orders)}</div>
                        </div>
                        <c:forEach items="${orders}" var="order">
                            <c:set var="isBuyer" value="${sessionScope.username == order.buyerName}" />
                            <div class="orders-list ${order.status != 0 ? 'is-finish' : ''}">
                                <div class="orders-list-top">
                                    <div class="row">
                                        <div class="col-xs-4">
                                            <strong style="margin-right: 20px;">
                                                <fmt:formatDate value="${order.createTime}" type="date"/>
                                            </strong>
                                            <span>订单号：${12345 + order.id}</span>
                                        </div>
                                        <div class="col-xs-4">
                                            交易对象：
                                            <a href="#" class="text-link">
                                                    ${isBuyer ? order.salerName : order.buyerName}
                                            </a>
                                        </div>
                                        <div class="col-xs-4 text-right">
                                            交易状态：
                                            <span class="is-${order.status == 1 ? 'sale' : 'finish' }-text">
                                            <c:if test="${order.status == 1}">
                                                ${isBuyer ? '正在购入' : '正在售出'}
                                            </c:if>

                                            <c:if test="${order.status == 2}">
                                                ${isBuyer ? '已经购入' : '已经售出'}
                                            </c:if>
                                        </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="orders-list-body">
                                    <div class="row">
                                        <div class="col-xs-4 img_link">
                                            <a href="/product/${order.proId}">
                                                <c:set var="imgUrls" value="${fn:split(order.imgUrls, ',')}"/>
                                                <img src="${imgUrls[0]}" class="pull-left">
                                            </a>
                                            <p><a href="/product/${order.proId}" class="text-link">${order.title}</a></p>
                                        </div>
                                        <div class="col-xs-2">
                                            <p class="no-m"><strong>商品金额：</strong></p>
                                            <p class="no-m" style="color: red;font-size: 14px">¥
                                                <fmt:formatNumber type="number" value="${order.price}" pattern="0.00" maxFractionDigits="2"/>
                                            </p>
                                        </div>
                                        <div class="col-xs-2">
                                            <p class="no-m">
                                                <c:if test="${isBuyer}">
                                                    <c:if test="${order.buyerScore != null}">
                                                        <strong>评分：</strong>
                                                    </c:if>

                                                    <c:if test="${order.buyerScore == null}">
                                                        <strong>操作：</strong>
                                                    </c:if>
                                                </c:if>

                                                <c:if test="${!isBuyer}">
                                                    <c:if test="${order.salerScore != null}">
                                                        <strong>评分：</strong>
                                                    </c:if>

                                                    <c:if test="${order.salerScore == null}">
                                                        <strong>操作：</strong>
                                                    </c:if>
                                                </c:if>
                                            </p>
                                            <p class="no-m">
                                                <c:if test="${isBuyer}">
                                                    <c:if test="${order.buyerScore != null}">
                                                        <rate :value="${order.buyerScore}" disabled></rate>
                                                    </c:if>
                                                    <c:if test="${order.buyerScore == null}">
                                                        <c:if test="${order.status == 1}">
                                                            <a href="#" class="text-link">退货 / 退款</a>
                                                        </c:if>

                                                        <c:if test="${order.status == 2}">
                                                            <a href="javascript:;" class="text-link" @click="showModal('${order.id}')">给买(卖)家评分</a>
                                                        </c:if>
                                                    </c:if>
                                                </c:if>

                                                <c:if test="${!isBuyer}">
                                                    <c:if test="${order.salerScore != null}">
                                                        <rate :value="${order.salerScore}" disabled></rate>
                                                    </c:if>
                                                    <c:if test="${order.salerScore == null}">
                                                        <c:if test="${order.status == 1}">
                                                            <a href="#" class="text-link">退货 / 退款</a>
                                                        </c:if>

                                                        <c:if test="${order.status == 2}">
                                                            <a href="javascript:;" class="text-link" @click="showModal('${order.id}')">给买(卖)家评分</a>
                                                        </c:if>
                                                    </c:if>
                                                </c:if>
                                            </p>
                                        </div>
                                        <div class="col-xs-2">
                                            <p class="no-m"><strong>查看：</strong></p>
                                            <p class="no-m"><a href="#" class="text-link">订单详情</a></p>
                                        </div>
                                        <div class="col-xs-2 text-right">
                                            <c:if test="${isBuyer}">
                                                <c:if test="${order.status == 1}">
                                                    <button class="btn btn-success" data-confirm-btn data-pro-id="${order.proId}">确认收货</button>
                                                </c:if>

                                                <c:if test="${order.status == 2}">
                                                    <button class="btn btn-success disabled">已收货</button>
                                                </c:if>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>


                <c:if test="${subsite == 'message'}">
                    <div class="message-manager">
                        <div class="i-tabs clearfix i-tabs-toggle">
                            <div class="i-tabs-item active">未读消息(2)</div>
                            <div class="i-tabs-item">已读消息</div>
                        </div>
                        <div class="i-tabs-panel">
                            <div class="i-tabs-panel-item active">
                                <div class="message-list">
                                    <p class="no-m">你好年后<a href="#">链接链接</a></p>
                                    <p class="no-m text-color">2017-08-23 12:34:34</p>
                                </div>
                                <div class="message-list">
                                    <p class="no-m">你好年后<a href="#">链接链接</a></p>
                                    <p class="no-m text-color">2017-08-23 12:34:34</p>
                                </div>
                            </div>

                            <div class="i-tabs-panel-item">
                                <div class="message-list">
                                    <p class="no-m">这是已读的消息<a href="#">链接链接</a></p>
                                    <p class="no-m text-color">2017-08-23 12:34:34</p>
                                </div>
                                <div class="message-list">
                                    <p class="no-m">这是已读的消息<a href="#">链接链接</a></p>
                                    <p class="no-m text-color">2017-08-23 12:34:34</p>
                                </div>
                                <div class="message-list">
                                    <p class="no-m">这是已读的消息<a href="#">链接链接</a></p>
                                    <p class="no-m text-color">2017-08-23 12:34:34</p>
                                </div>
                                <div class="message-list">
                                    <p class="no-m">这是已读的消息<a href="#">链接链接</a></p>
                                    <p class="no-m text-color">2017-08-23 12:34:34</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>

                <c:if test="${subsite == 'collect'}">
                    <div class="collect-manager">
                        <div class="i-tabs clearfix">
                            <div class="i-tabs-item active">我的收藏(${fn:length(collections)})</div>
                        </div>

                        <div class="i-tabs-panel">
                            <div class="i-tabs-panel-item active" style="padding: 10px;">
                                <c:if test="${fn:length(collections) == 0}">
                                    <p class="text-center" style="margin-top: 15px;">您还没有任何收藏</p>
                                </c:if>

                                <div class="row" style="margin: 0 -7px;">
                                    <c:forEach items="${collections}" var="item">
                                        <div class="col-xs-4 collect-list">
                                            <c:set var="imgs" value="${fn:split(item.imgUrls, ',')}"/>
                                            <a href="/product/${item.proId}">
                                                <img src="${imgs[0]}" class="pull-left">
                                            </a>
                                            <p style="margin-bottom: 5px;">
                                                <a href="/product/${item.proId}" class="text-link">${item.title}</a>
                                            </p>
                                            <p class="no-m">
                                                <span style="color: red;font-size: 14px;">¥
                                                <fmt:formatNumber type="number" value="${item.price}" pattern="0.00" maxFractionDigits="2"/>
                                                </span>
                                                <span class="pull-right ${item.status == 0 ? 'has-up' : 'has-down'}">
                                                        ${item.status == 0 ? '上架中' : '已下架'}
                                                </span>
                                            </p>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>
<script>
    $(function(){

        new Vue({
            el: '#app',
            data: {
                order_id: null,
                score: 0,
                modal: false
            },
            mounted:function(){
                var $confirmBtn = $('[data-confirm-btn]')
                $confirmBtn.on('click', function () {
                    console.log(1);
                    var $t = $(this)
                    var id = Number($t.attr('data-pro-id'))
                    $.post('/api/getGoods', {
                        id: id
                    }).done(function (data) {
                        if(data.code == 1) { alert(data.msg)}
                        else {
                            if(data.data.status == 0) {
                                $t.addClass('disabled')
                                $t.text('已收货')
                            } else {
                                alert(data.msg)
                            }
                        }
                    })
                })
            },
            methods: {
                showModal: function (order_id) {
                    this.modal = true
                    this.order_id = order_id
                },
                doGrade: function () {
                    var _this = this
                    $.post('/api/evaluate', {
                        order_id: Number(_this.order_id),
                        score: _this.score
                    }).done(function(data){
                        var code = data.code
                        var msg = data.msg
                        if(code == 1) {
                            alert(msg)
                        } else {
                            if(data.data.status == 0) {
                                location.reload()
                            } else {
                                alert(msg)
                            }
                        }
                    })
                }
            }
        })
    })
</script>
</body>
</html>