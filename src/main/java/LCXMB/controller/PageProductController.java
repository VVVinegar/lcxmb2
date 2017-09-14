package LCXMB.controller;

import LCXMB.pojo.Pro_comment;
import LCXMB.pojo.Product;
import LCXMB.pojo.User_info;
import LCXMB.service.CommentService;
import LCXMB.service.ProductService;
import LCXMB.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 759517209@qq.com on 2017/9/10.
 */
@Controller
@RequestMapping("")
public class PageProductController {

    @Resource
    ProductService productService;

    @Resource
    UserService userService;

    @Resource
    CommentService commentService;

    @RequestMapping(value = "/product/{p_id}")
    public String findProductById(@PathVariable int p_id, ModelMap model) {
        Product product = productService.findById(p_id);
        User_info saler = userService.findById(product.getSalerUser());
        List<Pro_comment> comments = commentService.findByProId(p_id);

        product.setWatchCount(product.getWatchCount() + 1);
        productService.update(product);

        model.addAttribute("product", product);
        model.addAttribute("saler", saler);
        model.addAttribute("comments", comments);

        return "/product";
    }

}
