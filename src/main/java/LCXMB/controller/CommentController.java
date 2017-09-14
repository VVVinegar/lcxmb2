package LCXMB.controller;

import LCXMB.pojo.Msg;
import LCXMB.pojo.Pro_comment;
import LCXMB.service.CommentService;
import LCXMB.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by 759517209@qq.com on 2017/9/8.
 */
@Controller
@RequestMapping(value = "/api")
public class CommentController {
    @Resource
    UserService userService;

    @Resource
    CommentService commentService;

    @ResponseBody
    @RequestMapping(value = "/comment", method = RequestMethod.POST)
    public Msg comment(String replyer, String content, int proId,
                       HttpSession session) {
        Object username = session.getAttribute("username");
        if (username == null) {
            return Msg.fail("您还未登录，请先登录");
        } else {

            String avatar = userService.findById(username.toString()).getAvatarUrl();
            Pro_comment comment = new Pro_comment();
            comment.setProId(proId);
            comment.setCommenter(username.toString());
            comment.setReplyer(replyer);
            comment.setCommenterAvatar(avatar);
            comment.setContent(content);
            Date date = new Date();
            Timestamp ts = new Timestamp(date.getTime());
            comment.setCreateTime(ts);
            int status = commentService.insert(comment);
            System.out.println(status);

            return Msg.success("评论成功").add("status", status);
        }
    }
}
