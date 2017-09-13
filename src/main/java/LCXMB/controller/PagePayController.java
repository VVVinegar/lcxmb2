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
    public String pay(int p_id, ModelMap model){

        Product product = productService.findById(p_id);
        User_info saler = userService.findById(product.getSalerUser());
        Shipping_address address = addressService.findById(saler.getDefaultAddress());

        model.addAttribute("saler", saler);
        model.addAttribute("product", product);
        model.addAttribute("address", address);

        return "/pay";
    }

}
