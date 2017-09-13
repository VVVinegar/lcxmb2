package LCXMB.controller;

import LCXMB.pojo.Msg;
import LCXMB.pojo.Pro_comment;
import LCXMB.pojo.Product;
import LCXMB.pojo.User_login;
import LCXMB.service.CommentService;
import LCXMB.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by 759517209@qq.com on 2017/9/8.
 */
@Controller
@RequestMapping(value = "/api")
public class Top10Controller {
    @Resource
    UserService userService;

    @Resource
    CommentService commentService;

    @ResponseBody
    @RequestMapping(value = "/top10/new", method = RequestMethod.GET)
    public Msg top10() {
        return Msg.success("");
    }
}
