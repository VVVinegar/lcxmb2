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
    public Msg login(boolean isCate, String keywords, int orderType, int minPrice, int maxPrice, boolean isDesc, int page){
        if(isCate){                          //按分类查询
            searchService.getProductsByCate(minPrice, maxPrice,keywords, orderType, isDesc, page);
        }else{                               //按关键字查询

        }
        return Msg.fail("服务器错误");
    }

}
