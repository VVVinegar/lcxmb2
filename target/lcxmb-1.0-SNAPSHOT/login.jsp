<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>兰村小卖部登录</title>
    <link rel="stylesheet" href="static/css/lib/bootstrap.min.css">
    <link rel="stylesheet" href="static/css/style.css">
    <script src="static/js/lib/jquery.min.js"></script>
</head>
<body class="page-login-register">
<div class="main">
    <div class="login-panel">
        <h3 class="no-m" style="font-weight: normal;margin-bottom: 15px;">
            登录
        </h3>
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
                    <input type="checkbox"> 记住登陆状态
                </label>
                <a href="#" class="pull-right text-link">忘记密码？</a>
            </div>
            <button type="button" class="btn btn-success btn-block" id="submit">登录</button>
        </form>
        <button class="btn btn-warning btn-block" style="margin-top: 15px">还没有账号？立即注册</button>
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
        function removeValid() {
            var $user = $('#username')
            var $pass = $('#password')
            $user.prev().text('')
            $user.parent().removeClass('has-error')
            $pass.prev().text('')
            $pass.parent().removeClass('has-error')
        }

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

        $("#submit").on("click", function () {
            var username = $("#username").val()
            var password = $("#password").val()
            if(validate(username, password)) {
                $(this).text('正在登录')
                $.post('/login', {
                    username: username,
                    password: password
                }).done(function (data) {
                    console.log(data)
                })
            }
        })
    })
</script>
</body>
</html>