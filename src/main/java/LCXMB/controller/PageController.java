package LCXMB.controller;

import LCXMB.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * Created by 759517209@qq.com on 2017/9/10.
 */
@Controller
//@RequestMapping("")
public class PageController {

    @Resource
    ProductService productService;


    @RequestMapping(value = "/login")
    public String login(){
        return "login";
    }

    @RequestMapping(value = "/register")
    public String register(){
        return "register";
    }

    @RequestMapping(value = "/search")
    public String search(){
        return "search";
    }

    @RequestMapping(value = "/pay_success")
    public String paySuccess(){
        return "paySuccess";
    }

}
