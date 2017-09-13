package LCXMB.controller;

import LCXMB.pojo.Product;
import LCXMB.pojo.Shipping_address;
import LCXMB.pojo.User_info;
import LCXMB.service.AddressService;
import LCXMB.service.ProductService;
import LCXMB.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by 759517209@qq.com on 2017/9/10.
 */
@Controller
@RequestMapping("")
public class PagePayController {

    @Resource
    ProductService productService;
    @Resource
    UserService userService;
    @Resource
    AddressService addressService;

    @RequestMapping(value = "/pay")
    public String pay(int p_id, ModelMap model, HttpSession session){

        Object username = session.getAttribute("username");
        if(username == null) {
            return "/login";
        } else {
            Product product = productService.findById(p_id);
            User_info me = userService.findById(username.toString());
            Shipping_address address = addressService.findById(me.getDefaultAddress());

            model.addAttribute("me", me);
            model.addAttribute("product", product);
            model.addAttribute("address", address);
        }

        return "/pay";
    }

}
