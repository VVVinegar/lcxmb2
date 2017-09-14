package LCXMB.controller;

import LCXMB.pojo.Msg;
import LCXMB.pojo.Product;
import LCXMB.pojo.SearchProducts;
import LCXMB.pojo.User_info;
import LCXMB.service.ProductService;
import LCXMB.service.SearchService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
@RequestMapping(value = "")
public class PageSearchController {

    @Resource
    SearchService searchService;

    int pageSize = 5;

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String login(Boolean isCate, String keywords, Integer newOrHot,Float minPrice,Float maxPrice,Integer lowOrHigh, Integer page, ModelMap modelMap){
        isCate = isCate == null ? true : isCate;
//        keywords = keywords ==null? "奔驰": keywords;
        newOrHot = newOrHot == null ? 0 : newOrHot;
        lowOrHigh = lowOrHigh == null ? 0 : lowOrHigh;
        minPrice = minPrice == null ? 0 : minPrice;
        maxPrice = maxPrice == null ? 99999 : maxPrice;
        page = page == null ? 1 : page;
        page -= 1;
        int begin = page * pageSize;

        if(isCate){                          //按分类查询
            List<SearchProducts> products =  searchService.getProductsByCate(minPrice, maxPrice, keywords, newOrHot, lowOrHigh, begin, pageSize);
            modelMap.addAttribute("products", products);
            return "search";
        }else{                               //按关键字查询
            List<SearchProducts> products =  searchService.getProductsByTitle(keywords, begin, pageSize);
            modelMap.addAttribute("products", products);
            return "search";
        }
    }

}
