<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="header">
    <div class="header-console">
        <div class="container">
            <c:if test="${sessionScope.username == null}">
                <div class="row">
                    <div class="col-xs-4">欢迎来到兰村小卖部！</div>
                    <div class="col-xs-8 text-right header-console-links">
                        您还未登录
                        <a href="/login?from=${param.from != 'false' ? param.from : ''}" class="text-link theme-color">请登录</a>
                        <a href="/register" class="text-link">免费注册</a>
                    </div>
                </div>
            </c:if>

            <c:if test="${sessionScope.username != null}">
                <div class="row">
                    <div class="col-xs-4">欢迎来到兰村小卖部！</div>
                    <div class="col-xs-8 text-right header-console-links">
                        <a href="#" class="text-link">我的收藏</a>
                        <a href="/publish" class="text-link">发布闲置</a>
                        <a href="" class="text-link html-tooltip-btm-right" data-tooltip-content="#messages-tpl">
                            我的消息 <span class="arrow_b"></span>
                        </a>
                        <a href="/me" class="text-link theme-color">${sessionScope.username}</a>
                    </div>
                    <div class="messages-tpl tooltip-content" id="messages-tpl">
                        <div class="messages-top">
                            <h4 class="no-m text-center">未读新消息</h4>
                        </div>
                        <div class="messages-body">
                            <p style="color: #949494;margin-top: 20px;" class="text-center">您暂时还没有任何消息</p>
                            <div class="messages-item">
                                <p class="no-m">
                                    消息消息消息消息
                                    <a href="#">jkjk</a>
                                </p>
                                <p class="no-m text-color">
                                    2017-08-09 09:09:09
                                    <a href="javascript:;" class="pull-right text-link read-mark">标记已读</a>
                                </p>
                            </div>
                        </div>
                        <div class="messages-bottom">
                            <a href="#" class="text-link">查看所有消息</a>
                            <a href="javascript:;" class="text-link">全部已读</a>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
    <div class="header-links">
        <div class="container">
            <div class="row">
                <div class="col-xs-3">
                    <p class="no-m"><img src="static/images/logo.png" class="logo"></p>
                    <p class="no-m logo-title">中北人自己的网络二手市场</p>
                </div>
                <div class="col-xs-6 no-p">
                    <ul class="header-links-ul clearfix">
                        <li class="${param.nav == 'index' ? 'active' : ''}"><a href="/">首页</a></li>
                        <li class="${param.nav == 'publish' ? 'active' : ''}"><a href="/publish">发布商品</a></li>
                        <li class="${param.nav == 'search' ? 'active' : ''}"><a href="/search">全部商品</a></li>
                        <c:if test="${sessionScope.username != null}">
                            <li class="${param.nav == 'me' ? 'active' : ''}">
                                <a href="/me">个人中心</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
                <div class="col-xs-3 h_100">
                    <div class="search">
                        <div class="search-input">
                            <span class="icon"></span>
                            <input placeholder="输入商品名称搜索">
                        </div>
                        <div class="search-detail">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
