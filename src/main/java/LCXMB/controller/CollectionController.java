package LCXMB.controller;

import LCXMB.pojo.Collections;
import LCXMB.pojo.Msg;
import LCXMB.service.CollectionService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by 759517209@qq.com on 2017/9/14.
 */
@Controller
@RequestMapping(value = "/api")
public class CollectionController {

    @Resource
    CollectionService collectionService;

    @RequestMapping(value = "/collection", method = RequestMethod.POST)
    public Msg addCollection(String username, int pro_id){
        if(collectionService.isExists(username, pro_id) == null) return Msg.success("已收藏").add("status",1);

        Date date = new Date();
        Timestamp timeStamp = new Timestamp(date.getTime());

        Collections collections = new Collections(username, pro_id, timeStamp);

        if(collectionService.addCollection(collections)>0){
            return Msg.success("收藏成功").add("status",0);
        }
        return Msg.fail("服务器发生错误");
    }

}
