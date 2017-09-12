<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>兰村小卖部注册</title>
    <link rel="stylesheet" href="/static/css/lib/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/style.css">
    <script src="/static/js/lib/jquery.min.js"></script>
</head>
<body class="page-login-register">
<div class="main">
    <div class="login-panel">
        <h3 class="no-m" style="font-weight: normal;margin-bottom: 15px;">注册</h3>
        <form>
            <div class="form-group">
                <label for="username" class="pull-left">用户名</label>
                <p class="no-m text-right" style="color: #a94442"></p>
                <input  class="form-control register-input" id="username" placeholder="6 - 16 位字母、数字" maxlength="16">
            </div>
            <div class="form-group">
                <label for="password" class="pull-left">密码</label>
                <p class="no-m text-right" style="color: #a94442"></p>
                <input type="password" class="form-control register-input" id="password" placeholder="6 - 16 位字母、数字、下划线组合" maxlength="16">
            </div>
            <div class="form-group">
                <label for="password1" class="pull-left">确认密码</label>
                <p class="no-m text-right" style="color: #a94442"></p>
                <input type="password" class="form-control register-input" id="password1" placeholder="确认密码" maxlength="16">
            </div>
            <div class="checkbox">
                <label>
                    <input type="checkbox" id="checked">
                    我已同意阅读本站的<a href="#">使用条件</a>及<a href="#">隐私申明</a>
                </label>
            </div>
            <p class="text-danger" id="register-warn"></p>
            <button type="button" class="btn btn-success btn-block disabled" id="register-btn">注册</button>
        </form>
        <a class="btn btn-warning btn-block" href="/login" style="margin-top: 15px">已经有账号？点击登录</a>
    </div>
    <a href="/" class="text-link">返回首页</a>
</div>
<div class="footer-info">
    <p class="text-center">
        <a href="#">使用条件</a>  |
        <a href="#">隐私申明</a>  |
        <a href="#">帮助</a>
    </p>
    <p class="text-center no-m">
        版权所有 © 2017，兰村小卖部
    </p>
</div>
<script>
    $(function () {
        // 选中 checkbox , 改变注册按钮状态
        $('#checked').on('change', function(ev){
            var checked = $(ev.target).prop('checked')
            var $rBtn = $("#register-btn")
            if(checked) {
                $rBtn.removeClass('disabled')
            } else {
                $rBtn.addClass('disabled')
            }
        })

        // 移除验证提示
        function removeValid() {
            var $user = $('#username')
            var $pass = $('#password')
            var $pass1 = $('#password1')
            $user.prev().text('')
            $user.parent().removeClass('has-error')
            $pass.prev().text('')
            $pass.parent().removeClass('has-error')
            $pass1.prev().text('')
            $pass1.parent().removeClass('has-error')
        }

        function validate(username, password, password1) {
            removeValid()

            var $userLabel = $('#username').prev()
            var $userInput = $('#username').parent()
            var $passLabel = $('#password').prev()
            var $passInput = $('#password').parent()
            var $pass1Label = $('#password1').prev()
            var $pass1Input = $('#password1').parent()

            if(username.trim() === ''){
                $userLabel.text('请输入用户名')
                $userInput.addClass('has-error')
                $('#username').focus()
                return false
            }

            if(password.trim() === '') {
                $passLabel.text('请输入密码')
                $passInput.addClass('has-error')
                $('#password').focus()
                return false
            }

            if(password1.trim() === '') {
                $pass1Label.text('请确认密码')
                $pass1Input.addClass('has-error')
                $('#password1').focus()
                return false
            }

            if(password !== password1) {
                $pass1Label.text('密码不一致')
                $pass1Input.addClass('has-error')
                $('#password1').focus()
                return false
            }

            if(!/^[a-zA-Z0-9]{6,16}$/.test(username)){
                $userLabel.text('用户名不符合格式')
                $pass1Input.addClass('has-error')
                $('#username').focus()
                return false
            }

            if(!/^\w{6,16}$/.test(password)){
                $passLabel.text('密码不符合格式')
                $passInput.addClass('has-error')
                $('#password').focus()
                return false
            }

            return true
        }

        $('#register-btn').on('click', function(){
            var username = $('#username').val()
            var password = $('#password').val()
            var password1 = $('#password1').val()
            if(validate(username, password, password1)) {
                $.post('/api/register', {
                    username: username,
                    password: password,
                    password1: password1
                }).then(function(data){
                    var code = data.code
                    var msg = data.msg
                    var $registerWarn = $('#register-warn')
                    var $registerBtn = $('#register-btn')
                    if(code === 0) {
                        var status = data.data.status
                        if(status === 0) {
                            $registerWarn.text('注册成功，正在为你登录...')
                            setTimeout(function () {
                                location.href = '/'
                            }, 1000)
                        } else {
                            $registerWarn.text(msg)
                            $registerBtn.text('注册失败').addClass('danger')
                        }
                    } else {
                        $registerWarn.text(msg)
                        $registerBtn.text('注册失败').addClass('danger')
                    }
                })
            }
        })

        $('.register-input').on('focus', function () {
            $("#register-btn").text('登录').removeClass('btn-danger')
            $('#register-warn').text('')
        })
    })
</script>
</body>
</html>