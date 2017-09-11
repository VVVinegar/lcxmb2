<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="static/css/lib/bootstrap.min.css">
    <link rel="stylesheet" href="static/css/lib/iview.min.css">
    <link rel="stylesheet" href="static/css/style.css">
    <script src="static/js/lib/vue.js"></script>
    <script src="static/js/lib/iview.min.js"></script>
    <script src="static/js/lib/jquery.min.js"></script>
    <script src="static/js/app.js"></script>
</head>
<body class="page-publish">
<div class="header">
    <div class="header-console">
        <div class="container">
            <div class="row">
                <div class="col-xs-4">欢迎来到xxxxx</div>
                <div class="col-xs-8 text-right header-console-links">
                    您还为登录
                    <a href="/login" class="text-link theme-color">请登录</a>
                    <a href="/register" class="text-link">免费注册</a>
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
                            <input type="text" placeholder="输入商品名称搜索">
                        </div>
                        <div class="search-detail">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="main container-xs">
    <div class="bread-nav">
        您的位置：
        <a href="#" class="text-link">首页</a> &gt;
        <span>发布闲置</span>
    </div>

    <div id="app-publish" v-cloak>
        <Alert type="warning" show-icon>提示
            <span slot="desc">
            您还未登录，登录后可发布商品。<a href="/login">点此登录</a>
        </span>
        </Alert>
        <i-form :model="publishForm" :rules="publishRules" ref="publish">
            <form-item prop="title">
                <i-input v-model="publishForm.title" placeholder="请输入标题" :maxlength="40"></i-input>
            </form-item>
            <row :gutter="12">
                <i-col :span="8">
                    <form-item prop="cate">
                        <Cascader :data="categoryData" v-model="publishForm.cate"
                                  placeholder="请选择分类" trigger="hover"></Cascader>
                    </form-item>
                </i-col>
                <i-col :span="8">
                    <form-item prop="contact">
                        <i-input v-model="publishForm.contact" placeholder="请输入联系电话"></i-input>
                    </form-item>
                </i-col>
                <i-col :span="8">
                    <form-item prop="quality">
                        <input-number v-model="publishForm.quality" :max="10" :min="1" :step="0.5"></input-number>&nbsp;&nbsp;&nbsp;成新
                    </form-item>
                </i-col>
            </row>
            <form-item prop="content">
                <i-input type="textarea" v-model="publishForm.content" :autosize="{minRows: 4,maxRows: 8}" placeholder="请输入宝贝描述" :maxlength="500"></i-input>
            </form-item>
            <form-item prop="imgList" class="img-form-item">
                <div class="upload-list" v-for="item in publishForm.imgList">
                    <template v-if="item.status === 'finished'">
                        <img :src="item.url">
                        <div class="upload-list-cover">
                            <Icon type="ios-trash-outline" @click.native="handleRemove(item)"></Icon>
                        </div>
                    </template>
                    <template v-else>
                        <Progress v-if="item.showProgress" :percent="item.percentage" hide-info style="width: 100%"></Progress>
                    </template>
                </div>
                <Upload ref="upload"
                        :show-upload-list="false"
                        :default-file-list="defaultList"
                        :on-success="handleSuccess"
                        :format="['jpg','jpeg','png']"
                        :data="{width: width}"
                        :max-size="2048"
                        :on-format-error="handleFormatError"
                        :on-exceeded-size="handleMaxSize"
                        :before-upload="handleBeforeUpload"
                        multiple
                        type="drag"
                        action="/utils/upload"
                        class="upload-panel">
                            <div class="upload-panel-body">
                                <Icon type="camera" size="28"></Icon>
                            </div>
                </Upload>
            </form-item>
            <form-item style="margin-top: -10px;">
                <i-button type="primary" @click="handleSubmit">发布</i-button>
            </form-item>
        </i-form>
    </div>
</div>
</body>
</html>