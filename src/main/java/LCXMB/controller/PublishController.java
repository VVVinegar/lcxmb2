package LCXMB.controller;

import LCXMB.pojo.Msg;
import LCXMB.pojo.Product;
import LCXMB.service.ProductService;
import LCXMB.service.PublishService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.Writer;
import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by 759517209@qq.com on 2017/9/12.
 */
@Controller
@RequestMapping(value = "/api")
public class PublishController {

    @Resource
    PublishService publishService;

    @Resource
    ProductService productService;

    @RequestMapping(value = "/publish", method = RequestMethod.POST)
    @ResponseBody
    public Msg publish(@RequestBody Product product, HttpSession session){

        String username = null;

        if (session.getAttribute("username") != null){
            username = session.getAttribute("username").toString();
        }else{
            return Msg.success("请先登录").add("status", 1);
        }

        product.setSalerUser(username);

        product.setPriceChanged((float) 0);
        product.setWatchCount(0);
        product.setStatus(0);

        Date date = new Date();
        Timestamp timeStamp = new Timestamp(date.getTime());
        product.setCreateTime(timeStamp);
        product.setUpdateTime(timeStamp);

        if (publishService.publish(product)){
            int pro_id = product.getId();
            return Msg.success("上架成功").add("id", pro_id);
        }

        return Msg.fail("上架失败");

    }

    @RequestMapping(value = "/publish/update", method = RequestMethod.POST)
    @ResponseBody
    public Msg publishUpdate(Integer id, String title, String category1, String category2,
                             String telNum, Float price, Float quality,
                             String imgUrls, String desciption, HttpSession session){

        String username = null;

        if (session.getAttribute("username") != null){
            username = session.getAttribute("username").toString();
        } else{
            return Msg.success("请先登录").add("status", 1);
        }

        Product product = productService.findById(id);

        product.setTitle(title);
        product.setCategory1(category1);
        product.setCategory2(category2);
        product.setTelNum(telNum);
        product.setQuality(quality);
        product.setImgUrls(imgUrls);
        product.setDesciption(desciption);
        product.setPriceChanged(product.getPrice() - price);
        product.setPrice(price);

        int status = productService.update(product);
        int pro_id = product.getId();

        return Msg.success("").add("status", status).add("id", pro_id);
    }
}
