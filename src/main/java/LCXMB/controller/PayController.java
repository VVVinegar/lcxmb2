package LCXMB.controller;

import LCXMB.pojo.*;
import LCXMB.service.LoginService;
import LCXMB.service.OrderService;
import LCXMB.service.ProductService;
import LCXMB.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by 759517209@qq.com on 2017/9/13.
 */
@Controller
@RequestMapping(value = "/api")
public class PayController {

    @Resource
    UserService userService;
    @Resource
    ProductService productService;
    @Resource
    OrderService orderService;

    @ResponseBody
    @RequestMapping(value = "/pay", method = RequestMethod.POST)
    public Msg login(int id, String title, String saler_user, int price, HttpSession session){
        String username = session.getAttribute("username").toString();
        int virtualCurrencyBefore = userService.findById(username).getVirtualCurrency();
        if(virtualCurrencyBefore < price){
            return Msg.success("余额不足").add("status",1);
        }else{
            if(change(id, username, saler_user, price, virtualCurrencyBefore))
                return Msg.success("支付成功").add("status",0);
            return Msg.fail("服务器出错");
        }
    }

    @Transactional
    public boolean change(int pro_id, String buyer_name, String saler_user, int price, int virtualCurrencyBefore){
        try {
            //先扣除金额
            int virtualCurrencyAfter = virtualCurrencyBefore - price;

            User_info user_info = new User_info();
            user_info.setUsername(buyer_name);
            user_info.setVirtualCurrency(virtualCurrencyAfter);

            userService.updateByPrimaryKeySelective(user_info);

            //更新产品状态
            Product product = new Product();
            product.setId(pro_id);
            product.setStatus(1);
            productService.updateStatus(product);

            //order表插入数据
            Order order = new Order();
            order.setBuyerName(buyer_name);
            order.setSalerName(saler_user);
            order.setProId(pro_id);
            Date date = new Date();
            Timestamp timeStamp = new Timestamp(date.getTime());
            order.setTime(timeStamp);
            orderService.add(order);

            return true;
        }catch (Exception e){
            return false;
        }
    }
}
