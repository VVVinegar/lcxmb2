package LCXMB.controller;

import LCXMB.pojo.Msg;
import LCXMB.pojo.Product;
import LCXMB.service.PublishService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @RequestMapping(value = "/publish")
    @ResponseBody
    public Msg publish(@RequestBody Product product, HttpSession session){

        String username = null;

        if (session.getAttribute("username") != null){
            username = session.getAttribute("username").toString();
        }else{
            return Msg.success("请先登录").add("status", 1);
        }

        product.setSalerUser(username);

        product.setPriceChanged(0);
        product.setWatchCount(0);
        product.setStatus(0);

        Date date = new Date();
        Timestamp timeStamp = new Timestamp(date.getTime());
        product.setCreateTime(timeStamp);
        product.setUpdateTime(timeStamp);

        if (publishService.publish(product))
            return Msg.success("上架成功").add("status", 0);

        return Msg.fail("上架失败");

    }
}
