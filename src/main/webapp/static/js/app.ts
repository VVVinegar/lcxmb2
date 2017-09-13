interface JQ extends JQuery {
  tooltipster?(options: any): void
}


$(function () {
  let appRank
  if ($('#app-rank').length) {
    appRank = new Vue({
      el: '#app-rank',
      data: {
        list: [],
        type: 'new',
        loading: false,
      },
      mounted(){
        this.requestData('new');
      },
      methods: {
        requestData(type: string) {
          this.type = type
          this.loading = true
          const _self = this
          $.get(`/api/top10/${type}`).done(function (data) {
            _self.loading = false
            _self.list = data.data.list
            _self.$nextTick(()=>{
              _self.setHover()
            })
          })
        },
        setHover(){
          // 主页排行榜 hover
          const $rankItems: JQ = $('.rank-item:gt(0)')
          $rankItems.hover(function () {
            $(this).find('.rank-item-hidden').stop().slideDown(300)
          }, function () {
            $(this).find('.rank-item-hidden').stop().slideUp(300)
          })
        }
      }
    })
  }


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

  // 商品页评论
  let appComments
  if ($('#app-comments').length) {
    appComments = new Vue({
      el: '#app-comments',
      data: {
        replyer: null,
        content: '',
        showPanel1: true
      },
      methods: {
        setReplyer(replyer): void {
          this.replyer = replyer
        },
        submit(): void {
          const _self = this
          if (_self.content.trim() === '') {
            return _self.$Modal.warning({
              title: '提示',
              content: '请检查输入',
              okText: '确定'
            })
          }
          $.ajax('/api/comment', {
            type: 'post',
            data: {
              replyer: _self.replyer,
              content: _self.content,
              proId: Number($('#productId').val())
            }
          }).done(function (data) {
            const code = data.code
            const msg = data.msg
            if (code === 1) {
              _self.$Modal.error({
                title: '提示',
                content: msg,
                okText: '确定',
                onOk: () => {
                  location.href = `/login?from=/product/${$('#productId').val()}`
                }
              })
            } else {
              _self.$Modal.success({
                title: '提示',
                content: '评论成功',
                okText: '确定',
                onOk: () => {
                  location.reload()
                }
              })
            }
          })
        },
        togglePanel() {
          this.showPanel1 = !this.showPanel1
        }
      }
    })
  }

  // 发布商品页
  const validateCate = (rule, value, callback): void => {
    if (value.length === 0) {
      callback(new Error('请选择分类'))
    } else {
      callback()
    }
  }

  const validateImgList = (rule, value, callback): void => {
    if (value.length) {
      callback()
    } else {
      callback(new Error('请上传描述图片'))
    }
  }

  const validateQuality = (rule, value, callback): void => {
    if (value) {
      callback()
    } else {
      callback(new Error('请输入宝贝成新'))
    }
  }

  const validatePrice = (rule, value, callback): void => {
    if (value) {
      if (!$.isNumeric(Number(value))) {
        callback(new Error('输入不符合格式'))
      } else {
        callback()
      }
    } else {
      callback(new Error('请输入价格'))
    }
  }

  let appPublish
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
          title: [{required: true, message: '请输入标题', trigger: 'blur'}],
          contact: [{required: true, message: '请输入联系方式', trigger: 'blur'}],
          price: [{validator: validatePrice, trigger: 'change'}],
          content: [{required: true, message: '请输入宝贝详情', trigger: 'blur'}],
          cate: [{validator: validateCate, trigger: 'change'}],
          imgList: [{validator: validateImgList, trigger: 'change'}],
          quality: [{validator: validateQuality, trigger: 'change'}],
        },
        categoryData: [],
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
      created() {
        this.getCategory()
      },
      methods: {
        getCategory() {
          const _this = this
          $.get('/static/json/category.json')
            .done(function (list) {
              const list1 = list.map(v => {
                v.label = v.value
                return v
              })

              for (let item of list1) {
                if (item.children)
                  item.children = item.children.map(v => {
                    v.label = v.value
                    return v
                  })
              }
              _this.categoryData = list1
            })
        },
        handleRemove(file) {
          // 从 upload 实例删除数据
          const fileList = this.$refs.upload.fileList
          this.$refs.upload.fileList.splice(fileList.indexOf(file), 1)
        },
        handleSuccess(res, file) {
          const imgUrl = res.data.imageUrl
          file.url = imgUrl
          file.name = imgUrl
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
              const _self = this
              const form = this.publishForm
              const imgUrls = form.imgList.map(v => v.url).join(',')

              const data = {
                title: form.title,
                category1: form.cate[0],
                category2: form.cate[1] || null,
                quality: form.quality,
                imgUrls: imgUrls,
                telNum: form.contact,
                price: form.price,
                desciption: form.content
              }

              $.ajax({
                url: '/api/publish',
                type: 'post',
                data: JSON.stringify(data),
                headers: {
                  'Content-Type': "application/json"
                },
              }).done(function (data) {
                const code = data.code
                const msg = data.msg
                if (code === 0) {
                  const id = data.data.id
                  _self.showSuccess = true
                  const url = `/product/${id}`
                  _self.successUrl = url
                  setTimeout(() => {
                    location.href = url
                  }, 3000)
                } else {
                  _self.$Modal.error({
                    title: "发生错误",
                    content: msg
                  })
                }
              })
            }
          })
        },
        goDetail() {
          location.href = this.successUrl
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