package LCXMB.controller;

import LCXMB.pojo.Msg;
import LCXMB.pojo.User_login;
import LCXMB.service.LoginService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * Created by 759517209@qq.com on 2017/9/8.
 */
@Controller
@RequestMapping("")
@Scope("prototype")
public class LoginController {

    @Resource
    LoginService loginService;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Msg login(String username, String password){
        User_login user_login = new User_login();

        boolean result = loginService.verify(username, password);
        if(result){
            user_login.setUsername(username);
            user_login.setPassword(password);
            return Msg.success("登陆成功").add("user_info", user_login);
        }else{
            return Msg.fail("登录失败 ");
        }
    }
}
