<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
    <c:param name="nav" value="search"/>
</c:import>

<div class="main container-xs">
    <div class="bread-nav" style="margin-top: 10px;">
        您的位置：
        <a href="/" class="text-link">首页</a> &gt;
        <span>支付</span>
    </div>

    <div id="app-pay" v-cloak>
        <Alert show-icon style="padding-left: 80px;">
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
                        <c:set var="productImg" value="${fn:split(product.imgUrls, ',')}"/>
                        <img src="${productImg[0]}" style="background-color: #c4c4c4; width: 100%">
                    </i-col>
                    <i-col :span="21">
                        <p style="margin-bottom: 15px;"><a href="#" class="text-link" style="font-size: 14px;">${product.title}</a>
                        </p>
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
                    <span>
        <c:if test="${address.address != null}">
            ${address.address}
        </c:if>

        <c:if test="${address.address == null}">
            <a href="/me/setting" class="text-link">未设置</a>
        </c:if>
        </span>
                </p>
                <p class="pay-panel-p">
                    <strong>收货电话:</strong>
                    <span>
        <c:if test="${address.tel != null}">
            ${address.tel}
        </c:if>

        <c:if test="${address.tel == null}">
            <a href="/me/setting" class="text-link">未设置</a>
        </c:if>
        </span>
                </p>

                <p style="padding-left: 72px;margin-top: 25px;">
                    实付款: <span style="font-size: 20px;color: red;font-weight: bold">￥
        <fmt:formatNumber type="number" value="${product.price}" pattern="0.00" maxFractionDigits="2"/>
        </span>
                </p>

                <div style="padding-left: 72px;">
                    <i-button type="success" @click="readyPay">付款</i-button>
                </div>
            </template>
        </Alert>

        <Modal v-model="inputPassModal" width="360">
            <p slot="header" class="no-m" style="color:#19be6b;text-align:center">
                <span>输入密码进行确认</span>
            </p>
            <div style="text-align:center">
                <i-input type="password" placeholder="请输入密码" v-model="request.password"></i-input>
            </div>
            <div slot="footer">
                <i-button type="primary" long :loading="loading" @click="handlePay">确认支付</i-button>
            </div>
        </Modal>
    </div>
</div>
<script>
    new Vue({
        el: '#app-pay',
        data: {
            min: 30,
            inter: null,
            inputPassModal: false,
            loading: false,
            request: {
                id: '${product.id}',
                price: '${product.price}',
                saler_user: '${product.salerUser}',
                password: '',
                address_id: ${me.defaultAddress}
            }
        },
        mounted: function () {
            this.countDown()
        },
        methods: {
            countDown: function () {
                var d = new Date("1111/1/1,0:" + this.min + ":0");
                this.inter = setInterval(function () {
                    var m = d.getMinutes();
                    var s = d.getSeconds();
                    m = m < 10 ? "0" + m : m;
                    s = s < 10 ? "0" + s : s;
                    $("#cd_text").text(m + "分" + s + '秒')
                    if (m == 0 && s == 0) {
                        clearInterval(this.inter);
                        return;
                    }
                    d.setSeconds(s - 1);
                }, 1000);
            },
            handlePay: function () {
                if (this.request.password.trim()) {
                    var _this = this
                    this.loading = true
                    $.ajax('/api/pay', {
                        type: 'post',
                        data: _this.request
                    }).done(function (data) {
                        const code = data.code
                        const msg = data.msg
                        if(code === 1) {
                            _this.$Modal.warning({
                                title: '提示',
                                content: msg
                            })
                        } else {
                            const status = data.data.status
                            if(status == 0) {
                                location.href = '/pay_success'
                            } else {
                                _this.$Modal.warning({
                                    title: '提示',
                                    content: msg
                                })
                            }
                        }
                    })
                }
            },
            readyPay: function () {
                if (this.request.address === -1) {
                    this.$Modal.warning({
                        title: '提示',
                        content: '请设置收货地址',
                        okText: '确定'
                    })
                } else {
                    this.inputPassModal = true
                }
            }
        }
    })
</script>
</body>
</html>
