<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>发布闲置</title>
    <link rel="stylesheet" href="static/css/lib/tooltipster.bundle.min.css">
    <link rel="stylesheet" href="static/css/lib/bootstrap.min.css">
    <link rel="stylesheet" href="static/css/lib/iview.min.css">
    <link rel="stylesheet" href="static/css/style.css">
    <script src="static/js/lib/vue.js"></script>
    <script src="static/js/lib/iview.min.js"></script>
    <script src="static/js/lib/jquery.min.js"></script>
    <script src="static/js/lib/tooltipster.bundle.min.js"></script>
    <script src="static/js/app.js"></script>
</head>
<body class="page-publish">

<c:import url="./header.jsp">
    <c:param name="from" value="/publish"/>
    <c:param name="nav" value="publish" />
</c:import>

<div class="main container-xs">
    <div class="bread-nav">
        您的位置：
        <a href="#" class="text-link">首页</a> &gt;
        <span>发布闲置</span>
    </div>

    <div id="app-publish" v-cloak>
        <Modal v-model="showSuccess" width="360" :closable="false">
            <div style="text-align:center;margin-top: 20px;">
                <Icon type="checkmark-circled" size="50" style="color: #19be6b"></Icon>
                <p style="font-size: 16px;margin-top: 15px;">发布成功，3s后为你跳转到商品详情</p>
            </div>
            <div slot="footer" style="text-align: right">
                <i-button type="primary" @click="goDetail">直接前往</i-button>
            </div>
        </Modal>

        <c:if test="${sessionScope.username == null}">
            <Alert type="warning" show-icon>提示
                <span slot="desc">
                    您还未登录，登录后可发布商品。<a href="/login?from=/publish">点此登录</a>
                </span>
            </Alert>
        </c:if>

        <c:if test="${sessionScope.username != null}">
            <i-form :model="publishForm" :rules="publishRules" ref="publish">
                <form-item prop="title">
                    <i-input v-model="publishForm.title" placeholder="请输入标题" :maxlength="40"></i-input>
                </form-item>
                <row :gutter="12">
                    <i-col :span="12">
                        <form-item prop="cate">
                            <Cascader :data="categoryData" v-model="publishForm.cate"
                                      placeholder="请选择分类" trigger="hover"></Cascader>
                        </form-item>
                    </i-col>
                    <i-col :span="12">
                        <form-item prop="contact">
                            <i-input v-model="publishForm.contact" placeholder="请输入联系电话"></i-input>
                        </form-item>
                    </i-col>
                </row>
                <row :gutter="12">
                    <i-col :span="12">
                        <form-item prop="price">
                            <i-input v-model="publishForm.price" placeholder="请输入价格">
                                <Icon type="pricetag" slot="prepend"></Icon>
                            </i-input>
                        </form-item>
                    </i-col>
                    <i-col :span="12">
                        <form-item prop="quality">
                            <input-number v-model="publishForm.quality" :max="10" :min="1" :step="0.5"></input-number>&nbsp;&nbsp;&nbsp;成新
                        </form-item>
                    </i-col>
                </row>
                <form-item prop="content">
                    <i-input type="textarea" v-model="publishForm.content" :autosize="{minRows: 4,maxRows: 8}"
                             placeholder="请输入宝贝描述" :maxlength="500"></i-input>
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
                            <Progress v-if="item.showProgress" :percent="item.percentage" hide-info
                                      style="width: 100%"></Progress>
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
        </c:if>
    </div>
</div>
</body>
</html>