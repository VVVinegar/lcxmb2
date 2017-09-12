package LCXMB.controller;

import LCXMB.pojo.Msg;
import LCXMB.pojo.User_login;
import LCXMB.service.RegisterService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by 759517209@qq.com on 2017/9/10.
 */
@Controller
@RequestMapping("/api")
public class RegisterController {

    @Resource
    RegisterService registerService;

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public Msg login(String username, String password, String password1, HttpSession session){

        if (isExist(username)){
            return Msg.success("用户名存在 ").add("status", 1);
        }else if (!isStandardUsername(username)){
            return Msg.success("用户名格式错误 ").add("status", 1);
        }else if (!isStandardPassword(password)){
            return Msg.success("密码格式错误 ").add("status", 1);
        }else if(!isSame(password, password1)){
            return Msg.success("两次输入密码不一致 ").add("status", 1);
        }else{
            if (registerService.register(username, password)){
                session.setAttribute("username", username);
                return Msg.success("注册成功 ").add("status", 0);
            }else{
                return Msg.fail("服务器错误 ");
            }
        }
    }

    public boolean isExist(String username){
        return registerService.isExist(username);
    }

    public boolean isStandardUsername(String username){
        Pattern p = Pattern.compile("[A-Za-z0-9]{6,16}");
        Matcher m = p.matcher(username);
        return m.matches();
    }

    public boolean isStandardPassword(String password){
        Pattern p = Pattern.compile("\\w{6,16}");
        Matcher m = p.matcher(password);
        return m.matches();
    }

    public boolean isSame(String password, String password1){
        return password.equals(password1);
    }
}
