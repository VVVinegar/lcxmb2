package LCXMB.controller;

import LCXMB.pojo.Msg;
import LCXMB.pojo.User_login;
import LCXMB.service.LoginService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by 759517209@qq.com on 2017/9/8.
 */
@Controller
@RequestMapping(value = "/api")
public class LoginController {

    @Resource
    LoginService loginService;

    @ResponseBody
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public Msg login(String username, String password, HttpSession session){

        boolean result = loginService.verify(username, password);
        if(result){
            User_login user_login = new User_login(username, password);
            session.setAttribute("username", user_login.getUsername());
            return Msg.success("登陆成功").add("status", 0);
        }else{
            return Msg.success("登录失败 ").add("status", 1);
        }
    }
}
