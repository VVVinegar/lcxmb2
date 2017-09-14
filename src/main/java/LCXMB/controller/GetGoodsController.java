package LCXMB.controller;

import LCXMB.pojo.Msg;
import LCXMB.pojo.Product;
import LCXMB.pojo.User_info;
import LCXMB.service.ProductService;
import LCXMB.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by 759517209@qq.com on 2017/9/13.
 */
@Controller
@RequestMapping(value = "/api")
public class GetGoodsController {

    @Resource
    ProductService productService;
    @Resource
    UserService userService;

    @ResponseBody
    @RequestMapping(value = "/getGoods", method = RequestMethod.POST)
    public Msg getGoods(Integer id, HttpSession session){
        Object userObj = session.getAttribute("username");
        if(userObj != null) {
            String username = userObj.toString();
            Product product = productService.findById(id);
            String saler = product.getSalerUser();
            Float price = product.getPrice();

            User_info salerInfo = userService.findById(saler);
            Float virtualCurrencyBefore = salerInfo.getVirtualCurrency();
            Float virtualCurrencyAfter = virtualCurrencyBefore + price;

            if (change(id, virtualCurrencyAfter, saler)){
                return Msg.success("收货成功").add("status", 0);
            }
            return Msg.fail("服务器错误");
        }
        return Msg.fail("请重新登录");
    }

    public boolean change(Integer pro_id, Float virtualCurrencyAfter, String saler_name){
        try{
            //product表更新商品状态
            Product product = new Product();
            product.setId(pro_id);
            product.setStatus(2);
            productService.updateStatus(product);

            //卖家收钱
            User_info user_info = new User_info();
            user_info.setUsername(saler_name);
            user_info.setVirtualCurrency(virtualCurrencyAfter);
            userService.updateByPrimaryKeySelective(user_info);

            return true;
        }catch (Exception e){
            return false;
        }
    }
}
