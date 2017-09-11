<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>主页</title>
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
<div class="header">
    <div class="header-console">
        <div class="container">
            <div class="row">
                <div class="col-xs-4">欢迎来到兰村小卖部！</div>
                <div class="col-xs-8 text-right header-console-links">
                    您还未登录
                    <a href="/login" class="text-link theme-color">请登录</a>
                    <a href="/register" class="text-link">免费注册</a>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-4">欢迎${sessionScope.name}来到兰村小卖部！</div>
                <div class="col-xs-8 text-right header-console-links">
                    <a href="#" class="text-link">我的收藏</a>
                    <a href="#" class="text-link">发布闲置</a>
                    <a href="#" class="text-link html-tooltip-btm-right" data-tooltip-content="#messages-tpl">
                        我的消息 <span class="arrow_b"></span>
                    </a>
                    <a href="#" class="text-link theme-color">lavyun</a>
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
        </div>
    </div>
    <div class="header-links">
        <div class="container">
            <div class="row">
                <div class="col-xs-3">
                    <p class="no-m"><img src="./images/logo.png" class="logo"></p>
                    <p class="no-m logo-title">中北人自己的网络二手市场</p>
                </div>
                <div class="col-xs-6 no-p">
                    <ul class="header-links-ul clearfix">
                        <li class="active"><a href="#">首页</a></li>
                        <li><a href="#">发布商品</a></li>
                        <li><a href="#">商品分类</a></li>
                        <li><a href="#">个人中心</a></li>
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

<div class="main">
    <div class="container">
        <div class="row">
            <div class="col-xs-9 no-pr">
                <div class="row">
                    <div class="col-xs-4">
                        <ul class="category">
                            <li class="clearfix">
                                <span class="category-icon pull-left"
                                      style="background-image: url(http://placehold.it/40x40)"></span>
                                <span class="pull-left category-title">数码产品</span>
                                <a href="#" class="pull-left text-link">手机</a>
                                <a href="#" class="pull-left text-link">电脑</a>
                                <a href="#" class="pull-left text-link">彩电</a>
                                <div class="category-detail">
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <p class="category-detail-title">手机</p>
                                            <a href="#" class="text-link">手机壳</a>
                                            <a href="#" class="text-link">充电器</a>
                                            <a href="#" class="text-link">xxxx</a>
                                        </div>
                                        <div class="col-xs-6">
                                            <p class="category-detail-title">电脑</p>
                                            <a href="#" class="text-link">笔记本</a>
                                            <a href="#" class="text-link">macbook</a>
                                            <a href="#" class="text-link">鼠标</a>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="clearfix">
                                <span class="category-icon pull-left"
                                      style="background-image: url(http://placehold.it/40x40)"></span>
                                <span class="pull-left category-title">数码产品</span>
                                <a href="#" class="pull-left text-link">手机</a>
                                <a href="#" class="pull-left text-link">电脑</a>
                                <a href="#" class="pull-left text-link">彩电</a>
                                <div class="category-detail">
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <p class="category-detail-title">手机</p>
                                            <a href="#" class="text-link">手机壳</a>
                                            <a href="#" class="text-link">充电器</a>
                                            <a href="#" class="text-link">xxxx</a>
                                        </div>
                                        <div class="col-xs-6">
                                            <p class="category-detail-title">电脑</p>
                                            <a href="#" class="text-link">笔记本</a>
                                            <a href="#" class="text-link">macbook</a>
                                            <a href="#" class="text-link">鼠标</a>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="clearfix">
                                <span class="category-icon pull-left"
                                      style="background-image: url(http://placehold.it/40x40)"></span>
                                <span class="pull-left category-title">数码产品</span>
                                <a href="#" class="pull-left text-link">手机</a>
                                <a href="#" class="pull-left text-link">电脑</a>
                                <a href="#" class="pull-left text-link">彩电</a>
                                <div class="category-detail">
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <p class="category-detail-title">手机</p>
                                            <a href="#" class="text-link">手机壳</a>
                                            <a href="#" class="text-link">充电器</a>
                                            <a href="#" class="text-link">xxxx</a>
                                        </div>
                                        <div class="col-xs-6">
                                            <p class="category-detail-title">电脑</p>
                                            <a href="#" class="text-link">笔记本</a>
                                            <a href="#" class="text-link">macbook</a>
                                            <a href="#" class="text-link">鼠标</a>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="clearfix">
                                <span class="category-icon pull-left"
                                      style="background-image: url(http://placehold.it/40x40)"></span>
                                <span class="pull-left category-title">数码产品</span>
                                <a href="#" class="pull-left text-link">手机</a>
                                <a href="#" class="pull-left text-link">电脑</a>
                                <a href="#" class="pull-left text-link">彩电</a>
                                <div class="category-detail">
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <p class="category-detail-title">手机</p>
                                            <a href="#" class="text-link">手机壳</a>
                                            <a href="#" class="text-link">充电器</a>
                                            <a href="#" class="text-link">xxxx</a>
                                        </div>
                                        <div class="col-xs-6">
                                            <p class="category-detail-title">电脑</p>
                                            <a href="#" class="text-link">笔记本</a>
                                            <a href="#" class="text-link">macbook</a>
                                            <a href="#" class="text-link">鼠标</a>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="clearfix">
                                <span class="category-icon pull-left"
                                      style="background-image: url(http://placehold.it/40x40)"></span>
                                <span class="pull-left category-title">数码产品</span>
                                <a href="#" class="pull-left text-link">手机</a>
                                <a href="#" class="pull-left text-link">电脑</a>
                                <a href="#" class="pull-left text-link">彩电</a>
                                <div class="category-detail">
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <p class="category-detail-title">手机</p>
                                            <a href="#" class="text-link">手机壳</a>
                                            <a href="#" class="text-link">充电器</a>
                                            <a href="#" class="text-link">xxxx</a>
                                        </div>
                                        <div class="col-xs-6">
                                            <p class="category-detail-title">电脑</p>
                                            <a href="#" class="text-link">笔记本</a>
                                            <a href="#" class="text-link">macbook</a>
                                            <a href="#" class="text-link">鼠标</a>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="clearfix">
                                <span class="category-icon pull-left"
                                      style="background-image: url(http://placehold.it/40x40)"></span>
                                <span class="pull-left category-title">数码产品</span>
                                <a href="#" class="pull-left text-link">手机</a>
                                <a href="#" class="pull-left text-link">电脑</a>
                                <a href="#" class="pull-left text-link">彩电</a>
                                <div class="category-detail">
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <p class="category-detail-title">手机</p>
                                            <a href="#" class="text-link">手机壳</a>
                                            <a href="#" class="text-link">充电器</a>
                                            <a href="#" class="text-link">xxxx</a>
                                        </div>
                                        <div class="col-xs-6">
                                            <p class="category-detail-title">电脑</p>
                                            <a href="#" class="text-link">笔记本</a>
                                            <a href="#" class="text-link">macbook</a>
                                            <a href="#" class="text-link">鼠标</a>
                                        </div>
                                    </div>
                                </div>
                            </li>
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