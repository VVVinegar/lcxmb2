package LCXMB.controller;

import LCXMB.pojo.SearchProducts;
import LCXMB.service.SearchService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 759517209@qq.com on 2017/9/13.
 */
@Controller
@RequestMapping(value = "")
public class PageSearchController {

    @Resource
    SearchService searchService;

//    每页的商品数量
    private static final int PAGE_SIZE = 12;

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
        int begin = page * PAGE_SIZE;

        if(isCate){                          //按分类查询
            List<SearchProducts> products =  searchService.getProductsByCate(minPrice, maxPrice, keywords, newOrHot, lowOrHigh, begin, PAGE_SIZE);
            System.out.println("产品数量:"+products.size());
            modelMap.addAttribute("products", products);
            modelMap.addAttribute("newOrHot",newOrHot);
            modelMap.addAttribute("lowOrHigh",lowOrHigh);
            modelMap.addAttribute("isCate", isCate);
            return "search";
        }else{                               //按关键字查询
            List<SearchProducts> products =  searchService.getProductsByTitle(keywords, begin, PAGE_SIZE);
            modelMap.addAttribute("products", products);
            modelMap.addAttribute("newOrHot",newOrHot);
            modelMap.addAttribute("lowOrHigh",lowOrHigh);
            modelMap.addAttribute("isCate", isCate);
            return "search";
        }
    }

}
