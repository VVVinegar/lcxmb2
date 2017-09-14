package LCXMB.controller;

import LCXMB.pojo.Msg;
import LCXMB.pojo.Orders;
import LCXMB.pojo.User_info;
import LCXMB.service.EvaluateService;
import LCXMB.service.OrdersService;
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
    @Resource
    OrdersService ordersService;

    @ResponseBody
    public Msg evaluate(Integer score, Integer order_id, HttpSession session){
        String username = session.getAttribute("username").toString();
        //得到要更新哪个用户的信誉度
        String aimName = evaluateService.getUsername(order_id, username);
        //查询该用户信誉度
        int creditsBefore = userService.findById(aimName).getCredits();
        //更新user_info表信誉度
        int creditsAfter = creditsBefore += (score - STANDARD);
        User_info user_info = new User_info();
        user_info.setUsername(aimName);
        user_info.setCredits(creditsAfter);

        if(evaluateService.evaluate(user_info)>0){
            //向订单表添加评分信息
            Orders orders = new Orders();
            orders.setId(order_id);
            if (evaluateService.buyerOrSaler(order_id, username)==0){
                orders.setBuyer_score(creditsAfter);
            }else{
                orders.setSaler_score(creditsAfter);
            }
            if(ordersService.updateScore(orders)>0){
                return Msg.success("评价成功").add("status",0);
            }
            return Msg.fail("服务器错误");
        }
        return Msg.fail("服务器错误");
    }
}
