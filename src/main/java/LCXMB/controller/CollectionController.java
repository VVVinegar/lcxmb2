package LCXMB.controller;

import LCXMB.pojo.Msg;
import LCXMB.service.CollectionService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;

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


//        collectionService.addCollection()



        return Msg.success("");
    }

}
