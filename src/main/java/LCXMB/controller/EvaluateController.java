package LCXMB.controller;

import LCXMB.pojo.Msg;
import LCXMB.pojo.User_info;
import LCXMB.service.EvaluateService;
import LCXMB.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by 759517209@qq.com on 2017/9/14.
 */
@Controller
@RequestMapping(value = "/api")
public class EvaluateController {

    public static final int STANDARD = 3;

    @Resource
    UserService userService;
    @Resource
    EvaluateService evaluateService;

    @ResponseBody
    public Msg evaluate(Integer score, Integer order_id, HttpSession session){
        String username = session.getAttribute("username").toString();
        //得到要更新哪个用户的信誉度
        String aimName = evaluateService.getUsername(order_id, username);

        //查询该用户信誉度
        int creditsBefore = userService.findById(aimName).getCredits();
        int creditsAfter = creditsBefore += (score - STANDARD);
        User_info user_info = new User_info();
        user_info.setUsername(aimName);
//        user_info.setCredits();




        return  Msg.success("");
    }
}
