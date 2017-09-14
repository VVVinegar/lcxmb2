package LCXMB.controller;

import LCXMB.pojo.Product;
import LCXMB.service.ProductService;
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
public class PagePublishController {

    @Resource
    ProductService productService;

    @RequestMapping(value = "/publish")
    public String publish(Integer p_id,ModelMap model, HttpSession session){

        if(p_id != null) {
            Object username = session.getAttribute("username");
            Product product = productService.findById(p_id);
            if(username != null) {
                // 判断是不是本人操作
                if (username.toString().equals(product.getSalerUser()) && product.getStatus() == 0) {
                    model.addAttribute("product", product);
                } else {
                    model.addAttribute("fail", true);
                }
            }
        }

        return "/publish";
    }

}
