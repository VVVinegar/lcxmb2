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
    // 商品页评论
    var appComments;
    if ($('#app-comments').length) {
        appComments = new Vue({
            el: '#app-comments',
            data: {
                replyer: null,
                content: '',
                showPanel1: true
            },
            methods: {
                setReplyer: function (replyer) {
                    this.replyer = replyer;
                },
                submit: function () {
                    var _self = this;
                    if (_self.content.trim() === '') {
                        return _self.$Modal.warning({
                            title: '提示',
                            content: '请检查输入',
                            okText: '确定'
                        });
                    }
                    $.ajax('/api/comment', {
                        type: 'post',
                        data: {
                            replyer: _self.replyer,
                            content: _self.content,
                            proId: Number($('#productId').val())
                        }
                    }).done(function (data) {
                        var code = data.code;
                        var msg = data.msg;
                        if (code === 1) {
                            _self.$Modal.error({
                                title: '提示',
                                content: msg,
                                okText: '确定',
                                onOk: function () {
                                    location.href = "/login?from=/product/" + $('#productId').val();
                                }
                            });
                        }
                        else {
                            _self.$Modal.success({
                                title: '提示',
                                content: '评论成功',
                                okText: '确定',
                                onOk: function () {
                                    location.reload();
                                }
                            });
                        }
                    });
                },
                togglePanel: function () {
                    this.showPanel1 = !this.showPanel1;
                }
            }
        });
    }
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
    var validatePrice = function (rule, value, callback) {
        if (value) {
            if (!$.isNumeric(Number(value))) {
                callback(new Error('输入不符合格式'));
            }
            else {
                callback();
            }
        }
        else {
            callback(new Error('请输入价格'));
        }
    };
    var appPublish;
    if ($('#app-publish').length) {
        appPublish = new Vue({
            el: '#app-publish',
            data: {
                width: '200',
                showSuccess: false,
                successUrl: '',
                publishForm: {
                    cate: [],
                    title: 'title',
                    contact: '15835134145',
                    imgList: [],
                    content: 'content',
                    quality: 10,
                    price: 30
                },
                publishRules: {
                    title: [{ required: true, message: '请输入标题', trigger: 'blur' }],
                    contact: [{ required: true, message: '请输入联系方式', trigger: 'blur' }],
                    price: [{ validator: validatePrice, trigger: 'change' }],
                    content: [{ required: true, message: '请输入宝贝详情', trigger: 'blur' }],
                    cate: [{ validator: validateCate, trigger: 'change' }],
                    imgList: [{ validator: validateImgList, trigger: 'change' }],
                    quality: [{ validator: validateQuality, trigger: 'change' }],
                },
                categoryData: [],
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
            created: function () {
                this.getCategory();
            },
            methods: {
                getCategory: function () {
                    var _this = this;
                    $.get('/static/json/category.json')
                        .done(function (list) {
                        var list1 = list.map(function (v) {
                            v.label = v.value;
                            return v;
                        });
                        for (var _i = 0, list1_1 = list1; _i < list1_1.length; _i++) {
                            var item = list1_1[_i];
                            if (item.children)
                                item.children = item.children.map(function (v) {
                                    v.label = v.value;
                                    return v;
                                });
                        }
                        _this.categoryData = list1;
                    });
                },
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
                            var _self_1 = _this;
                            var form = _this.publishForm;
                            var imgUrls = form.imgList.map(function (v) { return v.url; }).join(',');
                            var data = {
                                title: form.title,
                                category1: form.cate[0],
                                category2: form.cate[1] || null,
                                quality: form.quality,
                                imgUrls: imgUrls,
                                telNum: form.contact,
                                price: form.price,
                                desciption: form.content
                            };
                            $.ajax({
                                url: '/api/publish',
                                type: 'post',
                                data: JSON.stringify(data),
                                headers: {
                                    'Content-Type': "application/json"
                                },
                            }).done(function (data) {
                                var code = data.code;
                                var msg = data.msg;
                                if (code === 0) {
                                    var id = data.data.id;
                                    _self_1.showSuccess = true;
                                    var url_1 = "/product/" + id;
                                    _self_1.successUrl = url_1;
                                    setTimeout(function () {
                                        location.href = url_1;
                                    }, 3000);
                                }
                                else {
                                    _self_1.$Modal.error({
                                        title: "发生错误",
                                        content: msg
                                    });
                                }
                            });
                        }
                    });
                },
                goDetail: function () {
                    location.href = this.successUrl;
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