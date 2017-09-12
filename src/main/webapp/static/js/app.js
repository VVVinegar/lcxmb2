$(function () {
    var appRank;
    if ($('#app-rank').length) {
        appRank = new Vue({
            el: '#app-rank',
            data: {
                showSelectPanel: false
            },
            methods: {
                toggleSelectPanel: function () {
                    this.showSelectPanel = !this.showSelectPanel;
                }
            }
        });
    }
    // 主页排行榜 hover
    var $rankItems = $('.rank-item:gt(0)');
    $rankItems.hover(function () {
        $(this).find('.rank-item-hidden').stop().slideDown(300);
    }, function () {
        $(this).find('.rank-item-hidden').stop().slideUp(300);
    });
    // 主页排行榜吸盘
    $(window).on('scroll', function () {
        var scrollTop = $(this).scrollTop();
        var $rankWrap = $('#rank-wrap');
        if (scrollTop > 100) {
            $rankWrap.addClass('fixed');
        }
        else {
            $rankWrap.removeClass('fixed');
        }
    });
    // 查询结果页价格区间搜索，确定按钮的隐藏切换
    var $controlPriceInput = $('.control-price-input');
    $controlPriceInput.on('focus', function () {
        var $t_p = $(this).parent();
        $t_p.addClass('active');
        $t_p.siblings('.control-price-confirm').css('display', 'inline-block');
    });
    $controlPriceInput.on('blur', function () {
        var $t_p = $(this).parent();
        $t_p.removeClass('active');
        $t_p.siblings('.control-price-confirm').css('display', 'none');
    });
    // 初始化tooltip
    var $htmlTooltip = $('.html-tooltip');
    if ($htmlTooltip.length) {
        $htmlTooltip.tooltipster({
            theme: 'tooltipster-light',
            side: 'bottom',
            interactive: true,
            animation: 'grow'
        });
    }
    var $htmlTooltipBtmRight = $('.html-tooltip-btm-right');
    if ($htmlTooltipBtmRight.length) {
        $htmlTooltipBtmRight.tooltipster({
            theme: 'tooltipster-light',
            side: 'bottom',
            interactive: true,
            animation: 'grow',
            functionPosition: function (instance, helper, position) {
                var helperRight = helper.geo.origin.offset.right;
                var width = position.size.width;
                position.coord.left = helperRight - width;
                return position;
            }
        });
    }
    // 商品详情页 tabs 切换
    var $proTabsItem = $('.pro-tabs .tabs-item');
    var $proTabsPanelItem = $('.pro-tabs .tabs-panel-item');
    $proTabsItem.on('click', function () {
        var $t = $(this);
        var index = $t.index();
        $t.siblings().removeClass('active');
        $t.addClass('active');
        $proTabsPanelItem.removeClass('active');
        $proTabsPanelItem.eq(index).addClass('active');
    });
    // 商品页评论字数控制
    var $cmtTextarea = $('.comment-tr textarea');
    var $countEle = $('.comment-tr-btm .count');
    $cmtTextarea.on('input', function () {
        var textLength = $(this).val().length;
        $countEle.text(textLength);
    });
    // 发布商品页
    var validateCate = function (rule, value, callback) {
        if (value.length === 0) {
            callback(new Error('请选择分类'));
        }
        else {
            callback();
        }
    };
    var validateImgList = function (rule, value, callback) {
        if (value.length) {
            callback();
        }
        else {
            callback(new Error('请上传描述图片'));
        }
    };
    var validateQuality = function (rule, value, callback) {
        if (value) {
            callback();
        }
        else {
            callback(new Error('请输入宝贝成新'));
        }
    };
    var appPublish;
    if ($('#app-publish').length) {
        appPublish = new Vue({
            el: '#app-publish',
            data: {
                width: '200',
                publishForm: {
                    cate: [],
                    title: 'title',
                    contact: '15835134145',
                    imgList: [],
                    content: 'content',
                    quality: 10
                },
                publishRules: {
                    title: [{ required: true, message: '请输入标题', trigger: 'blur' }],
                    cate: [{ validator: validateCate, trigger: 'change' }],
                    contact: [{ required: true, message: '请输入联系方式', trigger: 'blur' }],
                    imgList: [{ validator: validateImgList }],
                    content: [{ required: true, message: '请输入宝贝详情', trigger: 'blur' }],
                    quality: [{ validator: validateQuality, trigger: 'change' }]
                },
                categoryData: [{
                        value: '数码产品',
                        label: '数码产品',
                        children: [{
                                value: '手机',
                                label: '手机'
                            }, {
                                value: '电脑',
                                label: '电脑'
                            }]
                    }, {
                        value: '其他',
                        label: '其他'
                    }],
                defaultList: [
                    {
                        'name': 'a42bdcc1178e62b4694c830f028db5c0',
                        'url': 'https://o5wwk8baw.qnssl.com/a42bdcc1178e62b4694c830f028db5c0/avatar'
                    }
                ]
            },
            mounted: function () {
                this.publishForm.imgList = this.$refs.upload.fileList;
            },
            methods: {
                handleRemove: function (file) {
                    // 从 upload 实例删除数据
                    var fileList = this.$refs.upload.fileList;
                    this.$refs.upload.fileList.splice(fileList.indexOf(file), 1);
                },
                handleSuccess: function (res, file) {
                    var imgUrl = res.data.imageUrl;
                    file.url = imgUrl;
                    file.name = imgUrl;
                },
                handleFormatError: function (file) {
                    this.$Notice.warning({
                        title: '文件格式不正确',
                        desc: '文件 ' + file.name + ' 格式不正确，请上传 jpg 或 png 格式的图片。'
                    });
                },
                handleMaxSize: function (file) {
                    this.$Notice.warning({
                        title: '超出文件大小限制',
                        desc: '文件 ' + file.name + ' 太大，不能超过 2M。'
                    });
                },
                handleBeforeUpload: function () {
                    var check = this.publishForm.imgList.length < 5;
                    if (!check) {
                        this.$Notice.warning({
                            title: '最多只能上传 5 张图片。'
                        });
                    }
                    return check;
                },
                handleSubmit: function () {
                    var _this = this;
                    this.$refs.publish.validate(function (valid) {
                        if (valid) {
                            var form = _this.publishForm;
                            var imgUrls = form.imgList.map(function (v) { return v.url; }).join(',');
                            $.post('/api/publish', {
                                title: form.title,
                                cate1: form.cate[0],
                                cate2: form.cate[1] || null,
                                quality: form.quality,
                                imgUrls: imgUrls,
                                telNum: form.contact,
                                description: form.content
                            }).done(function (data) {
                                var code = data.code;
                                var msg = data.msg;
                                if (code === 0) {
                                    var id = data.data.id;
                                    this.$Modal.success({
                                        title: '提示',
                                        content: '发布成功',
                                        okText: '查看详情',
                                        onOk: function () {
                                            location.href = '';
                                        }
                                    });
                                }
                                else {
                                    this.$Modal.error({
                                        title: "发生错误",
                                        content: msg
                                    });
                                }
                            });
                        }
                    });
                }
            }
        });
    }
    // 个人中心页 tabs 切换
    var $iTabsItem = $('.i-tabs-toggle .i-tabs-item');
    $iTabsItem.on('click', function () {
        var $t = $(this);
        var index = $t.index();
        var $iTabsPanelItem = $t.parent().next().children('.i-tabs-panel-item');
        $t.siblings().removeClass('active');
        $t.addClass('active');
        $iTabsPanelItem.removeClass('active');
        $iTabsPanelItem.eq(index).addClass('active');
    });
});
//# sourceMappingURL=app.js.map