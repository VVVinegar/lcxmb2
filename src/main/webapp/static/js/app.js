var fromNow = function (time) {
    var now_stamp = Date.now();
    var interval = now_stamp - time;
    if (interval < 1000 * 60) {
        return '刚刚';
    }
    if (interval < 1000 * 60 * 60) {
        return Math.floor(interval / 1000 / 60) + " \u5206\u949F\u524D";
    }
    if (interval < 1000 * 3600 * 24) {
        return Math.floor(interval / 1000 / 3600) + " \u5C0F\u65F6\u524D";
    }
    if (interval < 1000 * 3600 * 24 * 30) {
        return Math.floor(interval / 1000 / 3600 / 24) + " \u5929\u524D";
    }
    if (interval < 1000 * 3600 * 24 * 30 * 12) {
        return Math.floor(interval / 1000 / 3600 / 24 / 30) + " \u4E2A\u6708\u524D";
    }
    return Math.floor(interval / 1000 / 3600 / 24 / 30 / 12) + " \u5E74\u524D";
};
$(function () {
    // 商品搜索页 时间 格式化为几小时前
    var $cateItemTime = $('.cate-item-time');
    $cateItemTime.each(function () {
        var time = new Date($(this).text()).getTime();
        $(this).text(fromNow(time));
    });
    var appRank;
    if ($('#app-rank').length) {
        appRank = new Vue({
            el: '#app-rank',
            data: {
                list: [],
                type: 'new',
                loading: false,
                firstRequest: true
            },
            mounted: function () {
                this.requestData('new');
            },
            filters: {
                fromNow: function (time) {
                    return fromNow(time);
                }
            },
            methods: {
                requestData: function (type) {
                    this.type = type;
                    this.loading = true;
                    var _self = this;
                    $.get("/api/top10/" + type).done(function (data) {
                        _self.loading = false;
                        _self.list = data.data.list;
                        _self.$nextTick(function () {
                            if (_self.firstRequest) {
                                _self.setHover();
                            }
                        });
                    });
                },
                setHover: function () {
                    // 主页排行榜 hover
                    var $rankItems = $('.rank-item:gt(0)');
                    $rankItems.hover(function () {
                        $(this).find('.rank-item-hidden').stop().slideDown(300);
                    }, function () {
                        $(this).find('.rank-item-hidden').stop().slideUp(300);
                    });
                },
            }
        });
    }
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
            animation: 'grow',
            trigger: 'click'
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
        var wd = window;
        appPublish = new Vue({
            el: '#app-publish',
            data: {
                width: '200',
                showSuccess: false,
                successUrl: '',
                proId: wd.proId,
                publishForm: wd.publishForm,
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
                defaultList: wd.defaultList
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
                            var ajax_cb_1 = function (data, ctx) {
                                var code = data.code;
                                var msg = data.msg;
                                if (code === 0) {
                                    var id = data.data.id;
                                    ctx.showSuccess = true;
                                    var url_1 = "/product/" + id;
                                    ctx.successUrl = url_1;
                                    setTimeout(function () {
                                        location.href = url_1;
                                    }, 3000);
                                }
                                else {
                                    ctx.$Modal.error({
                                        title: "发生错误",
                                        content: msg
                                    });
                                }
                            };
                            if (_this.proId) {
                                data.id = _this.proId;
                                $.ajax({
                                    url: '/api/publish/update',
                                    type: 'post',
                                    data: data,
                                }).done(function (data) {
                                    ajax_cb_1(data, _self_1);
                                });
                            }
                            else {
                                $.ajax({
                                    url: '/api/publish',
                                    type: 'post',
                                    data: JSON.stringify(data),
                                    headers: {
                                        'Content-Type': "application/json"
                                    },
                                }).done(function (data) {
                                    ajax_cb_1(data, _self_1);
                                });
                            }
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