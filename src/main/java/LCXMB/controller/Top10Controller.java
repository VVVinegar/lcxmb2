package LCXMB.controller;

import LCXMB.pojo.Msg;
import LCXMB.pojo.Product;
import LCXMB.service.Top10Service;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 759517209@qq.com on 2017/9/8.
 */
@Controller
@RequestMapping(value = "/api")
public class Top10Controller {
    @Resource
    Top10Service top10Service;

    @ResponseBody
    @RequestMapping(value = "/top10/new", method = RequestMethod.GET)
    public Msg top10new() {
        List<Product> list = top10Service.getNewProducts();
        return Msg.success("").add("list", list);
    }

    @ResponseBody
    @RequestMapping(value = "/top10/hot", method = RequestMethod.GET)
    public Msg top10hot() {
        List<Product> list = top10Service.getHotProducts();
        return Msg.success("").add("list", list);
    }

    @ResponseBody
    @RequestMapping(value = "/top10/desc", method = RequestMethod.GET)
    public Msg top10desc() {
        List<Product> list = top10Service.getDescProducts();
        return Msg.success("").add("list", list);
    }
}