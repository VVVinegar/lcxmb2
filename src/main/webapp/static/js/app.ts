interface JQ extends JQuery {
  tooltipster?(options: any): void
}

$(function () {
  let appRank
  if ($('#app-rank').length) {
    appRank = new Vue({
      el: '#app-rank',
      data: {
        showSelectPanel: false
      },
      methods: {
        toggleSelectPanel(): void {
          this.showSelectPanel = !this.showSelectPanel
        }
      }
    })
  }
  
  
  // 主页排行榜 hover
  const $rankItems: JQ = $('.rank-item:gt(0)')
  $rankItems.hover(function () {
    $(this).find('.rank-item-hidden').stop().slideDown(300)
  }, function () {
    $(this).find('.rank-item-hidden').stop().slideUp(300)
  })
  
  
  // 主页排行榜吸盘
  $(window).on('scroll', function () {
    const scrollTop: number = $(this).scrollTop()
    const $rankWrap: JQ = $('#rank-wrap')
    if (scrollTop > 100) {
      $rankWrap.addClass('fixed')
    } else {
      $rankWrap.removeClass('fixed')
    }
  })
  
  
  // 查询结果页价格区间搜索，确定按钮的隐藏切换
  const $controlPriceInput: JQ = $('.control-price-input')
  $controlPriceInput.on('focus', function () {
    const $t_p: JQ = $(this).parent()
    $t_p.addClass('active')
    $t_p.siblings('.control-price-confirm').css('display', 'inline-block')
  })
  $controlPriceInput.on('blur', function () {
    const $t_p: JQ = $(this).parent()
    $t_p.removeClass('active')
    $t_p.siblings('.control-price-confirm').css('display', 'none')
  })
  
  
  // 初始化tooltip
  const $htmlTooltip: JQ = $('.html-tooltip')
  if ($htmlTooltip.length) {
    $htmlTooltip.tooltipster({
      theme: 'tooltipster-light',
      side: 'bottom',
      interactive: true,
      animation: 'grow'
    })
  }
  
  const $htmlTooltipBtmRight: JQ = $('.html-tooltip-btm-right')
  if ($htmlTooltipBtmRight.length) {
    $htmlTooltipBtmRight.tooltipster({
      theme: 'tooltipster-light',
      side: 'bottom',
      interactive: true,
      animation: 'grow',
      functionPosition(instance, helper, position) {
        const helperRight = helper.geo.origin.offset.right
        const width = position.size.width
        position.coord.left = helperRight - width
        return position
      }
    })
  }
  
  // 商品详情页 tabs 切换
  const $proTabsItem: JQ = $('.pro-tabs .tabs-item')
  const $proTabsPanelItem: JQ = $('.pro-tabs .tabs-panel-item')
  $proTabsItem.on('click', function () {
    const $t = $(this)
    const index = $t.index()
    $t.siblings().removeClass('active')
    $t.addClass('active')
    $proTabsPanelItem.removeClass('active')
    $proTabsPanelItem.eq(index).addClass('active')
  })
  
  
  // 商品页评论字数控制
  const $cmtTextarea: JQ = $('.comment-tr textarea')
  const $countEle: JQ = $('.comment-tr-btm .count')
  $cmtTextarea.on('input', function () {
    const textLength: number = ( <string> $(this).val() ).length
    $countEle.text(textLength)
  })
  
  // 发布商品页
  const validateCate = (rule, value, callback): void => {
    if (value.length === 0) {
      callback(new Error('请选择分类'))
    } else {
      callback()
    }
  }

  const validateImgList = (rule, value, callback): void => {
    if(value.length) {
      callback()
    } else {
      callback(new Error('请上传描述图片'))
    }
  }

  const validateQuality = (rule, value, callback): void => {
    if(value) {
      callback()
    } else {
      callback(new Error('请输入宝贝成新'))
    }
  }

  let appPublish
  if ($('#app-publish').length) {
    appPublish = new Vue({
      el: '#app-publish',
      data: {
        width: '200',
        publishForm: {
          cate: [],
          title: '',
          contact: '',
          imgList: [],
          content: '',
          quality: 10
        },
        publishRules: {
          title: [{required: true, message: '请输入标题', trigger: 'blur'}],
          cate: [{validator: validateCate, trigger: 'change'}],
          contact: [{required: true, message: '请输入联系方式', trigger: 'blur'}],
          imgList: [{validator: validateImgList}],
          content: [{required: true, message: '请输入宝贝详情', trigger: 'blur'}],
          quality: [{validator: validateQuality, trigger: 'change'}]
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
      mounted() {
        this.publishForm.imgList = this.$refs.upload.fileList
      },
      methods: {
        handleRemove(file) {
          // 从 upload 实例删除数据
          const fileList = this.$refs.upload.fileList
          this.$refs.upload.fileList.splice(fileList.indexOf(file), 1)
        },
        handleSuccess(res, file) {
          // 因为上传过程为实例，这里模拟添加 url
          file.url = 'https://o5wwk8baw.qnssl.com/7eb99afb9d5f317c912f08b5212fd69a/avatar'
          file.name = '7eb99afb9d5f317c912f08b5212fd69a'
        },
        handleFormatError(file) {
          this.$Notice.warning({
            title: '文件格式不正确',
            desc: '文件 ' + file.name + ' 格式不正确，请上传 jpg 或 png 格式的图片。'
          })
        },
        handleMaxSize(file) {
          this.$Notice.warning({
            title: '超出文件大小限制',
            desc: '文件 ' + file.name + ' 太大，不能超过 2M。'
          })
        },
        handleBeforeUpload() {
          const check: boolean = this.publishForm.imgList.length < 5
          if (!check) {
            this.$Notice.warning({
              title: '最多只能上传 5 张图片。'
            })
          }
          return check
        },
        handleSubmit() {
          this.$refs.publish.validate((valid) => {
            if (valid) {
              const form = this.publishForm
              const imgUrls = form.imgList.join(',')
              $.post('/api/publish', {
                title: form.title,
                cate1: form.cate[0],
                cate2: form.cate[1] || null,
                quality: form.quality,
                imgUrls: imgUrls,
                telNum: form.contact,
                description: form.content
              }).done(function (data) {
                const code = data.code
                const msg = data.msg
                if(code === 0){
                  const id = data.data.id
                  this.$Modal.success({
                    title: '提示',
                    content: '发布成功',
                    okText: '查看详情',
                    onOk: () => {
                      location.href = ''
                    }
                  })
                } else {
                  this.$Modal.error({
                    title: "发生错误",
                    content: msg
                  })
                }
              })
            }
          })
        }
      }
    })
  }
  
  
  // 个人中心页 tabs 切换
  const $iTabsItem: JQ = $('.i-tabs-toggle .i-tabs-item')
  $iTabsItem.on('click', function () {
    const $t: JQ = $(this)
    const index: number = $t.index()
    const $iTabsPanelItem: JQ = $t.parent().next().children('.i-tabs-panel-item')
    $t.siblings().removeClass('active')
    $t.addClass('active')
    $iTabsPanelItem.removeClass('active')
    $iTabsPanelItem.eq(index).addClass('active')
  })
})