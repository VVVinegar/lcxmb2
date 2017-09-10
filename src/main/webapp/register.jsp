<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>兰村小卖部注册</title>
    <link rel="stylesheet" href="css/lib/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="page-login-register">
<div class="main">
    <div class="login-panel">
        <h3 class="no-m" style="font-weight: normal;margin-bottom: 15px;">
            注册
        </h3>
        <form>
            <div class="form-group">
                <label for="username">用户名</label>
                <input type="text" class="form-control" id="username" placeholder="字母、数字、下划线" maxlength="12">
            </div>
            <div class="form-group">
                <label for="password">密码</label>
                <input type="password" class="form-control" id="password" placeholder="至少6位字母、数字、下划线组合" maxlength="16">
            </div>
            <div class="form-group">
                <label for="password1">确认密码</label>
                <input type="password" class="form-control" id="password1" placeholder="确认密码" maxlength="16">
            </div>
            <div class="checkbox">
                <label>
                    <input type="checkbox">
                    我已同意阅读本站的<a href="#">使用条件</a>及<a href="#">隐私申明</a>
                </label>
            </div>
            <div>验证码占位</div>
            <button type="submit" class="btn btn-success btn-block">注册</button>
        </form>
        <button class="btn btn-warning btn-block" style="margin-top: 15px">已经有账号？点击登录</button>
    </div>
    <a href="#" class="text-link">返回首页</a>
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
</body>
</html>