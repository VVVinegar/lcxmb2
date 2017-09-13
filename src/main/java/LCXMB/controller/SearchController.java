package LCXMB.controller;

import LCXMB.pojo.Msg;
import LCXMB.pojo.Product;
import LCXMB.pojo.User_info;
import LCXMB.service.ProductService;
import LCXMB.service.SearchService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by 759517209@qq.com on 2017/9/13.
 */
@Controller
@RequestMapping(value = "/api")
public class SearchController {

    @Resource
    SearchService searchService;

    @ResponseBody
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public Msg login(boolean isCate, String keywords, int newOrHot, int minPrice, int maxPrice, int lowOrHigh, int page){
        if(isCate){                          //按分类查询
            try {
                List<Product> products =  searchService.getProductsByCate(minPrice, maxPrice, keywords, newOrHot, lowOrHigh, page);
                return Msg.success("查询成功").add("products", products);
            }catch (Exception e){
                return Msg.fail("服务器错误");
            }
        }else{                               //按关键字查询
            try {
                List<Product> products =  searchService.getProductsByTitle(keywords, page);
                return Msg.success("查询成功").add("products", products);
            }catch (Exception e){
                return Msg.fail("服务器错误");
            }
        }
    }

}
