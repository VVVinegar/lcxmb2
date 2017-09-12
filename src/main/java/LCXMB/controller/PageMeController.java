package LCXMB.controller;

import LCXMB.pojo.User_info;
import LCXMB.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by 759517209@qq.com on 2017/9/10.
 */
@Controller
@RequestMapping("")
public class PageMeController {

    @Resource
    UserService userService;

    public User_info getUserinfo(String username){
        System.out.print(username);
        return userService.findById(username);
    }

    @RequestMapping(value = "/me")
    public String index(){
        return "redirect:/me/order";
    }

    @RequestMapping(value = "/me/order")
    public String order(HttpSession httpSession, ModelMap model){
        Object username = httpSession.getAttribute("username");
        if(username != null) {
            User_info user = getUserinfo(username.toString());
//            model.addAttribute("user", user);
            model.addAttribute("username1", user.getUsername());
        } else {
            return "/login";
        }

        model.addAttribute("subsite", "order");

        return "/me";
    }

    @RequestMapping(value = "/me/message")
    public String message(HttpSession httpSession, ModelMap model){
        Object username = httpSession.getAttribute("username");
        if(username != null) {
            model.addAttribute("user", getUserinfo(username.toString()));
        } else {
            return "/login";
        }

        model.addAttribute("subsite", "message");

        return "/me";
    }

    @RequestMapping(value = "/me/collect")
    public String collect(HttpSession httpSession, ModelMap model){
        Object username = httpSession.getAttribute("username");
        if(username != null) {
            model.addAttribute("user", getUserinfo(username.toString()));
        } else {
            return "/login";
        }

        model.addAttribute("subsite", "collect");

        return "/me";
    }
}
