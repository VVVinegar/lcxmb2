package LCXMB.controller;

import LCXMB.dao.ProductMapper;
import LCXMB.pojo.Product;
import LCXMB.pojo.User_info;
import LCXMB.service.ProductService;
import LCXMB.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by 759517209@qq.com on 2017/9/10.
 */
@Controller
@RequestMapping("")
public class PageProductController {

    @Resource
    ProductService productService;


    @RequestMapping(value = "/product/{p_id}")
    public String findProductById(@PathVariable int p_id, ModelMap model){
        Product product = productService.findById(p_id);

        model.addAttribute("product", product);

        return "/product";
    }

}
