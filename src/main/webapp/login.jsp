<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>兰村小卖部登录</title>
    <link rel="stylesheet" href="static/css/lib/bootstrap.min.css">
    <link rel="stylesheet" href="static/css/style.css">
    <script src="static/js/lib/qs.js"></script>
    <script src="static/js/lib/js.cookie.js"></script>
    <script src="static/js/lib/jquery.min.js"></script>
</head>
<body class="page-login-register">
<div class="main">
    <div class="login-panel">
        <h3 class="no-m" style="font-weight: normal;margin-bottom: 15px;">登录</h3>
        <form>
            <div class="form-group">
                <label for="username" class="pull-left">用户名</label>
                <p class="no-m text-right" style="color: #a94442"></p>
                <input class="form-control login-input" id="username" placeholder="请输入用户名">
            </div>
            <div class="form-group">
                <label for="password" class="pull-left">密码</label>
                <p class="no-m text-right" style="color: #a94442"></p>
                <input type="password" class="form-control login-input" id="password" placeholder="请输入密码">
            </div>
            <div class="checkbox">
                <label>
                    <input type="checkbox" id="checked"> 记住密码
                </label>
                <a href="#" class="pull-right text-link">忘记密码？</a>
            </div>
            <p class="text-danger" id="login-warn"></p>
            <button type="button" class="btn btn-success btn-block" id="submit">登录</button>
        </form>
        <a class="btn btn-warning btn-block" href="/register" style="margin-top: 15px">还没有账号？立即注册</a>
        <p class="no-m" style="margin-top: 15px;">
            登录即表示同意本站的<a href="#">使用条件</a>及<a href="#">隐私申明</a>
        </p>
    </div>
    <a href="#" class="text-link">返回首页</a>
</div>
<div class="footer-info">
    <p class="text-center">
        <a href="#">使用条件</a> |
        <a href="#">隐私申明</a> |
        <a href="#">帮助</a>
    </p>
    <p class="text-center no-m">
        版权所有 © 2017，兰村小卖部
    </p>
</div>
<script>
    $(function () {
        // 得到从哪个页面来
        function getFromPage(querystring) {
            var qsObj = Qs.parse(querystring)
            if ($.isEmptyObject(qsObj)) {
                return null
            } else {
                return qsObj.from
            }
        }

        // 移除验证提示
        function removeValid() {
            var $user = $('#username')
            var $pass = $('#password')
            $user.prev().text('')
            $user.parent().removeClass('has-error')
            $pass.prev().text('')
            $pass.parent().removeClass('has-error')
        }

        // 验证是否已填
        function validate(user, pass) {
            removeValid()

            if (user.trim() === '') {
                var $user = $('#username')
                $user.prev().text('请输入用户名')
                $user.parent().addClass('has-error')
                $user.focus()
                return false
            }

            if (pass.trim() === '') {
                var $pass = $('#password')
                $pass.prev().text('请输入密码')
                $pass.parent().addClass('has-error')
                $pass.focus()
                return false
            }

            return true
        }

        // 记住登录信息
        function rememberLogin(username, password, checked) {
            Cookies.set('loginStatus', {
                username: username,
                password: password,
                checked: checked
            }, {expires: 30, path: ''})
        }

        // 若选择记住登录信息，则进入页面时设置登录信息
        function setLoginStatus() {
            var loginStatusText = Cookies.get('loginStatus')
            if (loginStatusText) {
                var loginStatus
                try {
                    loginStatus = JSON.parse(loginStatusText)
                    $('#username').val(loginStatus.username)
                    $('#password').val(loginStatus.password)
                    $('#checked').prop('checked', true)
                } catch (__) {}
            }
        }

        // 设置登录信息
        setLoginStatus()

        // 登录
        $("#submit").on("click", function () {
            var checked = $('#checked').prop("checked")
            var username = $("#username").val()
            var password = $("#password").val()
            if (validate(username, password)) {
                var $t = $(this)
                $t.text('正在登录')
                $.post('/api/login', {
                    username: username,
                    password: password
                }).done(function (data) {
                    var status = data.data.status
                    if (status === 0) {
                        var fromPage = getFromPage(location.search.substr(1))
                        $('#login-warn').text('登录成功，正在返回...')
                        // 记住登录信息
                        if(checked) {
                            rememberLogin(username, password)
                        } else {
                            Cookies.remove('loginStatus')
                        }

                        setTimeout(function () {
                            location.href = fromPage || '/'
                        }, 1000)
                    } else {
                        var msg = data.msg
                        $('#login-warn').text(msg)
                        $t.text('登录失败').addClass('btn-danger')
                    }
                })
            }
        })


        $('.login-input').on('focus', function () {
            $("#submit").text('登录').removeClass('btn-danger')
            $('#login-warn').text('')
        })
    })
</script>
</body>
</html>