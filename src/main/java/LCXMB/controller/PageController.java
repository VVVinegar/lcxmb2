package LCXMB.controller;

import LCXMB.pojo.Product;
import LCXMB.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 759517209@qq.com on 2017/9/10.
 */
@Controller
@RequestMapping("")
public class PageController {

    @Resource
    ProductService productService;

    @RequestMapping(value = "/")
    public String index(ModelMap modelMap) {
        System.out.println("this");
        String[] categories = {"数码产品","二手书籍","生活用品","鞋服配饰","美容美颜","虚拟商品"};
//        for (String category:categories
//             ) {
//            List<Product> productList= productService.getProducts("数码产品");
//            mav.addObject("products", productList);
//        }
        modelMap.addAttribute("test","test");

        return "index";
    }

    @RequestMapping(value = "/login")
    public String login(){
        return "login";
    }

    @RequestMapping(value = "/register")
    public String register(){
        return "register";
    }

    @RequestMapping(value = "/publish")
    public String publish(){
        return "publish";
    }

    @RequestMapping(value = "/search")
    public String search(){
        return "search";
    }

}
