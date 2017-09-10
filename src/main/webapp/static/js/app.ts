$(function () {
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
  const $rankItems = $('.rank-item:gt(0)')
  $rankItems.hover(function () {
    $(this).find('.rank-item-hidden').stop().slideDown(300)
  }, function () {
    $(this).find('.rank-item-hidden').stop().slideUp(300)
  })
  
  
  // 主页排行榜吸盘
  $(window).on('scroll', function () {
    const scrollTop = $(this).scrollTop()
    const $rankWrap = $('#rank-wrap')
    if (scrollTop > 100) {
      $rankWrap.addClass('fixed')
    } else {
      $rankWrap.removeClass('fixed')
    }
  })
  
  
  // 查询结果页价格区间搜索，确定按钮的隐藏切换
  const $controlPriceInput = $('.control-price-input')
  $controlPriceInput.on('focus', function () {
    const $t_p = $(this).parent()
    $t_p.addClass('active')
    $t_p.siblings('.control-price-confirm').css('display', 'inline-block')
  })
  $controlPriceInput.on('blur', function () {
    const $t_p = $(this).parent()
    $t_p.removeClass('active')
    $t_p.siblings('.control-price-confirm').css('display', 'none')
  })
  
  
  // 初始化tooltip
  const $htmlTooltip = $('.html-tooltip')
  if ($htmlTooltip.length) {
    $htmlTooltip.tooltipster({
      theme: 'tooltipster-light',
      side: 'bottom',
      interactive: true,
      animation: 'grow'
    })
  }
  
  const $htmlTooltipBtmRight = $('.html-tooltip-btm-right')
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
  const $proTabsItem = $('.pro-tabs .tabs-item')
  const $proTabsPanelItem = $('.pro-tabs .tabs-panel-item')
  $proTabsItem.on('click', function () {
    const $t = $(this)
    const index = $t.index()
    $t.siblings().removeClass('active')
    $t.addClass('active')
    $proTabsPanelItem.removeClass('active')
    $proTabsPanelItem.eq(index).addClass('active')
  })
  
  
  // 商品页评论字数控制
  const $cmtTextarea = $('.comment-tr textarea')
  const $countEle = $('.comment-tr-btm .count')
  $cmtTextarea.on('input', function () {
    const textLength = ( <string> $(this).val() ).length
    $countEle.text(textLength)
  })
  
  // 发布商品页
  if ($('#app-publish').length) {
    appPublish = new Vue({
      el: '#app-publish',
      data: {
        publishForm: {
          cate: [],
          title: '',
          contact: '',
          imgList: []
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
          },
          {
            'name': 'bc7521e033abdd1e92222d733590f104',
            'url': 'https://o5wwk8baw.qnssl.com/bc7521e033abdd1e92222d733590f104/avatar'
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
          const check = this.publishForm.imgList.length < 5
          if (!check) {
            this.$Notice.warning({
              title: '最多只能上传 5 张图片。'
            })
          }
          return check
        }
      }
    })
  }
  
  
  // 个人中心页 订单管理
  if ($('#manager-body').length) {
    managerBody = new Vue({
      el: '#manager-body',
      data: {
        list: [{
        
        }]
      }
    })
  }
})